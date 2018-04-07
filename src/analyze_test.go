package meanrecipe

import (
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestAnalyzeClusters(t *testing.T) {
	defer log.Flush()
	err := AnalyzeClusters("testing/chocolate_chip_cookies")
	assert.Nil(t, err)
}
