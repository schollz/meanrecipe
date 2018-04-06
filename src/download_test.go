package consensuscookery

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestDownloading(t *testing.T) {
	err := downloadOne(".", "https://gobyexample.com/worker-pools")
	assert.Nil(t, err)
}
