package main

import (
	"bufio"
	"flag"
	"fmt"
	"os"
	"strings"

	"github.com/AlecAivazis/survey"
	wordwrap "github.com/mitchellh/go-wordwrap"
	meanrecipe "github.com/schollz/meanrecipe/src"
)

func main() {

	fmt.Print(`
	 ___ ___    ___   ____  ____       ____     ___    __  ____  ____   ___ 
	|   |   |  /  _] /    ||    \     |    \   /  _]  /  ]|    ||    \ /  _]
	| _   _ | /  [_ |  o  ||  _  |    |  D  ) /  [_  /  /  |  | |  o  )  [_ 
	|  \_/  ||    _]|     ||  |  |    |    / |    _]/  /   |  | |   _/    _]
	|   |   ||   [_ |  _  ||  |  |    |    \ |   [_/   \_  |  | |  | |   [_ 
	|   |   ||     ||  |  ||  |  |    |  .  \|     \     | |  | |  | |     |
	|___|___||_____||__|__||__|__|    |__|\_||_____|\____||____||__| |_____|`)
	fmt.Print(`
                  _  _
                _/0\/ \_
        .-.   .-` + "`" + ` \_/\0/ '-.
       /:::\ / ,_________,  \
      /\:::/ \  '. (:::/  ` + "`" + `'-;
      \ ` + "`" + `-'` + "`" + `\ '._ ` + "`" + `"'"'\__    \
      ` + "`" + `'-.  \   ` + "`" + `)-=-=(  ` + "`" + `,   |
          \  ` + "`" + `-"` + "`" + `      ` + "`" + `"-` + "`" + `   /


`)
	var err error
	var recipe, include string
	var clusters int
	var debug bool
	flag.StringVar(&recipe, "recipe", "", "recipe to average (e.g. 'chocolate chip cookies')")
	flag.StringVar(&include, "include", "", "ingredients to include")
	flag.BoolVar(&debug, "debug", false, "set debug")
	flag.IntVar(&clusters, "clusters", 30, "number of clusters to generate")
	flag.Parse()

	if len(recipe) == 0 {
		// the questions to ask
		var qs = []*survey.Question{
			{
				Name:      "recipe",
				Prompt:    &survey.Input{Message: "What recipe (e.g. chocolate chip cookies)?"},
				Validate:  survey.Required,
				Transform: survey.Title,
			},
		} // the answers will be written to this struct
		answers := struct {
			Recipe string // survey will match the question and field names
		}{}

		// perform the questions
		err = survey.Ask(qs, &answers)
		if err != nil {
			fmt.Println(err.Error())
			return
		}
		recipe = strings.ToLower(strings.TrimSpace(answers.Recipe))
	}

	if debug {
		meanrecipe.SetLogLevel("debug")
	} else {
		meanrecipe.SetLogLevel("info")
	}

	ingredientsToInclude := []string{}
	if len(include) > 0 {
		for _, word := range strings.Split(include, ",") {
			ingredientsToInclude = append(ingredientsToInclude, strings.ToLower(strings.TrimSpace(word)))
		}
	}

	meanRecipes, err := meanrecipe.Run(recipe, clusters, ingredientsToInclude, true)
	if err != nil {
		fmt.Println("ERROR", err.Error())
		return
	}
	fmt.Println(`
	 ____     ___  _____ __ __  _     ______  _____
	|    \   /  _]/ ___/|  |  || |   |      |/ ___/
	|  D  ) /  [_(   \_ |  |  || |   |      (   \_ 
	|    / |    _]\__  ||  |  || |___|_|  |_|\__  |
	|    \ |   [_ /  \ ||  :  ||     | |  |  /  \ |
	|  .  \|     |\    ||     ||     | |  |  \    |
	|__|\_||_____| \___| \__,_||_____| |__|   \___|
												   
	`)
	for _, r := range meanRecipes {
		fmt.Println("\n->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->\n\n")
		fmt.Println(r.Title)
		if len(r.HasRareIngredients) > 0 || len(r.MissingCommonIngredients) > 0 {
			fmt.Println("Variation: ")
		}
		for _, ing := range r.HasRareIngredients {
			fmt.Printf(" +%s", ing)
		}
		for _, ing := range r.MissingCommonIngredients {
			fmt.Printf(" -%s", ing)
		}
		fmt.Println("\n\nIngredients:")
		fmt.Println(r.IngredientText())
		fmt.Println("Directions:")
		for i, direction := range r.Directions {
			fmt.Printf("%d. %s\n\n", i+1, wordwrap.WrapString(direction, 65))
		}
		urls := strings.Split(r.URL, ",")
		if len(urls) > 10 {
			urls = urls[:10]
		}
		fmt.Println(strings.Join(urls, "\n"))
	}
	fmt.Println("->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->")

	common, rare := meanrecipe.GetIngredientFrequencies(meanRecipes)
	fmt.Printf("common ingredients: %+v\n", common)
	fmt.Printf("rare ingredients: %+v\n", rare)

	// wait before exit
	fmt.Println("Press any key to exit...")
	buf := bufio.NewReader(os.Stdin)
	buf.ReadBytes('\n')
}
