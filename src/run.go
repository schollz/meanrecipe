package meanrecipe

import (
	"os"
	"path"
	"strings"

	log "github.com/cihub/seelog"
)

func Run(recipe string) (err error) {
	// create a directory
	folder := strings.Replace(strings.ToLower(recipe), " ", "_", -1)
	folder = path.Join("recipes", folder)
	err = os.MkdirAll(folder, 0755)
	if err != nil {
		return
	}

	// // get urls
	// queries := []string{"best XX recipe", "favorite XX recipe", "homemade XX recipe"}
	// for _, query := range queries {
	// 	query = strings.Replace(query, "XX", recipe, 1)
	// 	log.Infof("querying urls for '%s'", query)
	// 	urls, errSearch := googleit.Search(query)
	// 	if errSearch != nil {
	// 		err = errSearch
	// 		return
	// 	}
	// 	log.Infof("found %d urls for '%s'", len(urls), query)
	// 	errDownload := DownloadAll(folder, urls)
	// 	if errDownload != nil {
	// 		err = errDownload
	// 		return
	// 	}
	// }

	// log.Info("getting all recipes")
	// err = GetAllRecipes(folder)
	// if err != nil {
	// 	return
	// }

	log.Info("creating clusters recipes")
	err = CreateClusters(folder)
	if err != nil {
		return
	}

	log.Info("analyzing clusters")
	err = AnalyzeClusters(folder)
	if err != nil {
		return
	}
	return
}
