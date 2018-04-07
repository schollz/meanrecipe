package consensuscookery

import (
	"fmt"
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestNormalize(t *testing.T) {
	defer log.Flush()
	testFile := "testing/chocolate_chips.gz"
	ingredients, err := ParseIngredients(testFile)
	assert.Nil(t, err)
	for _, ingredient := range ingredients {
		normalized, err := normalizeIngredient(ingredient)
		assert.Nil(t, err)
		fmt.Println(normalized)
	}
}

func TestNormalizeRandom(t *testing.T) {
	cups, err := normalizeIngredient(Ingredient{Ingredient: "flour", Measure: "cup", Amount: 1.25})
	assert.Nil(t, err)
	assert.Equal(t, float64(1.25), cups)
}

func TestDetermineMeasurements(t *testing.T) {
	amount, measure, amountStr, err := determineMeasurementsFromCups(1.24)
	assert.Nil(t, err)
	fmt.Println(amount, measure, amountStr)
}
