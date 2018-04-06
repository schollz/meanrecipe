package consensuscookery

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"path"

	"github.com/bugra/kmeans"
	log "github.com/cihub/seelog"
)

func Learn(folder string) (err error) {
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

	volumePairsMap := make(map[string]int)
	for _, recipe := range recipes {
		for pair := range recipe.VolumeRelations {
			volumePairsMap[pair] = 0
		}
	}
	volumePairs := make([]string, len(volumePairsMap))
	i := 0
	for pair := range volumePairsMap {
		volumePairs[i] = pair
		volumePairsMap[pair] = i
		i++
	}
	log.Debugf("got %d volume pairs", len(volumePairs))

	pairData := make([][]float64, len(recipes))
	recipeNum := make(map[int]int)
	i = 0
	for j, recipe := range recipes {
		x := make([]float64, len(volumePairs))
		for pair := range recipe.VolumeRelations {
			x[volumePairsMap[pair]] = recipe.VolumeRelations[pair]
		}
		if sum(x) == 0 {
			continue
		}
		pairData[i] = x
		recipeNum[i] = j
		i++
	}
	pairData = pairData[:i]
	fmt.Println(pairData)
	log.Debugf("got %d non-zero volume pairs", len(pairData))

	numClusters := 30
	labels, err := kmeans.Kmeans(pairData, numClusters, kmeans.SquaredEuclideanDistance, 10)
	fmt.Println(labels)
	clusters := make([]Cluster, numClusters)
	for i := 0; i < numClusters; i++ {
		clusters[i].ID = i
		clusters[i].VolumeRelations = make(map[string][]float64)
	}
	for i, label := range labels {
		recipeIndex := recipeNum[i]
		clusters[label].Recipes = append(clusters[label].Recipes, recipes[recipeIndex])
		for pair := range recipes[recipeIndex].VolumeRelations {
			if _, ok := clusters[label].VolumeRelations[pair]; !ok {
				clusters[label].VolumeRelations[pair] = []float64{}
			}
			clusters[label].VolumeRelations[pair] = append(clusters[label].VolumeRelations[pair], recipes[recipeIndex].VolumeRelations[pair])
		}
	}
	for i := 0; i < numClusters; i++ {
		clusters[i].NumRecipes = len(clusters[i].Recipes)
	}

	clustersB, _ := json.MarshalIndent(clusters, "", " ")
	ioutil.WriteFile(path.Join(folder, "clusters.json"), clustersB, 0644)
	return
}

func sum(f []float64) float64 {
	total := 0.0
	for _, g := range f {
		total += g
	}
	return total
}
