package consensuscookery

import (
	"bytes"
	"compress/gzip"
	"crypto/sha256"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"path"

	log "github.com/cihub/seelog"
)

func DownloadAll(folder string, urls []string) (err error) {
	log.Debugf("downloading %d urls", len(urls))
	os.MkdirAll(folder, 0755)

	jobs := make(chan string, len(urls))
	results := make(chan error, len(urls))

	workers := 3
	for w := 1; w <= workers; w++ {
		go func(id int, folder string, jobs <-chan string, results chan<- error) {
			// generate sha256 filename
			// for j := range jobs {
			// }

		}(w, "temp", jobs, results)
	}

	for i := 0; i < len(urls); i++ {
		jobs <- urls[i]
	}
	close(jobs)

	for i := 0; i < len(urls); i++ {
		err := <-results
		if err != nil {
			log.Warn(err)
		}
	}
	return
}

func downloadOne(folder, url string) (err error) {
	// generate filename
	h := sha256.New()
	h.Write([]byte(url))
	fname := path.Join(folder, fmt.Sprintf("%x.gz", h.Sum(nil)))

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return
	}
	req.Header.Set("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
	resp, err := http.DefaultClient.Do(req)
	if err != nil {
		return
	}
	defer resp.Body.Close()
	var b bytes.Buffer
	b.ReadFrom(resp.Body)

	var b2 bytes.Buffer
	w := gzip.NewWriter(&b2)
	w.Write(b.Bytes())
	w.Close()
	err = ioutil.WriteFile(fname, b2.Bytes(), 0644)
	if err == nil {
		log.Debugf("wrote %s", fname)
	}
	return
}
