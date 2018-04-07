package meanrecipe

import (
	"encoding/json"
	"io/ioutil"
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestParseIngredients(t *testing.T) {
	defer log.Flush()
	testFile := "testing/chocolate_chips.gz"
	ingredients, err := ParseIngredients(testFile)
	assert.Nil(t, err)
	ingredientsMarshaled, _ := json.MarshalIndent(ingredients, "", " ")
	ingredientsPreviouslyMarshaled, errOpen := ioutil.ReadFile(testFile + ".ingredients.json")
	if errOpen != nil {
		ioutil.WriteFile(testFile+".ingredients.json", ingredientsMarshaled, 0644)
		ingredientsPreviouslyMarshaled = ingredientsMarshaled
	}
	assert.Equal(t, string(ingredientsPreviouslyMarshaled), string(ingredientsMarshaled))
}

func TestParseIngredientFromLine(t *testing.T) {
	ingredient, err := parseIngredientFromLine("-   1 1/4 cups all-purpose flour")
	assert.Nil(t, err)
	assert.Equal(t, "cup", ingredient.Measure)
	assert.Equal(t, "flour", ingredient.Ingredient)
	assert.Equal(t, 1.25, ingredient.Amount)
}
