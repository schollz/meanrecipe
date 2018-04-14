package meanrecipe

import (
	"errors"
	"fmt"
	"net/http"
	"net/url"
	"strings"
	"time"

	"github.com/PuerkitoBio/goquery"
	log "github.com/cihub/seelog"
)

func GetDirections(recipe string, include []string, exclude []string) (directions []string, err error) {
	recipeURL, err := getRecipeURL(recipe, include, exclude)
	if err != nil {
		return
	}
	directions, err = getDirections(recipeURL)
	return
}

func getDirections(allRecipesURL string) (directions []string, err error) {
	log.Infof("getting recipe directions for url %s", allRecipesURL)
	req, err := http.NewRequest("GET", allRecipesURL, nil)
	if err != nil {
		return
	}
	req.Header.Set("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
	timeout := time.Duration(30 * time.Second)
	client := http.Client{
		Timeout: timeout,
	}
	resp, err := client.Do(req)
	if err != nil {
		return
	}
	defer resp.Body.Close()

	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return
	}

	// Find the urls
	directions = []string{}
	doc.Find("span.recipe-directions__list--item").Each(func(i int, s *goquery.Selection) {
		direction := strings.TrimSpace(s.Text())
		if len(direction) < 3 {
			return
		}
		directions = append(directions, direction)
	})
	if len(directions) == 0 {
		err = errors.New("no directions")
		return
	}
	return
}

func getRecipeURL(recipe string, include []string, exclude []string) (recipeURL string, err error) {
	recipe = url.QueryEscape(strings.Replace(recipe, "_", " ", -1))
	for i := range include {
		include[i] = url.QueryEscape(include[i])
	}
	for i := range exclude {
		exclude[i] = url.QueryEscape(exclude[i])
	}

	urlToGet := fmt.Sprintf("https://www.allrecipes.com/search/results/?wt=%s&ingIncl=%s&ingExcl=%s&sort=re", url.QueryEscape(recipe), strings.Join(include, ","), strings.Join(exclude, ","))
	log.Infof("getting recipe url for %s +%+v -%+v (%s)", recipe, include, exclude, urlToGet)
	req, err := http.NewRequest("GET", urlToGet, nil)
	if err != nil {
		return
	}
	req.Header.Set("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36")
	timeout := time.Duration(30 * time.Second)
	client := http.Client{
		Timeout: timeout,
	}
	resp, err := client.Do(req)
	if err != nil {
		return
	}
	defer resp.Body.Close()

	doc, err := goquery.NewDocumentFromReader(resp.Body)
	if err != nil {
		return
	}

	// Find the urls
	urls := []string{}
	doc.Find("div.fixed-recipe-card__info > a").Each(func(i int, s *goquery.Selection) {
		href, ok := s.Attr("href")
		if !ok {
			return
		}
		href, _ = url.QueryUnescape(href)
		if strings.Contains(href, "=http") {
			href = "http" + strings.Split(href, "=http")[1]
		}
		urls = append(urls, href)
		// fmt.Printf("%d) %s\n", i, href)
	})
	if len(urls) == 0 {
		err = errors.New("no urls")
		return
	}
	recipeURL = urls[0]
	return
}
