package meanrecipe

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"math"
	"math/rand"
	"path"
	"sort"

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

	totalRecipes := 0
	for i := range clusters {
		totalRecipes += clusters[i].NumRecipes
	}
	meanRecipes := []Recipe{}
	for i := 0; i < 30; i++ {
		if clusters[i].NumRecipes < 10 {
			continue
		}
		r, errC := analyzeCluster(clusters[i])
		if errC != nil {
			continue
		}
		sort.Slice(r.Ingredients[:], func(i, j int) bool {
			return r.Ingredients[i].Ingredient < r.Ingredients[j].Ingredient
		})
		fmt.Printf("\n### cluster %d, %d%% recipes (%d)\n\n", i+1, 100*clusters[i].NumRecipes/totalRecipes, clusters[i].NumRecipes)
		fmt.Println(r.IngredientText())
		meanRecipes = append(meanRecipes, r)
	}

	meanRecipesBytes, _ := json.MarshalIndent(meanRecipes, "", " ")
	ioutil.WriteFile(path.Join(folder, "mean_recipes.json"), meanRecipesBytes, 0644)
	log.Infof("wrote analyzed recipes to %s", path.Join(folder, "mean_recipes.json"))
	return
}

func analyzeCluster(cluster Cluster) (r Recipe, err error) {
	log.Debugf("analyzing cluster %d with %d recipes", cluster.ID, cluster.NumRecipes)
	// prune ingredients that don't have enough recipes
	for ing := range cluster.Ingredient {
		if float64(cluster.Ingredient[ing].Number)/float64(cluster.NumRecipes) < 0.3 {
			delete(cluster.Ingredient, ing)
		}
	}
	// find ingredient with the most data
	startingIngredient := ""
	startingIngredientNum := 0.0
	for ing := range cluster.Ingredient {
		// check that ingredient has relations to other ingredients
		hasAllIngredients := true
		for ing2 := range cluster.Ingredient {
			var volumeRelation string
			if ing > ing2 {
				volumeRelation = ing + "-" + ing2
			} else if ing < ing2 {
				volumeRelation = ing2 + "-" + ing
			} else {
				continue
			}
			if cluster.Ingredient[ing].Average == 0 || cluster.Ingredient[ing2].Average == 0 {
				continue
			}
			if _, ok := cluster.IngredientRelations[volumeRelation]; !ok {
				hasAllIngredients = false
				break
			}
		}
		if !hasAllIngredients {
			continue
		}

		if cluster.Ingredient[ing].Average > startingIngredientNum {
			startingIngredientNum = cluster.Ingredient[ing].Average
			startingIngredient = ing
		}
	}
	if startingIngredient == "" {
		err = errors.New("could not find comparision ingredient")
		return
	}
	log.Debugf("starting ingredient is %s (%2.5f)", startingIngredient, startingIngredientNum)

	ingredientsToConsider := []string{}
	for ing := range cluster.Ingredient {
		ingredientsToConsider = append(ingredientsToConsider, ing)
	}
	log.Debugf("ingredients to consider: %+v", ingredientsToConsider)

	startingVolume := cluster.Ingredient[startingIngredient].Average
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
			cups = startingVolume * cluster.IngredientRelations[volumeRelation].Average
		} else {
			continue
		}
		log.Debugf("%s: %2.5f +/- %2.5f", volumeRelation, cluster.IngredientRelations[volumeRelation].Average, cluster.IngredientRelations[volumeRelation].SD)
		r.Ingredients = append(r.Ingredients, Ingredient{
			Cups:       cups,
			Ingredient: ing2,
		})
	}

	// try to improve the relationships between ingredients
	adjust := make([]float64, len(r.Ingredients))
	bestAdjust := adjust
	bestDifference := 10000000.0
	bar := progressbar.New(0)
	for tries := 0; tries < 0; tries++ {
		bar.Add(1)
		difference := 0.0
		for i, ing1 := range r.Ingredients {
			for j, ing2 := range r.Ingredients {
				volumeRelation := fmt.Sprintf("%s-%s", ing1.Ingredient, ing2.Ingredient)
				if ing1.Ingredient <= ing2.Ingredient || ing1.Cups == 0 || ing2.Cups == 0 || cluster.IngredientRelations[volumeRelation].Average == 0 {
					continue
				}
				difference += math.Pow(math.Abs(cluster.IngredientRelations[volumeRelation].Average-(ing1.Cups+adjust[i])/(ing2.Cups+adjust[j])), 2)
			}
		}
		if difference < bestDifference {
			log.Debugf("difference: %2.3f, bestDifference: %2.3f", difference, bestDifference)
			bestDifference = difference
			bestAdjust = adjust
		}
		adjust = bestAdjust
		index := rand.Intn(len(adjust))
		adjust[index] += (rand.Float64() - 0.5) * (rand.Float64() * 0.05) * r.Ingredients[index].Cups
	}
	log.Debugf("best difference: %2.4f", bestDifference)

	for i := range bestAdjust {
		r.Ingredients[i].Cups += bestAdjust[i]
	}

	for i := range r.Ingredients {
		amount, measure, amountStr, _ := determineMeasurementsFromCups(r.Ingredients[i].Cups)
		r.Ingredients[i].Amount = amount
		r.Ingredients[i].Measure = measure
		r.Ingredients[i].OriginalLine = fmt.Sprintf("%s %s %s", amountStr, measure, r.Ingredients[i].Ingredient)
	}

	log.Debugf("ingredients: %+v", r.Ingredients)

	return
}
