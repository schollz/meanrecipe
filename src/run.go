package meanrecipe

import (
	"errors"
	"os"
	"path"
	"strings"

	log "github.com/cihub/seelog"
	"github.com/schollz/googleit"
)

func Run(recipe string, clusters int, requiredIngredients []string, determineRequiredIngredientsFromTitle bool) (err error) {
	defer log.Flush()
	recipe = singularlize(strings.TrimSpace(strings.ToLower(recipe)))
	if len(recipe) == 0 {
		err = errors.New("must specify a recipe")
		return
	}
	// create a directory
	folder := strings.Replace(strings.ToLower(recipe), " ", "_", -1)
	folder = path.Join("recipes", folder)
	os.MkdirAll(folder, 0755)

	if _, errExists := os.Stat(path.Join(folder, "recipes.json")); os.IsNotExist(errExists) {
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

	// generate recipes.json
	log.Info("getting all recipes")
	err = GetAllRecipes(folder)
	if err != nil {
		return
	}

	if determineRequiredIngredientsFromTitle {
		moreRequiredIngredients := DetermineIngredients(recipe)
		if len(moreRequiredIngredients) > 0 {
			requiredIngredients = append(requiredIngredients, moreRequiredIngredients...)
		}
	}
	if len(requiredIngredients) > 0 {
		requiredIngredients = googleit.ListToSet(requiredIngredients)
		log.Infof("requiring %d ingredients: %+v", len(requiredIngredients), requiredIngredients)
	}

	log.Info("creating clusters recipes")
	err = CreateClusters(folder, clusters, requiredIngredients)
	if err != nil {
		return
	}

	log.Info("analyzing clusters")
	err = AnalyzeClusters(folder)
	if err != nil {
		return
	}
	return
}
