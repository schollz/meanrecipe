package meanrecipe

import (
	"errors"
	"regexp"
	"sort"
	"strconv"
	"strings"

	log "github.com/cihub/seelog"
)

var ingredientList []string
var possibleMeasures map[string]string

func init() {
	b, err := Asset("data/top_5k.txt")
	if err != nil {
		panic(err)
	}
	m := make(map[string]int)
	for _, word := range strings.Split(strings.ToLower(string(b)), "\n") {
		word = strings.TrimSpace(word)
		m[word] = len(word)
	}
	type kv struct {
		Key   string
		Value int
	}
	var ss []kv
	for k, v := range m {
		ss = append(ss, kv{k, v})
	}

	sort.Slice(ss, func(i, j int) bool {
		return ss[i].Value > ss[j].Value
	})

	ingredientList = make([]string, len(ss))
	for i, kv := range ss {
		ingredientList[i] = kv.Key
	}
	possibleMeasures = map[string]string{
		"tablespoon":  "tbl",
		"tablespoons": "tbl",
		"tbl":         "tbl",
		"tbsp":        "tbl",
		"tbsps":       "tbl",
		"teaspoons":   "tsp",
		"teaspoon":    "tsp",
		"tsp":         "tsp",
		"tsps":        "tsp",
		"cups":        "cup",
		"cup":         "cup",
		"c":           "cup",
		"ounces":      "ounce",
		"ounce":       "ounce",
		"oz":          "ounce",
		"grams":       "gram",
		"g":           "gram",
		"gram":        "gram",
		"milliliter":  "milliliter",
		"ml":          "milliliter",
		"pint":        "pint",
		"pints":       "pint",
		"quart":       "quart",
		"quarts":      "quart",
		"pound":       "pound",
		"pounds":      "pound",
	}
}

// DetermineIngredients will look through a list of ingredients from longest name
// to shortest, and pick the first one that is in the line
func DetermineIngredients(line string) (ingredients []string) {
	//
	line = " " + line + " "
	// special cases
	line = strings.Replace(line, " egg ", " eggs ", -1)
	// find ingredient
	ingredients = []string{}
	for _, ing := range ingredientList {
		if strings.Contains(line, " "+ing+" ") {
			ingredients = append(ingredients, ing)
		}
	}
	return
}

// determineIngredient will look through a list of ingredients from longest name
// to shortest, and pick the first one that is in the line
func determineIngredient(line string) (ingredient string, err error) {
	//
	line = " " + line + " "
	// special cases
	line = strings.Replace(line, " egg ", " eggs ", -1)
	// find ingredient
	for _, ing := range ingredientList {
		if strings.Contains(line, ing) {
			ingredient = ing
			return
		}
	}
	err = errors.New("no ingredient in " + line)
	return
}

// determineMeasure will look at each word in the line sequentially and pick the
// first one that matches a known measurement
func determineMeasure(line string) (measure string, err error) {
	line = strings.Replace(line, ".", "", -1)
	for _, word := range strings.Fields(line) {
		var ok bool
		if measure, ok = possibleMeasures[word]; ok {
			return
		}
	}
	err = errors.New("no measurement found in " + line)
	return
}

func determineAmount(line string) (amount float64, err error) {
	amount = 0.0
	re := regexp.MustCompile("[0-9]+")
	firstNumber := -1
	for i, word := range strings.Fields(line) {
		// skip things that start like 1)
		if strings.Contains(word, ")") {
			continue
		}
		// after sequential numbers, break
		if firstNumber > 0 && i-firstNumber > 1 {
			break
		}
		if len(re.FindAllString(word, -1)) != 0 {
			// check if fraction
			splitWord := strings.Split(word, "/")
			if len(splitWord) == 2 {
				num, errParse := strconv.Atoi(splitWord[0])
				if errParse != nil {
					continue
				}
				den, errParse := strconv.Atoi(splitWord[1])
				if errParse != nil {
					continue
				}
				amount += float64(num) / float64(den)
			} else {
				// try converting to float directly
				amountToAdd, errParse := strconv.ParseFloat(word, 64)
				if errParse != nil {
					continue
				}
				amount += amountToAdd
			}
			firstNumber = i
		}
	}
	if amount > 0 {
		return
	}
	err = errors.New("no amount found in " + line)
	return
}

func parseIngredientFromLine(line string) (ingredient Ingredient, err error) {
	ingredient = Ingredient{OriginalLine: line}

	// remove parentheses
	re := regexp.MustCompile(`(?s)\((.*)\)`)
	m := re.FindAllStringSubmatch(line, -1)
	if len(m) > 0 {
		for _, m1 := range m {
			line = strings.Replace(line, m1[0], "", -1)
		}
		log.Debugf("removed parentheses: '%s'", line)
	}

	// determine ingredient
	ingredient.Ingredient, err = determineIngredient(line)
	if err != nil {
		return
	}

	// determine measure
	ingredient.Measure, err = determineMeasure(line)
	if err != nil {
		log.Debug(err)
	}

	// determine amount
	ingredient.Amount, err = determineAmount(line)
	if err != nil {
		log.Debug(err)
	}
	return
}

// ParseIngredients will return the ingredients found in the file
func ParseIngredients(fname string) (ingredients []Ingredient, err error) {
	ingredientLines, err := GetIngredientLines(fname)
	ingredients = []Ingredient{}
	for _, line := range ingredientLines {
		ingredient, err := parseIngredientFromLine(line)
		if err != nil {
			continue
		}
		log.Debugf("ingredient: %+v", ingredient)
		ingredients = append(ingredients, ingredient)
	}
	err = nil
	return
}
