package main

import (
	"flag"
	"fmt"

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

	if debug {
		meanrecipe.SetLogLevel("debug")
	} else {
		meanrecipe.SetLogLevel("info")
	}

	err = meanrecipe.Run(recipe, clusters, true)
	if err != nil {
		fmt.Println(err)
	}
}
