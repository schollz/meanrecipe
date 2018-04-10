# meanrecipe

Sometimes when I want a recipe to cook something new I will find several recipes for the same thing and try to use them as a guide to generate an average or "consensus" recipe. This code should make it easy to generate consensus recipes (useful!) and also show variation between recipes (interesting!).

Finding a consensus recipe requires first clustering many recipes. This is because a single recipe (*e.g.* a recipe for brownies) might have many significant variations (*e.g.* brownies can have just cocoa, just chocolate, or both). This code will first cluster recipes and then use the clusters to deliver the consensus recipe.

## How does it work

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

The output will container multiple recipes for 'chocolate chip cookies', clustered according to ingredients. For example, here is the first cluster, the most popular recipe:

```
Cluster 1 (35% of 1041)

Ingredients:
- 1 teaspoon baking soda (± 42%)
- ⅞ cup brown sugar (± 40%)
- ⅞ cup butter (± 29%)
- 1 ⅝ cup chocolate (± 62%)
- 2 eggs (± 62%)
- 2 ¼ cup flour (± 40%)
- ¾ teaspoon salt (± 67%)
- ¾ cup sugar (± 51%)
- 1 ⅝ teaspoon vanilla (± 75%)

Directions:
1. Preheat oven to 300 degrees F (150 degrees C).

2. Sift together the flour, baking powder and salt, set aside. In a
medium bowl, cream the butter and sugar together until fluffy.
Gradually stir in the dry ingredients, then stir in the walnuts and
chocolate chips.

3. Roll or scoop dough into walnut sized balls. Place them on unprepared
cookie sheets 1 1/2 inches apart. Flatten cookies slightly. Bake for
15 to 20 minutes, until light golden brown. Remove from sheets to cool
on racks.
```

The second cluster (the second most popular 'chocolate chip cookie' recipe) has pinpointed a variation - the inclusion of baking powder.

```
Cluster 2 (16% of 1041)
Variation:
 +baking powder

Ingredients:
- 1 ⅛ teaspoon baking powder (± 80%)
- ⅞ teaspoon baking soda (± 49%)
- 1 ⅛ cup brown sugar (± 80%)
- ⅞ cup butter (± 40%)
- 1 ⅝ cup chocolate (± 85%)
- 2 eggs (± 55%)
- 2 ⅛ cup flour (± 51%)
- ¾ teaspoon salt (± 71%)
- ¾ cup sugar (± 80%)
- 2 teaspoon vanilla (± 78%)

Directions:
1. Preheat oven to 300 degrees F (150 degrees C).

2. Sift together the flour, baking powder and salt, set aside. In a
medium bowl, cream the butter and sugar together until fluffy.
Gradually stir in the dry ingredients, then stir in the walnuts and
chocolate chips.

3. Roll or scoop dough into walnut sized balls. Place them on unprepared
cookie sheets 1 1/2 inches apart. Flatten cookies slightly. Bake for
15 to 20 minutes, until light golden brown. Remove from sheets to cool
on racks.
```

Reading further down you can find even more variations, for example this recipe
which uses *cocoa*:

```
Cluster 5 (4% of 1041)
Variation:
 +cocoa

Ingredients:
- ¾ teaspoon baking soda (± 57%)
- ¾ cup brown sugar (± 57%)
- ¾ cup butter (± 52%)
- 1 ⅛ cup chocolate (± 72%)
- ⅜ cup cocoa (± 80%)
- 1 eggs (± 44%)
- 1 ½ cup flour (± 67%)
- ⅝ teaspoon salt (± 88%)
- ¾ cup sugar (± 88%)
- 1 ½ teaspoon vanilla (± 67%)

Directions:
1. Preheat oven to 350 degrees F (175 degrees C). Grease cookie sheets.
Stir together the flour, cocoa, baking powder, baking soda, salt and
cinnamon; set aside.

2. In a large bowl, cream together the margarine, brown sugar and white
sugar. Beat in the egg and vanilla. Stir in the dry ingredients using
a wooden spoon. Mix in the oats and chocolate chips. Drop by
tablespoonfuls onto cookie sheets, leaving 2 inches between cookies.

3. Bake for 8 to 10 minutes in the preheated oven, or until lightly
browned.  Allow cookies to cool on baking sheet for 5 minutes before
removing to a wire rack to cool completely.
```

# Try it

## Install

[Download from the latest releases](https://github.com/schollz/meanrecipe), or download with Go:

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

To make sure certain ingredients are included just use `-include 'chocolate, oats'` (for example).

# Roadmap

This is a *quick-and-dirty* project. I don't plan to do much more on it, it was just a fun thing. 

However, here are some things I realize this project *does not do* and would be great to implement:

- [ ] Making food volumes more accurate. The code specifies a constant density for ingredients that are specified in weight so that they can be converted to volumes (volumes are necessary for normalization before taking means). In reality different foods have different densities, of course.
- [ ] Making proportions more accurate. This will be easier if the previous item is finished.
- [x] Adding in a specifier for the variation in the amount (show the mean and the standard deviation of the mean?).
- [x]] Adding in recipe directions. Is there a way towards consensus directions? This might be really really hard.
- [ ] In general, making the parsing (from websites) and the food tagging better. There are more sophisticated taggers (see NYT food tagger).

# License

MIT

