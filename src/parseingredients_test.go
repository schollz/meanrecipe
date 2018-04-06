package consensuscookery

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
	ingredientsPreviouslyMarshaled, errOpen := ioutil.ReadFile(testFile + ".json")
	if errOpen != nil {
		ioutil.WriteFile(testFile+".json", ingredientsMarshaled, 0644)
		ingredientsPreviouslyMarshaled = ingredientsMarshaled
	}
	assert.Equal(t, string(ingredientsPreviouslyMarshaled), string(ingredientsMarshaled))
}
