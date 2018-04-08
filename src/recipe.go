package meanrecipe

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"path"
	"path/filepath"

	log "github.com/cihub/seelog"
	"github.com/schollz/progressbar"
)

// GetALlRecipes will gather all recipes in a folder
func GetAllRecipes(folder string, requiredIngredients []string) (err error) {
	var files []string

	err = filepath.Walk(folder, func(path string, info os.FileInfo, err error) error {
		files = append(files, path)
		return nil
	})
	if err != nil {
		return
	}
	recipes := make([]Recipe, len(files))
	i := 0
	bar := progressbar.New(len(files))
	for _, file := range files {
		bar.Add(1)
		if filepath.Ext(file) == ".gz" {
			recipes[i], err = GenerateRecipe(file, requiredIngredients)
			if err == nil {
				i++
			} else {
				log.Debug(err)
			}
		}
	}
	recipes = recipes[:i]

	log.Infof("got %d recipes", len(recipes))
	bRecipes, _ := json.MarshalIndent(recipes, "", " ")
	err = ioutil.WriteFile(path.Join(folder, "recipes.json"), bRecipes, 0644)
	return
}

// GenerateRecipe will parse the recipe from a file
func GenerateRecipe(fname string, requiredIngredients []string) (r Recipe, err error) {
	fileBytes, err := readGzFile(fname)
	if err != nil {
		return
	}
	r.Filename = fname
	r.URL = string(bytes.Split(fileBytes, []byte("\n"))[0])
	r.Ingredients, err = ParseIngredients(fname)
	if err != nil {
		return
	}

	if len(requiredIngredients) > 0 {
		for _, ing := range requiredIngredients {
			if !r.HasIngredient(ing) {
				err = errors.New("recipe does not have " + ing)
				return
			}
		}
	}

	for i, ingredient := range r.Ingredients {
		r.Ingredients[i].Cups, err = normalizeIngredient(ingredient)
		if err != nil {
			log.Debug(err)
		}
	}

	// find volumetric pair-wise relationships
	r.VolumeRelations = make(map[string]float64)
	for _, ing1 := range r.Ingredients {
		for _, ing2 := range r.Ingredients {
			if ing1.Ingredient <= ing2.Ingredient || ing1.Cups == 0 || ing2.Cups == 0 {
				continue
			}
			r.VolumeRelations[fmt.Sprintf("%s-%s", ing1.Ingredient, ing2.Ingredient)] = ing1.Cups / ing2.Cups
		}
	}

	err = ioutil.WriteFile(fname+".json", []byte(r.String()), 0644)
	return
}
