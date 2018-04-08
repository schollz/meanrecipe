package main

import (
	"flag"
	"fmt"
	"strings"

	"github.com/AlecAivazis/survey"
	meanrecipe "github.com/schollz/meanrecipe/src"
)

func main() {
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

	err = meanrecipe.Run(recipe, clusters, ingredientsToInclude, true)
	if err != nil {
		fmt.Println(err)
	}
}
