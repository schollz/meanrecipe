package main

import (
	"flag"
	"fmt"

	meanrecipe "github.com/schollz/meanrecipe/src"
)

func main() {
	var err error
	var recipe string
	var debug bool
	flag.StringVar(&recipe, "recipe", "", "recipe to average (e.g. 'chocolate chip cookies')")
	flag.BoolVar(&debug, "debug", false, "set debug")
	flag.Parse()

	if debug {
		meanrecipe.SetLogLevel("debug")
	} else {
		meanrecipe.SetLogLevel("info")
	}

	err = meanrecipe.Run(recipe)
	if err != nil {
		fmt.Println(err)
	}
}
