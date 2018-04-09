package meanrecipe

import (
	"bytes"
	"errors"
	"regexp"
	"strings"

	"github.com/bradfitz/slice"
	log "github.com/cihub/seelog"
)

var ingredientCorpus []string

func init() {
	b, err := Asset("data/ingredient_corpus.txt")
	if err != nil {
		panic(err)
	}
	ingredientCorpus = strings.Fields(strings.ToLower(string(b)))
	for i := range ingredientCorpus {
		ingredientCorpus[i] = Singularlize(ingredientCorpus[i])
	}
}

func getCorpusCount(line string) (count int) {
	count = 0
	// a number must be found
	re := regexp.MustCompile("[0-9]+")
	if len(re.FindAllString(line, -1)) == 0 {
		return 0
	}
	line = " " + Singularlize(line) + " "
	for _, word := range ingredientCorpus {
		if strings.Contains(line, " "+word+" ") {
			count++
		}
	}

	return count
}

// GetIngredientLines returns the ingredient lines
func GetIngredientLines(fname string) (ingredientLines []string, err error) {
	fileBytes, err := readGzFile(fname)
	if err != nil {
		return
	}

	// replace fractions
	fileBytes = bytes.Replace(fileBytes, []byte("¾"), []byte(" 3/4 "), -1)
	fileBytes = bytes.Replace(fileBytes, []byte("¼"), []byte(" 1/4 "), -1)
	fileBytes = bytes.Replace(fileBytes, []byte("⅔"), []byte(" 2/3 "), -1)
	fileBytes = bytes.Replace(fileBytes, []byte("⅓"), []byte(" 1/3 "), -1)
	fileBytes = bytes.Replace(fileBytes, []byte("½"), []byte(" 1/2 "), -1)

	// lower case
	fileBytes = bytes.ToLower(fileBytes)

	type cluster struct {
		start int
		stop  int
		total int
	}
	currentCluster := cluster{}
	clusters := []cluster{}
	lines := strings.Split(string(fileBytes), "\n")
	for i, line := range lines {
		if i == 0 {
			continue
		}
		line = strings.TrimSpace(line)
		if len(line) < 3 {
			continue
		}
		count := getCorpusCount(line)
		// log.Debugf("%d: %s %d", i, line, count)
		if count > 0 && currentCluster.start == 0 {
			currentCluster = cluster{
				start: i,
			}
		}
		if count == 0 && currentCluster.start != 0 {
			currentCluster.stop = i
			clusters = append(clusters, currentCluster)
			currentCluster = cluster{}
		}
		currentCluster.total += count
	}
	if len(clusters) == 0 {
		err = errors.New("no clusters found")
		return
	}

	// sort by total
	slice.Sort(clusters[:], func(i, j int) bool {
		return clusters[i].total > clusters[j].total
	})
	log.Debugf("top result: %+v", clusters[0])
	ingredientLines = []string{}
	for _, line := range lines[clusters[0].start:clusters[0].stop] {
		line = strings.TrimSpace(line)
		if len(line) > 3 {
			ingredientLines = append(ingredientLines, line)
		}
	}

	log.Debugf("lines: %+v", ingredientLines)
	return
}
