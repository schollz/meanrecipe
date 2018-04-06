package consensuscookery

import (
	"encoding/json"
	"io/ioutil"
	"path"
	"sort"

	"github.com/bugra/kmeans"
	log "github.com/cihub/seelog"
)

func CreateClusters(folder string) (err error) {
	bRecipes, err := ioutil.ReadFile(path.Join(folder, "recipes.json"))
	if err != nil {
		return
	}
	var recipes []Recipe
	err = json.Unmarshal(bRecipes, &recipes)
	if err != nil {
		return
	}
	log.Debugf("using %d recipes for learning", len(recipes))

	allIngredientsMap := make(map[string]int)
	for _, recipe := range recipes {
		for _, ing := range recipe.Ingredients {
			allIngredientsMap[ing.Ingredient] = 0
		}
	}
	allIngredients := make([]string, len(allIngredientsMap))
	i := 0
	for ing := range allIngredientsMap {
		allIngredients[i] = ing
		allIngredientsMap[ing] = i
		i++
	}
	log.Debugf("got %d ingredients", len(allIngredients))

	pairData := make([][]float64, len(recipes))
	recipeNum := make(map[int]int)
	i = 0
	for j, recipe := range recipes {
		x := make([]float64, len(allIngredients))
		for _, ing := range recipe.Ingredients {
			x[allIngredientsMap[ing.Ingredient]] = 1.0
		}
		if sum(x) == 0 {
			continue
		}
		pairData[i] = x
		recipeNum[i] = j
		i++
	}
	pairData = pairData[:i]
	log.Debugf("got %d non-zero volume pairs", len(pairData))

	numClusters := 30
	labels, err := kmeans.Kmeans(pairData, numClusters, kmeans.ManhattanDistance, 10)

	clusters := make([]Cluster, numClusters)
	for i := 0; i < numClusters; i++ {
		clusters[i].ID = i
		clusters[i].Ingredient = make(map[string]Collection)
		clusters[i].IngredientRelations = make(map[string]Collection)
	}
	for i, label := range labels {
		recipeIndex := recipeNum[i]
		clusters[label].Recipes = append(clusters[label].Recipes, recipes[recipeIndex])
		for pair := range recipes[recipeIndex].VolumeRelations {
			if _, ok := clusters[label].IngredientRelations[pair]; !ok {
				clusters[label].IngredientRelations[pair] = Collection{All: []float64{}}
			}
			clusters[label].IngredientRelations[pair] = Collection{
				All: append(clusters[label].IngredientRelations[pair].All, recipes[recipeIndex].VolumeRelations[pair]),
			}
		}
		for _, ing := range recipes[recipeIndex].Ingredients {
			if _, ok := clusters[label].Ingredient[ing.Ingredient]; !ok {
				clusters[label].Ingredient[ing.Ingredient] = Collection{All: []float64{}}
			}
			clusters[label].Ingredient[ing.Ingredient] = Collection{
				All: append(clusters[label].Ingredient[ing.Ingredient].All, ing.Cups),
			}
		}
	}
	for i := 0; i < numClusters; i++ {
		clusters[i].NumRecipes = len(clusters[i].Recipes)
		for key := range clusters[i].Ingredient {
			clusters[i].Ingredient[key] = ProcessCollection(clusters[i].Ingredient[key])
		}
		for key := range clusters[i].IngredientRelations {
			clusters[i].IngredientRelations[key] = ProcessCollection(clusters[i].IngredientRelations[key])
		}
	}

	// sort clusters by the number of recipes
	sort.Slice(clusters, func(i, j int) bool {
		return clusters[i].NumRecipes > clusters[j].NumRecipes
	})

	clustersB, err := json.MarshalIndent(clusters, "", " ")
	if err != nil {
		return
	}
	err = ioutil.WriteFile(path.Join(folder, "clusters.json"), clustersB, 0644)
	log.Debugf("written to %s", path.Join(folder, "clusters.json"))
	return
}

func sum(f []float64) float64 {
	total := 0.0
	for _, g := range f {
		total += g
	}
	return total
}
