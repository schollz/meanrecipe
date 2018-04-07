package meanrecipe

import (
	"bytes"
	"compress/gzip"
	"crypto/sha256"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"runtime"
	"strings"
	"time"

	log "github.com/cihub/seelog"
	"github.com/jaytaylor/html2text"
	wordwrap "github.com/mitchellh/go-wordwrap"
	"github.com/pkg/errors"
	"github.com/schollz/progressbar"
)

func DownloadAll(folder string, urls []string) (err error) {
	start := time.Now()
	log.Debugf("downloading %d urls", len(urls))
	os.MkdirAll(folder, 0755)

	jobs := make(chan string, len(urls))
	results := make(chan error, len(urls))

	workers := runtime.NumCPU() * 4
	for w := 1; w <= workers; w++ {
		go func(id int, folder string, jobs <-chan string, results chan<- error) {
			// generate sha256 filename
			for j := range jobs {
				_, err := downloadOne(folder, j)
				if err != nil {
					err = errors.Wrap(err, "could not download "+j)
				}
				results <- err
			}

		}(w, folder, jobs, results)
	}

	for i := 0; i < len(urls); i++ {
		jobs <- urls[i]
	}
	close(jobs)

	downloaded := 0
	log.Info("downloading...")
	bar := progressbar.New(len(urls))
	for i := 0; i < len(urls); i++ {
		bar.Add(1)
		err := <-results
		if err != nil {
			log.Warn(err)
		} else {
			downloaded++
		}
	}
	log.Infof("downloaded %d urls in %s", downloaded, time.Since(start))
	return
}

func downloadOne(folder, url string) (fname string, err error) {
	// generate filename
	h := sha256.New()
	h.Write([]byte(url))
	fname = path.Join(folder, fmt.Sprintf("%x.gz", h.Sum(nil)))

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return
	}
	req.Header.Set("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
	timeout := time.Duration(5 * time.Second)
	client := http.Client{
		Timeout: timeout,
	}
	resp, err := client.Do(req)
	if err != nil {
		return
	}
	defer resp.Body.Close()
	var b bytes.Buffer
	b.ReadFrom(resp.Body)

	text, err := html2text.FromString(string(b.Bytes()), html2text.Options{PrettyTables: false, OmitLinks: true})
	if err != nil {
		return
	}
	text = strings.Replace(text, "ADVERTISEMENT", "", -1)
	text = wordwrap.WrapString(text, 70)
	lines := strings.Split(text, "\n")
	if len(lines) > 20 {
		lines = lines[20:]
	}
	text = url + "\n" + strings.Join(lines, "\n")

	var b2 bytes.Buffer
	w := gzip.NewWriter(&b2)
	w.Write([]byte(text))
	w.Close()
	err = ioutil.WriteFile(fname, b2.Bytes(), 0644)
	if err == nil {
		log.Debugf("wrote %s", fname)
	}
	return
}
