package consensuscookery

import (
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestLearnBasic(t *testing.T) {
	defer log.Flush()
	err := Learn("testing/chocolate_chip_cookies")
	assert.Nil(t, err)
}
