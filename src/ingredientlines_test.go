package consensuscookery

import (
	"fmt"
	"strings"
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestIngredientLines(t *testing.T) {
	defer log.Flush()
	lines, err := GetIngredientLines("testing/chocolate_chips.gz")
	assert.Nil(t, err)
	fmt.Println(lines)
	assert.Equal(t, `-   1 cup nut butter of choice (i recommend chocolate hazelnut butter), -    1/2  cup bob's red mill paleo baking flour, -    1/3  cup maple syrup, -   1 flax egg (1 tablespoon flax + 3 tablespoons water), -   1 tablespoon vanilla extract, -    1/2  teaspoon sea salt, -    1/4  teaspoon baking powder, -    1/2  cup cacao nibs, -    1/2  cup dark chocolate chips, minimum 70% cacao`, strings.Join(lines, ", "))
}
