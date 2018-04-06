package consensuscookery

import "encoding/json"

type Cluster struct {
	Recipes                []Recipe             `json:"recipes"`
	ID                     int                  `json:"id"`
	NumRecipes             int                  `json:"num"`
	VolumeRelations        map[string][]float64 `json:"all_volume_relations"`
	AverageVolumeRelations map[string]float64   `json:"avg_volume_relations"`
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
