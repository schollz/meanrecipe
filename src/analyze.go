package consensuscookery

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math"
	"math/rand"
	"path"

	log "github.com/cihub/seelog"
	"github.com/schollz/progressbar"
)

func AnalyzeClusters(folder string) (err error) {
	bClusters, err := ioutil.ReadFile(path.Join(folder, "clusters.json"))
	if err != nil {
		return
	}
	var clusters []Cluster
	err = json.Unmarshal(bClusters, &clusters)
	if err != nil {
		return
	}
	log.Debugf("loaded %d clusters", len(clusters))

	err = analyzeCluster(clusters[0])
	return
}

func analyzeCluster(cluster Cluster) (err error) {
	log.Debugf("analyzing cluster %d with %d recipes", cluster.ID, cluster.NumRecipes)
	// find ingredient with the most data
	startingIngredient := ""
	startingIngredientNum := 0
	for ing := range cluster.Ingredient {
		if cluster.Ingredient[ing].Number > startingIngredientNum {
			startingIngredientNum = cluster.Ingredient[ing].Number
			startingIngredient = ing
		}
	}
	log.Debugf("starting ingredient is %s (%d)", startingIngredient, startingIngredientNum)

	ingredientsToConsider := []string{}
	for ing := range cluster.Ingredient {
		if float64(cluster.Ingredient[ing].Number)/float64(cluster.NumRecipes) < 0.3 {
			continue
		}
		ingredientsToConsider = append(ingredientsToConsider, ing)
	}
	log.Debugf("ingredients to consider: %+v", ingredientsToConsider)

	startingVolume := cluster.Ingredient[startingIngredient].Average
	var r Recipe
	r.Ingredients = []Ingredient{Ingredient{
		Cups:       startingVolume,
		Ingredient: startingIngredient,
	}}
	ing1 := startingIngredient
	for _, ing2 := range ingredientsToConsider {
		var volumeRelation string
		var cups float64
		if ing1 > ing2 {
			volumeRelation = ing1 + "-" + ing2
			cups = startingVolume / cluster.IngredientRelations[volumeRelation].Average
		} else if ing1 < ing2 {
			volumeRelation = ing2 + "-" + ing1
			cups = cluster.IngredientRelations[volumeRelation].Average / startingVolume
		} else {
			continue
		}
		log.Debugf("%s: %2.1f", volumeRelation, cluster.IngredientRelations[volumeRelation].Average)
		r.Ingredients = append(r.Ingredients, Ingredient{
			Cups:       cups,
			Ingredient: ing2,
		})
	}
	log.Debugf("recipe: %+v", r)

	// try to improve the relationships between ingredients
	adjust := make([]float64, len(r.Ingredients))
	bestAdjust := adjust
	bestDifference := 10000000.0
	bar := progressbar.New(500000)
	for tries := 0; tries < 500000; tries++ {
		bar.Add(1)
		difference := 0.0
		index := rand.Intn(len(adjust))
		adjust[index] = (rand.Float64() - 0.5) * (rand.Float64() * 0.5) * r.Ingredients[index].Cups
		for i, ing1 := range r.Ingredients {
			for j, ing2 := range r.Ingredients {
				if ing1.Ingredient <= ing2.Ingredient || ing1.Cups == 0 || ing2.Cups == 0 {
					continue
				}
				volumeRelation := fmt.Sprintf("%s-%s", ing1.Ingredient, ing2.Ingredient)
				difference += math.Abs(cluster.IngredientRelations[volumeRelation].Average - (ing1.Cups+adjust[i])/(ing2.Cups+adjust[j]))
			}
		}
		if tries == 0 {
			log.Debugf("adjust: %+v, difference: %2.3f, bestDifference: %2.3f", adjust, difference, bestDifference)
		}
		if difference < bestDifference {
			bestDifference = difference
			bestAdjust = adjust
		}
		adjust = bestAdjust
	}
	log.Debugf("best difference: %2.4f", bestDifference)

	for i := range bestAdjust {
		r.Ingredients[i].Cups += bestAdjust[i]
	}
	log.Debugf("ingredients: %+v", r.Ingredients)

	return
}
