package meanrecipe

import (
	"testing"

	log "github.com/cihub/seelog"
	"github.com/schollz/googleit"
	"github.com/stretchr/testify/assert"
)

func TestDownloading(t *testing.T) {
	defer log.Flush()
	_, err := downloadOne("tmp", "https://gobyexample.com/worker-pools")
	assert.Nil(t, err)
	err = DownloadAll("tmp", []string{"https://gobyexample.com/worker-pools", "https://gobyexample.com/rate-limiting", "https://gobyexample.com/atomic-counters"})
	assert.Nil(t, err)
	urls, err := googleit.DuckDuckGo("best brownie reipce")
	assert.Nil(t, err)
	err = DownloadAll("brownies_test", urls)
	assert.Nil(t, err)
}

func TestDownloadOne(t *testing.T) {
	defer log.Flush()
	_, err := downloadOne("tmp", "https://www.allrecipes.com/recipe/10549/best-brownies/")
	assert.Nil(t, err)
}
