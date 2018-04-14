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

func TestParseIngredientTable(t *testing.T) {
	SetLogLevel("info")
	tables := []struct {
		line       string
		measure    string
		ingredient string
		amount     float64
		cups       float64
	}{
		{"* 2 whole large eggs", "", "egg", 2.0, 0.5},
		{"- 5 cloves garlic", "", "garlic", 5, 5 * 0.0280833},
		{"-   1 1/4 cups all-purpose flour", "cup", "flour", 1.25, 1.25},
		{"-   1 whole sweet potato", "", "sweet potato", 1, 1},
		{"- 1 1/2 cup gluten free all-purpose flour", "cup", "gluten-free flour", 1.5, 1.5},
	}

	for _, table := range tables {
		ingredient, err := parseIngredientFromLine(table.line)
		assert.Nil(t, err)
		assert.Equal(t, table.measure, ingredient.Measure)
		assert.Equal(t, table.ingredient, ingredient.Ingredient)
		assert.Equal(t, table.amount, ingredient.Amount)
		cups, err := normalizeIngredient(ingredient)
		assert.Nil(t, err)
		assert.Equal(t, table.cups, cups)
	}
}
