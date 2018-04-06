package consensuscookery

var gramConversions = map[string]float64{
	"ounce":  28.3495,
	"ounces": 28.3495,
	"gram":   1,
	"grams":  1,
	"pound":  453.592,
}

var densities = map[string]float64{
	"default": 0.9,
	"sugar":   0.8,
	"flour":   0.55,
	"cocoa":   0.55,
	"butter":  0.911,
	"milk":    1.03,
	"water":   1,
	"chicken": 0.868,
}

var conversionToCup = map[string]float64{
	"tablespoon": 1 / 16,
	"teaspoon":   1 / 48,
	"cup":        1,
}
