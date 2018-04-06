package consensuscookery

import (
	"encoding/json"
	"math"

	"github.com/montanaflynn/stats"
)

type Cluster struct {
	Recipes             []Recipe               `json:"recipes"`
	ID                  int                    `json:"id"`
	NumRecipes          int                    `json:"num_clusters"`
	IngredientRelations map[string]*Collection `json:"ingredient_relations_collection"`
	Ingredient          map[string]*Collection `json:"ingredient_collection"`
}

type Collection struct {
	Number  int       `json:"num"`
	All     []float64 `json:"all"`
	Average float64   `json:"average"`
	SD      float64   `json"sd"`
}

func (c *Collection) Process() {
	c.Number = len(c.All)
	if c.Number == 0 {
		return
	}
	var err error
	c.Average, err = stats.Trimean(stats.Float64Data(c.All))
	if err != nil || math.IsNaN(c.Average) {
		c.Average = c.All[0]
	}
}

// Recipe is the parsed recipe from a file
type Recipe struct {
	URL             string             `json:"url"`
	Filename        string             `json:"filename"`
	Ingredients     []Ingredient       `json:"ingredients"`
	VolumeRelations map[string]float64 `json:"volume_relations"`
}

// Ingredient species the ingredients
type Ingredient struct {
	OriginalLine string  `json:"line"`
	Ingredient   string  `json:"ingredient"`
	Measure      string  `json:"measure"`
	Amount       float64 `json:"amount"`
	Cups         float64 `json:"cups"`
}

func (p Ingredient) String() string {
	b, _ := json.Marshal(p)
	return string(b)
}

func (p Recipe) String() string {
	b, _ := json.Marshal(p)
	return string(b)
}
