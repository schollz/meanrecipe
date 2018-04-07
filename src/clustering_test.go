package consensuscookery

import (
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestClustering(t *testing.T) {
	defer log.Flush()
	err := CreateClusters("testing/chocolate_chip_cookies")
	assert.Nil(t, err)
}
