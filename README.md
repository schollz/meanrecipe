# Rewrite in progress. For working version see [v1.0.0 branch](https://github.com/schollz/meanrecipe/tree/e2b3847a7446d3b32231707bdc7e9a093d3ab3f0).

# meanrecipe

Sometimes when I want a recipe to cook something new I will find several recipes for the same thing and try to use them as a guide to generate an average or "consensus" recipe. This code should make it easy to generate consensus recipes (useful!) and also show variation between recipes (interesting!).

Finding a consensus recipe requires first clustering many recipes. This is because a single recipe (*e.g.* a recipe for brownies) might have many significant variations (*e.g.* brownies can have just cocoa, just chocolate, or both). This code will first cluster recipes and then use the clusters to deliver the consensus recipe.

## Example

The *quick-and-dirty* implementation goes like this:

1. Choose a recipe (*e.g.* brownies, crepes, pancakes).
2. Search to find thsouands of corresponding recipes.
3. Download all the recipes convert to gzipped text for processing.
4. Use a really simple (read: *bad*) context-extractor to grab ingredients.
5. Cluster the recipes based on the presence of ingredients.
6. Take the mean values (after removing outliers) for ingredients in a given cluster to create an average recipe.

The context-extractor works by finding the most likely "ingredient" section in the web page and then trying to parse those ingredients using a greedy search from a list of likely ingredients (`top_5k.txt`). Its not a great implementation. However, the errors in it are pretty random, which means you can get okay results as long as you have ~hundreds of recipes. 

Here's some examples of running the code.

### Chocolate chip cookies

```
$ meanrecipe -recipe 'chocolate chip cookies'
```

#### cluster 1, 35% recipes (433)

- 1 teaspoon baking soda
- 7/8 cup brown sugar
- 7/8 cup butter
- 1 3/4 cup chocolate
- 1/2 cup eggs
- 2 1/4 cup flour
- 3/4 teaspoon salt
- 5/8 cup sugar
- 1 5/8 teaspoon vanilla


#### cluster 2, 15% recipes (193)

- 1 teaspoon baking powder
- 7/8 teaspoon baking soda
- 1 cup brown sugar
- 7/8 cup butter
- 1 5/8 cup chocolate
- 1/2 cup eggs
- 2 1/8 cup flour
- 3/4 teaspoon salt
- 3/4 cup sugar
- 1 7/8 teaspoon vanilla


#### cluster 3, 7% recipes (87)

- 7/8 teaspoon baking soda
- 3/4 cup brown sugar
- 1 1/4 cup chocolate
- 1/2 cup eggs
- 2 cup flour
- 7/8 cup margarine
- 3/4 teaspoon salt
- 5/8 cup sugar
- 1 1/2 teaspoon vanilla


# Try it

## Install

Download from the latest releases, or download with Go 1.8:

```
$ go get github.com/schollz/meanrecipe
```

## Run

Just run from the command line and specify the food that you want.

```
$ meanrecipe -recipe 'chocolate chip cookies'
```

Be patient as it will take 3-5 minutes to download and pre-process the data. Data is only downloaded once, if you run it a second time it will use the previous data.

You can also generate different number of clusters using `-clusters X` where `X` is the number of clusters.

See the examples above for more information.

# Roadmap

This is a *quick-and-dirty* project. I don't plan to do much more on it, it was just a fun thing. 

However, here are some things I realize this project *does not do* and would be great to implement:

- [ ] Making food volumes more accurate. The code specifies a constant density for ingredients that are specified in weight so that they can be converted to volumes (volumes are necessary for normalization before taking means). In reality different foods have different densities, of course.
- [ ] Making proportions more accurate. This will be easier if the previous item is finished.
- [x] Adding in a specifier for the variation in the amount (show the mean and the standard deviation of the mean?).
- [ ] Adding in recipe directions. Is there a way towards consensus directions? This might be really really hard.
- [ ] In general, making the parsing (from websites) and the food tagging better. There are more sophisticated taggers (see NYT food tagger).

# License

MIT

