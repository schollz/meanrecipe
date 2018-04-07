package meanrecipe

import (
	"testing"

	log "github.com/cihub/seelog"
	"github.com/stretchr/testify/assert"
)

func TestRunning(t *testing.T) {
	SetLogLevel("info")
	defer log.Flush()
	err := Run("chocolate chip cookies")
	assert.Nil(t, err)
}
