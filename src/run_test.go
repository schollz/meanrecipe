package meanrecipe

import (
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestRunning(t *testing.T) {
	SetLogLevel("info")
	defer log.Flush()
	// os.RemoveAll("recipes")
	err := Run("chocolate chip cookies")
	assert.Nil(t, err)
}
