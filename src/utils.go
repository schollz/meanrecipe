package meanrecipe

import (
	"compress/gzip"
	"io/ioutil"
	"os"
	"strings"

	"github.com/jinzhu/inflection"
)

func init() {
	inflection.AddIrregular("brownie", "brownies")
}

func ReadGzFile(filename string) ([]byte, error) {
	fi, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer fi.Close()

	fz, err := gzip.NewReader(fi)
	if err != nil {
		return nil, err
	}
	defer fz.Close()

	s, err := ioutil.ReadAll(fz)
	if err != nil {
		return nil, err
	}
	return s, nil
}

func Singularlize(line string) string {
	words := strings.Fields(line)
	for i := range words {
		words[i] = inflection.Singular(words[i])
	}
	return strings.Join(words, " ")
}
