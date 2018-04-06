package consensuscookery

import (
	"encoding/json"
	"errors"
	"io/ioutil"
)

var gramConversions = map[string]float64{
	"ounce": 28.3495,
	"gram":  1,
	"pound": 453.592,
}

var conversionToCup = map[string]float64{
	"tablespoon": 0.0625,
	"teaspoon":   0.020833,
	"cup":        1.0,
	"pint":       2.0,
	"quart":      4.0,
	"gallon":     16.0,
	"milliliter": 0.00423,
}
var ingredientToCups = map[string]float64{
	"eggs": 0.25,
}

var densities map[string]float64

func init() {
	b, err := ioutil.ReadFile("data/ingredient_densities.json")
	if err != nil {
		panic(err)
	}
	err = json.Unmarshal(b, &densities)
	if err != nil {
		panic(err)
	}
}

// normalizeIngredient will try to normalize the ingredient to 1 cup
func normalizeIngredient(ing Ingredient) (cups float64, err error) {
	if _, ok := ingredientToCups[ing.Ingredient]; ok {
		// special ingredients
		cups = ing.Amount * ingredientToCups[ing.Ingredient]
	} else if _, ok := conversionToCup[ing.Measure]; ok {
		// check if it has a standard volume measurement
		cups = float64(ing.Amount) * conversionToCup[ing.Measure]
	} else if _, ok := gramConversions[ing.Measure]; ok {
		// check if it has a standard weight measurement
		var density float64
		density, ok = densities[ing.Ingredient]
		if !ok {
			density = 200 // grams / cup
		}
		cups = ing.Amount * gramConversions[ing.Measure] / density
	} else {
		err = errors.New("could not convert weight or volume")
	}
	return
}
