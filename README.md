# Rewrite in progress. For working version see [v1.0.0 branch](https://github.com/schollz/meanrecipe/tree/e2b3847a7446d3b32231707bdc7e9a093d3ab3f0).

# consensus-cookery

Sometimes when I want a recipe to cook something new I will find several recipes for the same thing and try to use them as a guide to generate an average or "consensus" recipe. This code should make it easy to generate consensus recipes (useful!) and also show variation between recipes (interesting!).

Finding a consensus recipe requires first clustering many recipes. This is because a single recipe (*e.g.* a recipe for brownies) might have many significant variations (*e.g.* brownies can have just cocoa, just chocolate, or both). This code will first cluster recipes and then use the clusters to deliver the consensus recipe.

## Example

The *quick-and-dirty* implementation goes like this:

1. Choose a recipe (*e.g.* brownies, crepes, pancakes).
2. Search using duckduckgo.com to find hundreds of corresponding recipes (`fetch_urls.js`).
3. Download all the recipes and use `pandoc` to convert to text for processing.
4. Use a really simple (read: *bad*) context-extractor to grab ingredients.
5. Cluster the recipes based on the presence of ingredients.
6. Take the mean values (after removing outliers) for ingredients in a given cluster to create an average recipe.

The context-extractor works by finding the most likely "ingredient" section in the web page and then trying to parse those ingredients using a greedy search from a list of likely ingredients (`top_5k.txt`). Its not a great implementation. However, the errors in it are pretty random, which means you can get okay results as long as you have ~hundreds of recipes. 

Here's some examples of running the code.

### Brownies

As mentioned, brownies are sometimes made with cocoa, sometimes chocolate, and sometimes both. Interestingly the machine learning automatically detects this. 

```
$ python3 run.py --recipe brownies
```

Here's the biggest "brownie" cluster which shows ingredients for a consensus recipe made with chocolate (made up of 44 recipes). The `Variation` corresponds to the standard deviation in the amount for that particular ingredient in all recipes. The `Rel. Freq.` corresponds to the percentage of recipes that contain that ingredient.

```
cluster 1 (n=39)
+---------------+------------+-----------+------------+
|   Ingredient  |   Amount   | Variation | Rel. Freq. |
+---------------+------------+-----------+------------+
| baking powder |  3/8 tsp   |   ± 1/4   |     36     |
|     butter    |   6 tbsp   |  ± 5 1/8  |     92     |
|   chocolate   | 5 3/8 tbsp |  ± 6 1/8  |    121     |
|      eggs     |  3 whole   |  ± 1 1/2  |     90     |
|     flour     |  3/4 cup   |   ± 3/8   |     87     |
|      salt     |  1/2 tsp   |   ± 3/8   |     64     |
|     sugar     | 1 3/8 cup  |   ± 5/8   |    100     |
|    vanilla    |  3/4 tsp   |   ± 1/2   |     85     |
+---------------+------------+-----------+------------+
```

The next biggest cluster shows ingredients for a brownie recipe that is made with cocoa powder. (Also it uses baking powder unlike the previous recipe).

```
cluster 6 (n=30)
+------------+------------+-----------+------------+
| Ingredient |   Amount   | Variation | Rel. Freq. |
+------------+------------+-----------+------------+
|   butter   | 5 1/2 tbsp |  ± 3 7/8  |    100     |
|   cocoa    | 5 1/2 tbsp |  ± 4 1/8  |    100     |
|    eggs    |  2 whole   |   ± 3/4   |     90     |
|   flour    |  1/2 cup   |   ± 1/8   |     70     |
|    salt    |  3/8 tsp   |   ± 1/8   |     67     |
|   sugar    | 1 1/8 cup  |   ± 1/4   |    100     |
|  vanilla   |  3/4 tsp   |   ± 1/2   |     87     |
+------------+------------+-----------+------------+
```

The fourth biggest cluster shows ingredients for a brownie recipe that uses both chocolate *and* cocoa.

```
cluster 4 (n=26)
+------------+------------+-----------+------------+
| Ingredient |   Amount   | Variation | Rel. Freq. |
+------------+------------+-----------+------------+
|   butter   | 5 7/8 tbsp |    ± 6    |    108     |
| chocolate  | 6 1/8 tbsp |  ± 5 3/4  |    104     |
|   cocoa    | 4 1/2 tbsp |  ± 4 3/8  |     96     |
|    eggs    |  3 whole   |  ± 1 3/4  |     88     |
|   flour    | 7 7/8 tbsp |  ± 5 1/4  |     92     |
|    salt    |  1/2 tsp   |   ± 1/4   |     50     |
|   sugar    |  3/4 cup   |   ± 5/8   |     81     |
|  vanilla   | 1 1/8 tsp  |   ± 3/4   |     65     |
+------------+------------+-----------+------------+
```

### Pancakes

```
$ python3 run.py --recipe pancakes
```

The machine learning clustering highlights the major difference between pancakes - whether they are buttermilk or not. These are the first two biggest clusters, where the first one has milk and the second uses buttermilk.

```
cluster 17 (n=36)
+---------------+-----------+-----------+------------+
|   Ingredient  |   Amount  | Variation | Rel. Freq. |
+---------------+-----------+-----------+------------+
| baking powder | 1 3/8 tsp |  ± 1 7/8  |    100     |
|     butter    | 3 5/8 tsp |  ± 5 3/8  |    103     |
|      eggs     |  1 whole  |   ± 1/2   |     94     |
|     flour     | 1 1/2 cup |   ± 1/4   |     89     |
|      milk     | 1 1/4 cup |   ± 1/4   |     94     |
|      salt     |  3/4 tsp  |   ± 1/2   |     89     |
|     sugar     | 3 1/8 tsp |  ± 3 5/8  |    100     |
+---------------+-----------+-----------+------------+
```

```
cluster 4 (n=30)
+---------------+-----------+-----------+------------+
|   Ingredient  |   Amount  | Variation | Rel. Freq. |
+---------------+-----------+-----------+------------+
| baking powder |  3/4 tsp  |   ± 3/4   |     80     |
|  baking soda  |  7/8 tsp  |   ± 3/8   |     97     |
|     butter    | 6 3/4 tsp |  ± 10 1/4 |     97     |
|   buttermilk  | 1 5/8 cup |   ± 3/8   |    100     |
|      eggs     |  2 whole  |   ± 3/8   |     93     |
|     flour     | 1 3/8 cup |   ± 3/8   |     97     |
|      salt     |  1/2 tsp  |   ± 1/4   |     87     |
|     sugar     | 3 3/4 tsp |  ± 4 1/4  |    103     |
|    vanilla    |  7/8 tsp  |   ± 5/8   |     37     |
+---------------+-----------+-----------+------------+
```

### Hamburger

Here's a funny thing. If you are not too specific about the recipe you want, you might get clusters of truly different recipes. Consider the hamburger.

```
$ python3 run.py --recipe hamburger
```

The biggest cluster for hamburger is obviously a list of ingredients for a hamburger recipe albeit the proportions are off (you can just multiple the amounts by some factor).

```
cluster 5 (n=26)
+----------------------+-----------+-----------+------------+
|      Ingredient      |   Amount  | Variation | Rel. Freq. |
+----------------------+-----------+-----------+------------+
|         beef         | 1 1/8 cup |   ± 7/8   |     62     |
|        garlic        | 1 1/4 cup |   ± 7/8   |     31     |
|         salt         | 1 5/8 tsp |  ± 1 3/4  |     50     |
| worcestershire sauce |   7 tsp   |  ± 6 1/2  |     42     |
+----------------------+-----------+-----------+------------+
```

Interestingly, one of the next biggest clusters is not a hamburger - it has no meat in it! Looking at it closer though it is obviously a hamburger *bun* recipe, which the machine learning clustering automatically detected. Lol.

```
cluster 11 (n=17)
+------------+-----------+-----------+------------+
| Ingredient |   Amount  | Variation | Rel. Freq. |
+------------+-----------+-----------+------------+
|   butter   | 1 3/4 tsp |  ± 2 3/8  |     88     |
|    eggs    |  1 whole  |   ± 1/4   |     88     |
|   flour    | 2 1/2 cup |   ± 7/8   |    106     |
|    salt    |  1/2 tsp  |   ± 1/2   |     82     |
|   sugar    | 4 5/8 tsp |  ± 4 3/8  |     88     |
|   water    |  5/8 cup  |   ± 3/8   |     94     |
|   yeast    | 5 5/8 tsp |  ± 10 3/4 |    100     |
+------------+-----------+-----------+------------+
```

# Try it

## Install

First clone the repository.

```
$ git clone https://github.com/schollz/consensus-cookery
$ cd consensus-cookery
```

Then install [node](https://github.com/schollz/raspberry-pi-turnkey#install-node-optional). And then install node dependencies:

```
$ yarn install
```

Make sure you have `pandoc`:

```
$ sudo apt-get install pandoc
```

And then install python dependencies:

```
$ sudo python3 -m pip install prettytable pypandoc requests tqdm ete3 sklearn numpy click
```

## Run

Just run from the command line and specify the food that you want.

```
$ python3 run.py --recipe brownies
```

Be patient as it will take 3-5 minutes to download and pre-process the data. Data is only downloaded once, if you run it a second time it will use the previous data.

You can also generate different number of clusters using `--clusters X` where `X` is the number of clusters.

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

