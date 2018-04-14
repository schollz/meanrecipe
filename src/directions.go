package meanrecipe

import (
	"errors"
	"fmt"
	"net/http"
	"net/url"
	"strings"
	"time"

	"github.com/PuerkitoBio/goquery"
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
	for i := range include {
		include[i] = url.QueryEscape(include[i])
	}
	for i := range exclude {
		exclude[i] = url.QueryEscape(exclude[i])
	}
	req, err := http.NewRequest("GET", fmt.Sprintf("https://www.allrecipes.com/search/results/?wt=%s&ingIncl=%s&ingExcl=%ssort=re", url.QueryEscape(recipe), strings.Join(include, ","), strings.Join(exclude, ",")), nil)
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
