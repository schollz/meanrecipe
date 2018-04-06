package consensuscookery

import (
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestParseIngredients(t *testing.T) {
	defer log.Flush()
	err := ParseIngredients("testing/chocolate_chips.gz")
	assert.Nil(t, err)
}
