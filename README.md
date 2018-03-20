# consensus-cookery

This repository is a quick-and-dirty implementation of recipe clustering and recipe averaging. Sometimes I want to get a recipe for something so I will go find a couple of recipes for the same thing and try to use them as a guide to generate a consensus or "average" recipe to cook with. This code should make it easy to generate consensus recipes (useful!) and also show variation between recipes (interesting!).

Finding a consensus recipe requires first clustering many recipes. This is because a single recipe (*e.g.* a recipe for brownies) might have many significant variations (*e.g.* brownies can have just cocoa, just chocolate, or both). This code will first cluster recipes and then use the clusters to deliver the consensus recipe.

## Example

The *quick-and-dirty* implementation goes like this:

1. Choose a recipe (*e.g.* brownies, crepes, pancakes).
2. Search using duckduckgo.com to find hundreds of corresponding recipes (`fetch_urls.js`).
3. Download all the recipes and use `pandoc` to convert to text for processing.
4. Use a really simple (read: *bad*) context-extractor to grab ingredients.
5. Cluster the recipes based on the presence of ingredients.
6. Take the median values for ingredients in a given cluster to create an average recipe.

The context-extractor works by finding the most likely "ingredient" section in the web page and then trying to parse those ingredients using a greedy search from a list of likely ingredients (`top_5k.txt`). Its not a great implementation. However, the errors in it are pretty random, which means you can get okay results as long as you have ~hundreds of recipes. 

The median values are used, rather than the mean, so its less susceptible to bad parsing of the quantity. Again, as long as the parser is okay, it should be accurate enough.

Here's some examples of running the code.

### Brownies

As mentioned, brownies are sometimes made with cocoa, sometimes chocolate, and sometimes both. Interestingly the machine learning automatically detects this. 

```
$ python3 run.py --recipe brownies
```

Here's the biggest "brownie" cluster which shows ingredients for a consensus recipe made with chocolate (made up of 44 recipes). The `Rel. Freq.` corresponds to the percentage of recipes that contain that ingredient.

```
cluster 0 (n=44)
+------------+-------------+------------+
| Ingredient |    Amount   | Rel. Freq. |
+------------+-------------+------------+
|   butter   |  4 1/2 tbsp |     98     |
| chocolate  |  4 1/2 tbsp |     93     |
|    eggs    | 1 5/8 whole |     93     |
|   flour    |  6 3/4 tbsp |     80     |
|    salt    |   1/4 tsp   |     50     |
|   sugar    |   3/4 cup   |     91     |
|  vanilla   |   1/2 tsp   |     70     |
+------------+-------------+------------+
```

The next biggest cluster shows ingredients for a brownie recipe that is made with cocoa powder. (Also it uses baking powder unlike the previous recipe).

```
cluster 11 (n=28)
+---------------+------------+------------+
|   Ingredient  |   Amount   | Rel. Freq. |
+---------------+------------+------------+
| baking powder |  1/4 tsp   |     86     |
|     cocoa     | 3 1/4 tbsp |     71     |
|      eggs     | 1.0 whole  |     57     |
|     flour     |  5.0 tbsp  |     93     |
|      salt     |  1/4 tsp   |     79     |
|     sugar     | 7 1/4 tbsp |     93     |
|    vanilla    |  1/4 tsp   |     68     |
+---------------+------------+------------+
```

The third biggest cluster shows ingredients for a brownie recipe that uses both chocolate *and* cocoa.

```
cluster 4 (n=28)
+-------------+-------------+------------+
|  Ingredient |    Amount   | Rel. Freq. |
+-------------+-------------+------------+
| brown sugar |   6.0 tbsp  |    100     |
|    butter   |  6 3/4 tbsp |    100     |
|  chocolate  |  6 1/2 tbsp |     89     |
|    cocoa    |  5 3/4 tbsp |     54     |
|     eggs    | 1 7/8 whole |    104     |
|    flour    |   1/2 cup   |     89     |
|     salt    |   3/8 tsp   |     86     |
|    sugar    |   1/2 cup   |    100     |
|   vanilla   |   3/8 tsp   |    100     |
+-------------+-------------+------------+
```

You may notice that the proportions are odd (`1 7/8 eggs`!) which is because the program tries to normalize the recipes to a specified volume, and then converts them back to the median volume in all the recipe cluster.

### Pancakes

```
$ python3 run.py --recipe pancakes
```

The machine learning clustering highlights the major difference between pancakes - whether they are buttermilk or not. These are the first two biggest clusters, where the first one has milk and the second uses buttermilk.

```
cluster 15 (n=33)
+---------------+-------------+------------+
|   Ingredient  |    Amount   | Rel. Freq. |
+---------------+-------------+------------+
| baking powder |   1/8 tsp   |    100     |
|     butter    |   1/2 tsp   |    103     |
|      eggs     | 1 1/4 whole |     97     |
|     flour     |  1 1/4 cup  |    100     |
|      milk     |  1 1/8 cup  |     94     |
|      salt     |   1/2 tsp   |     94     |
|     sugar     |  1 1/2 tsp  |    100     |
+---------------+-------------+------------+
```

```
cluster 14 (n=29)
+---------------+-------------+------------+
|   Ingredient  |    Amount   | Rel. Freq. |
+---------------+-------------+------------+
| baking powder |   5/8 tsp   |    100     |
|  baking soda  |   1/2 tsp   |     97     |
|     butter    |   1/2 tsp   |    100     |
|   buttermilk  |  1 1/4 cup  |     97     |
|      eggs     | 1 1/8 whole |     97     |
|     flour     |  1 1/8 cup  |    100     |
|      salt     |   3/8 tsp   |     90     |
|     sugar     |  1 1/4 tsp  |    103     |
|    vanilla    |   5/8 tsp   |     41     |
+---------------+-------------+------------+
```

### Homemade noodles

```
$ python3 run.py --recipe 'homemade noodles'
```

The machine learning clustering picks up on an important distinction within noodle making - whether to use semolina *or* flour.

```
cluster 18 (n=24)
+------------+-------------+------------+
| Ingredient |    Amount   | Rel. Freq. |
+------------+-------------+------------+
|    eggs    | 2 1/2 whole |     83     |
|   flour    |  2 3/8 cup  |    129     |
|    salt    |   5/8 tsp   |     75     |
|   water    |  6 3/8 tbsp |    100     |
+------------+-------------+------------+
```

```
cluster 14 (n=16)
+------------+------------+------------+
| Ingredient |   Amount   | Rel. Freq. |
+------------+------------+------------+
|    eggs    | 2.0 whole  |    112     |
|   flour    | 1 3/8 cup  |    119     |
| olive oil  | 2 7/8 tsp  |     94     |
|    salt    |  5/8 tsp   |     75     |
|  semolina  |  1.0 cup   |     31     |
|   water    | 3 7/8 tbsp |     75     |
+------------+------------+------------+
```

### Hamburger

Here's a funny thing. If you are not too specific about the recipe you want, you might get clusters of truly different recipes. Consider the hamburger.

```
$ python3 run.py --recipe hamburger
```

The biggest cluster for hamburger is obviously a list of ingredients for a hamburger recipe albeit the proportions are off (you can just multiple the amounts by some factor).

```
+----------------------+------------+------------+
|      Ingredient      |   Amount   | Rel. Freq. |
+----------------------+------------+------------+
|         beef         | 3 5/8 tbsp |     87     |
|         eggs         | 3/8 whole  |     33     |
|        garlic        | 6 1/2 tbsp |     77     |
|        onion         | 4 1/8 tbsp |     50     |
|         salt         |  1/4 tsp   |     40     |
| worcestershire sauce |  1.0 tsp   |     47     |
+----------------------+------------+------------+
```

Interestingly, one of the next biggest clusters is not a hamburger - it has no meat in it! Looking at it closer though it is obviously a hamburger *bun* recipe, which the machine learning clustering automatically detected. Lol.

```
+------------+-----------+------------+
| Ingredient |   Amount  | Rel. Freq. |
+------------+-----------+------------+
|   butter   |  1.0 tsp  |     53     |
|    eggs    | 7/8 whole |     79     |
|   flour    | 2 3/8 cup |     95     |
|    milk    |  3/4 cup  |     37     |
|    salt    |  7/8 tsp  |     74     |
|   sugar    | 3 1/8 tsp |     95     |
|   water    |  5/8 cup  |     79     |
|   yeast    |  5/8 tsp  |     79     |
+------------+-----------+------------+
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
$ sudo python3 -m pip install pypandoc requests tqdm ete3 sklearn numpy click
```

## Run

Just run from the command line and specify the food that you want.

```
$ python3 run.py --recipe brownies
```

Be patient as it will take 3-5 minutes to download and pre-process the data. Data is only downloaded once, if you run it a second time it will use the previous data.

See the examples above for more information.

# Roadmap

This is a *quick-and-dirty* project. I don't plan to do much more on it, it was just a fun thing. 

However, here are some things I realize this project *does not do* and would be great to implement:

- [ ] Making food volumes more accurate. The code specifies a constant density for ingredients that are specified in weight so that they can be converted to volumes (volumes are necessary for normalization before taking medians). In reality different foods have different densities, of course.
- [ ] Making proportions more accurate. This will be easier if the previous item is finished.
- [ ] Adding in a specifier for the variation in the amount (show the median and the standard deviation of the mean?).
- [ ] Adding in recipe directions. Is there a way towards consensus directions? This might be really really hard.
- [ ] In general, making the parsing (from websites) and the food tagging better. There are more sophisticated taggers (see NYT food tagger).

# License

MIT

