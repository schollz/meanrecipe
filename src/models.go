package meanrecipe

import (
	"encoding/json"
	"math"

	"github.com/montanaflynn/stats"
)

type Cluster struct {
	Recipes             []Recipe              `json:"recipes,omitempty"`
	ID                  int                   `json:"id,omitempty"`
	NumRecipes          int                   `json:"num_recipes,omitempty"`
	IngredientRelations map[string]Collection `json:"ingredient_relations_collection,omitempty"`
	Ingredient          map[string]Collection `json:"ingredient_collection,omitempty"`
}

type Collection struct {
	Number  int       `json:"num,omitempty"`
	All     []float64 `json:"all,omitempty"`
	Average float64   `json:"average,omitempty"`
	SD      float64   `json"sd,omitempty"`
}

func ProcessCollection(c Collection) Collection {
	c.Number = len(c.All)
	if c.Number == 0 {
		return c
	}
	var err error
	c.Average, err = stats.Trimean(stats.Float64Data(c.All))
	if err != nil || math.IsNaN(c.Average) {
		c.Average = c.All[0]
	}
	return c
}

// Recipe is the parsed recipe from a file
type Recipe struct {
	URL             string             `json:"url,omitempty"`
	Filename        string             `json:"filename,omitempty"`
	Ingredients     []Ingredient       `json:"ingredients,omitempty"`
	VolumeRelations map[string]float64 `json:"volume_relations,omitempty"`
}

// Ingredient species the ingredients
type Ingredient struct {
	OriginalLine string  `json:"line,omitempty"`
	Ingredient   string  `json:"ingredient,omitempty"`
	Measure      string  `json:"measure,omitempty"`
	Amount       float64 `json:"amount,omitempty"`
	Cups         float64 `json:"cups,omitempty"`
}

func (p Ingredient) String() string {
	b, _ := json.MarshalIndent(p, "", " ")
	return string(b)
}

func (p Recipe) String() string {
	b, _ := json.MarshalIndent(p, "", " ")
	return string(b)
}

func (p Recipe) IngredientText() string {
	s := ""
	for _, ing := range p.Ingredients {
		s += "- " + ing.OriginalLine + "\n"
	}
	return s
}
