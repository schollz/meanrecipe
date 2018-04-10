package meanrecipe

import (
	"fmt"
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestGetDirections(t *testing.T) {
	defer log.Flush()
	recipeURL, err := getRecipeURL("brownie", []string{}, []string{})
	assert.Nil(t, err)
	assert.Equal(t, "https://www.allrecipes.com/recipe/25080/mmmmm-brownies/", recipeURL)

	directions, err := getDirections("https://www.allrecipes.com/recipe/25080/mmmmm-brownies/")
	assert.Nil(t, err)
	fmt.Println(directions)
	assert.Equal(t, 3, len(directions))

	recipeURL, err = getRecipeURL("brownie", []string{"cocoa"}, []string{"chocolate"})
	assert.Nil(t, err)
	assert.Equal(t, "https://www.allrecipes.com/recipe/10549/best-brownies/", recipeURL)

}
