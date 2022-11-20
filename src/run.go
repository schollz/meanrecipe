package meanrecipe

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"path"
	"strings"

	log "github.com/cihub/seelog"
	"github.com/schollz/googleit"
)

const rareIngredientCutoff = 0.5
const commonIngredientCutoff = 0.6

func HasRecipe(recipe string) (yes bool) {
	recipe = Singularlize(strings.TrimSpace(strings.ToLower(recipe)))

	folder := strings.Replace(strings.ToLower(recipe), " ", "_", -1)
	folder = path.Join("recipes", folder)
	gzFiles, err := ListGzFiles(folder)
	if err != nil {
		return false
	}
	if len(gzFiles) < 200 {
		return false
	}
	if _, errOpen := os.Stat(path.Join(folder, "recipes.json")); os.IsNotExist(errOpen) {
		return false
	}
	return true
}

func Run(recipe string, clusters int, requiredIngredients []string, determineRequiredIngredientsFromTitle bool) (meanRecipes []Recipe, err error) {
	defer log.Flush()
	recipe = Singularlize(strings.TrimSpace(strings.ToLower(recipe)))
	if len(recipe) == 0 {
		err = errors.New("must specify a recipe")
		return
	}
	if _, ok := ingredientMap[recipe]; ok {
		err = errors.New("recipe cannot be ingredient")
		return
	}
	// create a directory
	folder := strings.Replace(strings.ToLower(recipe), " ", "_", -1)
	folder = path.Join("recipes", folder)
	os.MkdirAll(folder, 0755)

	files, err := ListGzFiles(folder)
	if err != nil || len(files) == 0 {
		// get urls
		queries := []string{"best XX recipe", "favorite XX recipe", "homemade XX recipe", "simple recipe for XX", "basic XX recipe", "recipe for XX from scratch", "yummy XX recipe"}
		for _, query := range queries {
			query = strings.Replace(query, "XX", recipe, 1)
			log.Infof("querying urls for '%s'", query)
			urls, errSearch := googleit.Search(query)
			if errSearch != nil {
				err = errSearch
				log.Warn(err)
			}
			log.Infof("found %d urls for '%s'", len(urls), query)
			errDownload := DownloadAll(folder, urls)
			if errDownload != nil {
				err = errDownload
				return
			}
		}
	}

	haveRecipes := true
	if _, errOpen := os.Stat(path.Join(folder, "recipes.json")); os.IsNotExist(errOpen) {
		haveRecipes = false
	}
	gzFiles, _ := ListGzFiles(folder)
	jsonFiles, _ := ListJSONFiles(folder)
	if len(jsonFiles) < len(gzFiles) {
		haveRecipes = false
	}
	if !haveRecipes {
		// generate recipes.json
		log.Info("getting all recipes")
		err = GetAllRecipes(folder)
		if err != nil {
			return
		}
	}

	if determineRequiredIngredientsFromTitle {
		moreRequiredIngredients := DetermineIngredients(recipe)
		for _, ing := range moreRequiredIngredients {
			ing=strings.TrimSpace(ing)
			if len(ing)>2 {
				requiredIngredients=append(requiredIngredients,ing)
			}
		}
	}
	if len(requiredIngredients) > 0 {
		requiredIngredients = []string{}
		ring := googleit.ListToSet(requiredIngredients)
		for _,ing := range ring {
			ing = Singularlize(ing)
			ing = strings.TrimSpace(ing)
			if len(ing)>2 {
				requiredIngredients=append(requiredIngredients,ing)
			}
		}
		log.Infof("requiring %d ingredients: %+v", len(requiredIngredients), requiredIngredients)
	}

	log.Infof("finding best clusters for '%s'", recipe)
	mostRecipes := 0
	for i := 0; i < 5; i++ {
		err = CreateClusters(folder, clusters, requiredIngredients)
		if err != nil {
			return
		}

		var meanRecipesFromCluster []Recipe
		meanRecipesFromCluster, err = AnalyzeClusters(folder)
		if err != nil {
			return
		}
		if len(meanRecipesFromCluster) > mostRecipes {
			mostRecipes = len(meanRecipesFromCluster)
			meanRecipes = meanRecipesFromCluster
		}
	}

	// find frequency of each ingredient in the cluster
	ingredientCounts := make(map[string]float64)
	for _, r := range meanRecipes {
		for _, ing := range r.Ingredients {
			if _, ok := ingredientCounts[ing.Ingredient]; !ok {
				ingredientCounts[ing.Ingredient] = 0.0
			}
			ingredientCounts[ing.Ingredient]++
		}
	}
	log.Debugf("ingredientCounts: %+v", ingredientCounts)
	for j, r := range meanRecipes {
		r.HasRareIngredients = []string{}
		r.MissingCommonIngredients = []string{}
		ingredientsInRecipe := make(map[string]struct{})
		for i, ing := range r.Ingredients {
			ingredientsInRecipe[ing.Ingredient] = struct{}{}
			r.Ingredients[i].FrequencyInCluster = ingredientCounts[ing.Ingredient] / float64(len(meanRecipes))
			if r.Ingredients[i].FrequencyInCluster <= rareIngredientCutoff {
				meanRecipes[j].HasRareIngredients = append(meanRecipes[j].HasRareIngredients, ing.Ingredient)
			}
		}
		for commonIngredient := range ingredientCounts {
			if ingredientCounts[commonIngredient]/float64(len(meanRecipes)) < commonIngredientCutoff {
				continue
			}
			if _, ok := ingredientsInRecipe[commonIngredient]; !ok {
				meanRecipes[j].MissingCommonIngredients = append(meanRecipes[j].MissingCommonIngredients, commonIngredient)
			}
		}
	}

	// get directions
	log.Infof("getting directions for %d recipes for %s", len(meanRecipes), recipe)
	for j := range meanRecipes {
		directionsName := fmt.Sprintf("recipe-directions-%s-%s.json",
			strings.Replace(strings.Join(meanRecipes[j].HasRareIngredients, " "), " ", "-", -1),
			strings.Replace(strings.Join(meanRecipes[j].MissingCommonIngredients, " "), " ", "-", -1),
		)
		log.Debugf("getting directions for recipe %d (%s)", j, directionsName)
		if _, errOpen := os.Stat(path.Join(folder, directionsName)); !os.IsNotExist(errOpen) {
			bDirections, _ := ioutil.ReadFile(path.Join(folder, directionsName))
			err = json.Unmarshal(bDirections, &meanRecipes[j].Directions)
			if err == nil {
				log.Debugf("got directions from %s", directionsName)
				continue
			} else {
				log.Warn(err)
			}
		}

		meanRecipes[j].Directions, err = GetDirections(recipe, meanRecipes[j].HasRareIngredients, meanRecipes[j].MissingCommonIngredients)
		if err != nil {
			log.Debugf("could not get directions for %d, because of %s", j, err.Error())
		} else {
			bDirections, _ := json.Marshal(meanRecipes[j].Directions)
			ioutil.WriteFile(path.Join(folder, directionsName), bDirections, 0644)
		}

	}

	return
}

func GetIngredientFrequencies(meanRecipes []Recipe) (commonIngredients []string, rareIngredients []string) {
	commonIngredients = []string{}
	rareIngredients = []string{}

	// find frequency of each ingredient in the cluster
	ingredientCounts := make(map[string]float64)
	for _, r := range meanRecipes {
		for _, ing := range r.Ingredients {
			if ing.Ingredient == "" {
				continue
			}
			if _, ok := ingredientCounts[ing.Ingredient]; !ok {
				ingredientCounts[ing.Ingredient] = 0.0
			}
			ingredientCounts[ing.Ingredient]++
		}
	}

	for ingredient := range ingredientCounts {
		if ingredientCounts[ingredient]/float64(len(meanRecipes)) >= commonIngredientCutoff {
			commonIngredients = append(commonIngredients, ingredient)
		} else if ingredientCounts[ingredient]/float64(len(meanRecipes)) < rareIngredientCutoff {
			rareIngredients = append(rareIngredients, ingredient)
		}
	}
	return
}
