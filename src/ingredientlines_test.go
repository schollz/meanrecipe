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
	assert.Equal(t, `-   1 cup nut butter of choice (i recommend chocolate hazelnut butter)`, strings.TrimSpace(lines[0]))
}
