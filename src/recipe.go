package meanrecipe

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"path"
	"path/filepath"
	"runtime"
	"sort"

	log "github.com/cihub/seelog"
	"github.com/schollz/progressbar"
)

// GetALlRecipes will gather all recipes in a folder
func GetAllRecipes(folder string) (err error) {
	var files []string

	err = filepath.Walk(folder, func(path string, info os.FileInfo, err error) error {
		files = append(files, path)
		return nil
	})
	if err != nil {
		return
	}
	log.Infof("parsing %d prospective recipes", len(files))

	type Job struct {
		file string
	}
	type Result struct {
		recipe Recipe
		err    error
	}
	jobs := make(chan Job, len(files))
	results := make(chan Result, len(files))

	workers := runtime.NumCPU() * 2
	for w := 1; w <= workers; w++ {
		go func(jobs <-chan Job, results chan<- Result) {
			// generate sha256 filename
			for j := range jobs {
				var r Result
				r.recipe, r.err = GenerateRecipe(j.file)
				if err != nil {
					log.Debug(err)
				}
				results <- r
			}

		}(jobs, results)
	}

	for _, file := range files {
		jobs <- Job{
			file: file,
		}
	}

	bar := progressbar.New(len(files))
	recipes := make([]Recipe, len(files))
	i := 0
	for j := 0; j < len(files); j++ {
		bar.Add(1)
		r := <-results
		if r.err == nil {
			recipes[i] = r.recipe
			i++
		}
	}
	fmt.Print("\n")

	recipes = recipes[:i]

	log.Infof("got %d recipes", len(recipes))
	bRecipes, _ := json.MarshalIndent(recipes, "", " ")
	err = ioutil.WriteFile(path.Join(folder, "recipes.json"), bRecipes, 0644)
	return
}

// GenerateRecipe will parse the recipe from a file
func GenerateRecipe(fname string) (r Recipe, err error) {
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

	for i, ingredient := range r.Ingredients {
		r.Ingredients[i].Cups, err = normalizeIngredient(ingredient)
		if err != nil {
			log.Debug(err)
		}
	}

	// find volumetric pair-wise relationships
	r.VolumeRelations = make(map[string]float64)
	for _, ing1 := range r.Ingredients {
		if ing1.Cups == 0 {
			continue
		}
		for _, ing2 := range r.Ingredients {
			if ing2.Cups == 0 || ing1.Ingredient <= ing2.Ingredient {
				continue
			}
			r.VolumeRelations[fmt.Sprintf("%s-%s", ing1.Ingredient, ing2.Ingredient)] = ing1.Cups / ing2.Cups
		}
	}

	// sort ingredients alphabetically
	sort.Slice(r.Ingredients[:], func(i, j int) bool {
		return r.Ingredients[i].Ingredient < r.Ingredients[j].Ingredient
	})

	err = ioutil.WriteFile(fname+".json", []byte(r.String()), 0644)
	return
}
