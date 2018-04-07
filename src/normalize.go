package consensuscookery

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"math"
	"strconv"
	"strings"
)

var gramConversions = map[string]float64{
	"ounce": 28.3495,
	"gram":  1,
	"pound": 453.592,
}

var conversionToCup = map[string]float64{
	"tbl":        0.0625,
	"tsp":        0.020833,
	"cup":        1.0,
	"pint":       2.0,
	"quart":      4.0,
	"gallon":     16.0,
	"milliliter": 0.00423,
}
var ingredientToCups = map[string]float64{
	"eggs": 0.25,
}

var densities map[string]float64

func init() {
	b, err := ioutil.ReadFile("data/ingredient_densities.json")
	if err != nil {
		panic(err)
	}
	err = json.Unmarshal(b, &densities)
	if err != nil {
		panic(err)
	}
}

// normalizeIngredient will try to normalize the ingredient to 1 cup
func normalizeIngredient(ing Ingredient) (cups float64, err error) {
	if _, ok := ingredientToCups[ing.Ingredient]; ok {
		// special ingredients
		cups = ing.Amount * ingredientToCups[ing.Ingredient]
	} else if _, ok := conversionToCup[ing.Measure]; ok {
		// check if it has a standard volume measurement
		cups = float64(ing.Amount) * conversionToCup[ing.Measure]
	} else if _, ok := gramConversions[ing.Measure]; ok {
		// check if it has a standard weight measurement
		var density float64
		density, ok = densities[ing.Ingredient]
		if !ok {
			density = 200 // grams / cup
		}
		cups = ing.Amount * gramConversions[ing.Measure] / density
	} else {
		err = errors.New("could not convert weight or volume")
	}
	return
}

func determineMeasurementsFromCups(cups float64) (amount float64, measure string, amountString string, err error) {
	if cups > 0.125 {
		amount = cups
		measure = "cup"
	} else if cups > 0.020833*3 {
		amount = cups * 16
		measure = "tablespoon"
	} else {
		amount = cups * 48
		measure = "teaspoon"
	}
	r, _ := ParseDecimal(fmt.Sprintf("%2.10f", roundToEighth(amount)))
	amountString = r.String()
	return
}

func roundToEighth(val float64) float64 {
	return math.Ceil(val*8) / 8
}

// A rational number r is expressed as the fraction p/q of two integers:
// r = p/q = (d*i+n)/d.
type Rational struct {
	i int64 // integer
	n int64 // fraction numerator
	d int64 // fraction denominator
}

func (r Rational) String() string {
	var s string
	if r.i != 0 {
		s += strconv.FormatInt(r.i, 10)
	}
	if r.n != 0 {
		if r.i != 0 {
			s += " "
		}
		if r.d < 0 {
			r.n *= -1
			r.d *= -1
		}
		s += strconv.FormatInt(r.n, 10) + "/" + strconv.FormatInt(r.d, 10)
	}
	if len(s) == 0 {
		s += "0"
	}
	return s
}

func gcd(x, y int64) int64 {
	for y != 0 {
		x, y = y, x%y
	}
	return x
}

func ParseDecimal(s string) (r Rational, err error) {
	sign := int64(1)
	if strings.HasPrefix(s, "-") {
		sign = -1
	}
	p := strings.IndexByte(s, '.')
	if p < 0 {
		p = len(s)
	}
	if i := s[:p]; len(i) > 0 {
		if i != "+" && i != "-" {
			r.i, err = strconv.ParseInt(i, 10, 64)
			if err != nil {
				return Rational{}, err
			}
		}
	}
	if p >= len(s) {
		p = len(s) - 1
	}
	if f := s[p+1:]; len(f) > 0 {
		n, err := strconv.ParseUint(f, 10, 64)
		if err != nil {
			return Rational{}, err
		}
		d := math.Pow10(len(f))
		if math.Log2(d) > 63 {
			err = fmt.Errorf(
				"ParseDecimal: parsing %q: value out of range", f,
			)
			return Rational{}, err
		}
		r.n = int64(n)
		r.d = int64(d)
		if g := gcd(r.n, r.d); g != 0 {
			r.n /= g
			r.d /= g
		}
		r.n *= sign
	}
	return r, nil
}
