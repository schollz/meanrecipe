package consensuscookery

import (
	"fmt"
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestGenerateRecipe1(t *testing.T) {
	defer log.Flush()
	testFile := "testing/chocolate_chips.gz"
	r, err := GenerateRecipe(testFile)
	assert.Nil(t, err)
	fmt.Println(r)
}

func TestGenerateRecipe2(t *testing.T) {
	r, err := GenerateRecipe("testing/chocolate_chip_cookies/e0ab74b9ae7f2d167a6a3929f03c6c68.gz")
	assert.Nil(t, err)
	fmt.Println(r)
}
