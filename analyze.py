# coding=utf-8
import re
import sys
import operator
import json
from fractions import Fraction
import subprocess
import os
import collections
import gzip

from tqdm import tqdm
import numpy as np
np.random.seed(1)
from sklearn import tree
from sklearn.cluster import AgglomerativeClustering
import ete3
from prettytable import PrettyTable


def hasNumbers(inputString):
    return any(char.isdigit() for char in inputString)


# GLOBALS
# 1 ounce = 28.3495 grams
# densities are 0.9 g/ml (average), so
# 1 ounce ~ 0.1331427 cups
regex = re.compile('[^a-zA-Z\d\s:]')
conversion_to_cup = {
    'tablespoon': 1 / 16,
    'tablespoons': 1 / 16,
    'tbsp': 1 / 16,
    'tbsps': 1 / 16,
    'teaspoon': 1 / 48,
    'teaspoons': 1 / 48,
    'tsp': 1 / 48,
    'tsps': 1 / 48,
    'cup': 1,
    'cups': 1,
    'ounce': 0.1331427,
    'ounces': 0.1331427,
    'gram': 0.00469,
    'grams': 0.00469,
}


def get_ingredient_list():
    possible_ingredients_map = {}
    with open('top_5k.txt', 'r') as f:
        for line in f:
            ing = regex.sub('', line.lower()).strip()
            if len(ing) < 3:
                continue
            possible_ingredients_map[ing] = len(ing)
    ingredient_list = []
    for ing in sorted(
            possible_ingredients_map.items(),
            key=operator.itemgetter(1),
            reverse=True):
        ingredient_list.append(' ' + ing[0] + ' ')
    return ingredient_list


ingredient_list = get_ingredient_list()
ingredient_corpus = """
chopped sliced diced cut canned sticks of cut into pieces
unsalted cup teaspoon sugar flour egg vanilla egegs pinch
dash large coarse fine sifted broken-up salt tsp tbsp 
oil optional extract banana mashed
salt
sugar
butter
garlic
water
olive oil
milk
flour
onion
pepper
onions
black pepper
brown sugar
eggs
cinnamon
baking powder
lemon juice
tomatoes
vanilla
parsley
baking soda
sour cream
vegetable oil
celery
ginger
lemon
cream cheese
carrots
cheddar cheese
beef
potatoes
oil
honey
nutmeg
cheese
soy sauce
mayonnaise
chicken broth
oregano
cumin
thyme
garlic powder
salt and pepper
mushrooms
cilantro
basil
pecans
bacon
heavy cream
chicken breasts
worcestershire sauce
paprika
chocolate
chicken
walnuts
chili powder
almonds
lime juice
parmesan cheese
pineapple
rice
orange juice
green pepper
raisins
coconut
cayenne pepper
nuts
dijon mustard
cornstarch
mzarella cheese
buttermilk
vinegar
apples
red pepper
tomato sauce
bread crumbs
oats
spinach
shortening
red pepper flakes
shallots
tomato paste
red bell pepper
lime
shrimp
semolina
zucchini
strawberries
rosemary
canola oil
green onions
bananas
scallions
cloves
mustard
chicken stock
chives
whipping cream
bread
maple syrup
orange
corn starch
balsamic vinegar
dry white wine
coriander
bay leaf
ketchup
yogurt
red wine vinegar
avocado
sesame oil
cabbage
bay leaves
broccoli
salt and black pepper
chicken breast
cocoa
carrot
basil leaves
onion powder
cucumber
peanut butter
allspice
dry mustard
cranberries
mint
ham
green bell pepper
blueberries
soda
peas
curry powder
corn
coconut milk
lettuce
white pepper
sesame seeds
pork
turmeric
pasta
dill
yellow onion
white wine
red onion
jalapeno chilies
cream of mushroom soup
beans
almond extract
black beans
garlic salt
peanuts
cider vinegar
white vinegar
margarine
green beans
cream
molasses
confectioners sugar
pumpkin
coconut oil
sauce
turkey
yeast
olives
corn syrup
sage
rice vinegar
raspberries
beef broth
salt & pepper
ricotta cheese
salsa
tomato
breadcrumbs
spray
cilantro leaves
parsley leaves
apple cider vinegar
capers
bell pepper
gelatin
green chilies
black olives
feta cheese
swiss cheese
cherry tomatoes
potato
oranges
cool whip
cream of tartar
cornmeal
pineapple juice
italian seasoning
cherries
cauliflower
white wine vinegar
whipped cream
applesauce
asparagus
thyme leaves
salmon
cooking oil
cayenne
flour tortillas
dates
leeks
purple onion
green onion
mint leaves
dressing
skim milk
oatmeal
mango
graham cracker crumbs
fish sauce
peanut oil
red wine
cottage cheese
salad oil
heavy whipping cream
tuna
apple
sausage
vanilla ice cream
cooking spray
eggplant
plum tomatoes
tarragon
thru
peaches
goat cheese
ice
kidney beans
can cream of chicken soup
chicken thighs
tofu
corn tortillas
chickpeas
vegetable broth
celery seed
shallot
clove
chicken soup
spaghetti
lemon peel
black peppercorns
lg. onion
yellow cake mix
banana
"""
ingredient_words = set(regex.sub('', ingredient_corpus.lower()).split())

# print(ingredient_words)


def get_ingredient_lines(fname):
    global regex

    out = gzip.open(fname, 'rb').read()
    newlines = []

    group_mags = {}
    group_mag = 0
    group_list = []
    try:
        lines = out.decode('utf-8')
        url = lines.split("\n")[0]
        lines = lines.replace('¾', ' 3/4 ').replace('-', ' ').replace(
            '¼', ' 1/4 ').replace('⅔', ' 2/3 ').replace('⅓', ' 1/3 ').replace(
                '½', ' 1/2 ').lower()
        gRegex = re.compile("\d+g ")
        for g in gRegex.findall(lines):
            num = g.split('g ')[0]
            lines = lines.replace(g, num + ' grams ')
        lines = lines.split("\n")
    except:
        return []
    for i, line in enumerate(lines):
        words = set(regex.sub('', line.lower()).split())
        if len(words) > 0:
            word_intersection = len(words & ingredient_words)
            if word_intersection > 0 and hasNumbers(line):
                group_list.append(i)
                group_mag += word_intersection
            else:
                group_mags[group_mag] = group_list
                group_list = []
                group_mag = 0

    ingredient_lines = []
    for key in sorted(group_mags.keys(), reverse=True):
        for i in group_mags[key]:
            ingredient_lines.append(lines[i].strip().lower())
        break

    return url, ingredient_lines


def process_ingredient_lines(ingredient_lines):
    processed_ingredients = []
    all_ingredients = []

    # determine the ingredient
    for ingredient_line in ingredient_lines:
        sentence = ' ' + ' '.join(
            regex.sub('', ingredient_line.lower()).strip().split()) + ' '
        sentence = sentence.replace(' egg ', ' eggs ')
        gotOne = False
        for ing in ingredient_list:
            if ing in sentence:
                processed_ingredients.append({
                    'line': ingredient_line,
                    'ingredient': ing.strip()
                })
                all_ingredients.append(ing.strip())
                gotOne = True
                break
        # if not gotOne:
        #     print("PROBLEM")
        #     print(ingredient_line)
        #     print(sentence)

    # determine quantity
    for i, _ in enumerate(processed_ingredients):
        ingredient_line = processed_ingredients[i]['line']
        started = False
        value = 0
        for j, word in enumerate(ingredient_line.split()):
            if j == 0 and ('.' in word or ')' in word):
                # skip things like 1. 2.
                continue
            hasNum = hasNumbers(word)
            if started and not hasNum:
                break
            if hasNum:
                started = True
                try:
                    value += float(sum(Fraction(s) for s in word.split()))
                except:
                    pass
        processed_ingredients[i]['qty'] = value

    # convert to cups
    for i, _ in enumerate(processed_ingredients):
        if 'qty' not in processed_ingredients[i]:
            continue
        ingredient_line = processed_ingredients[i]['line']
        processed_ingredients[i]['unit'] = 'whole'
        for conv in conversion_to_cup:
            if conv in ingredient_line:
                processed_ingredients[i]['unit'] = 'cup'
                processed_ingredients[i]['qty'] = processed_ingredients[i][
                    'qty'] * conversion_to_cup[conv]
        if processed_ingredients[i]['ingredient'] == 'eggs':
            processed_ingredients[i]['unit'] = 'cup'
            processed_ingredients[i]['qty'] = processed_ingredients[i][
                'qty'] * 0.5
        if processed_ingredients[i]['qty'] > 20:
            processed_ingredients[i]['qty'] = 0

    total_cups = 0
    for i, _ in enumerate(processed_ingredients):
        total_cups += processed_ingredients[i]['qty']
    if total_cups == 0:
        return {'lines': [], 'ingredients': [], 'original_total': 0}

    new_total = 0
    for i, _ in enumerate(processed_ingredients):
        processed_ingredients[i]['original_qty'] = processed_ingredients[i][
            'qty']
        processed_ingredients[i]['qty'] = float(
            processed_ingredients[i]['qty']) * float(4) / float(total_cups)
        new_total += processed_ingredients[i]['qty']

    return ({
        'lines': processed_ingredients,
        'ingredients': list(sorted(set(all_ingredients))),
        'original_total': total_cups,
        'total': new_total
    })


# ingredient_lines = get_ingredient_lines(os.path.join('brownies2',sys.argv[1]))
# j= process_ingredient_lines(ingredient_lines)
# print(j)
# raise


def build_Newick_tree(children, n_leaves, X, leaf_labels, spanner):
    """
    build_Newick_tree(children,n_leaves,X,leaf_labels,spanner)

    Get a string representation (Newick tree) from the sklearn
    AgglomerativeClustering.fit output.

    Input:
        children: AgglomerativeClustering.children_
        n_leaves: AgglomerativeClustering.n_leaves_
        X: parameters supplied to AgglomerativeClustering.fit
        leaf_labels: The label of each parameter array in X
        spanner: Callable that computes the dendrite's span

    Output:
        ntree: A str with the Newick tree representation

    """
    return go_down_tree(children, n_leaves, X, leaf_labels,
                        len(children) + n_leaves - 1, spanner)[0] + ';'


def go_down_tree(children, n_leaves, X, leaf_labels, nodename, spanner):
    """
    go_down_tree(children,n_leaves,X,leaf_labels,nodename,spanner)

    Iterative function that traverses the subtree that descends from
    nodename and returns the Newick representation of the subtree.

    Input:
        children: AgglomerativeClustering.children_
        n_leaves: AgglomerativeClustering.n_leaves_
        X: parameters supplied to AgglomerativeClustering.fit
        leaf_labels: The label of each parameter array in X
        nodename: An int that is the intermediate node name whos
            children are located in children[nodename-n_leaves].
        spanner: Callable that computes the dendrite's span

    Output:
        ntree: A str with the Newick tree representation

    """
    nodeindex = nodename - n_leaves
    if nodename < n_leaves:
        return leaf_labels[nodeindex], np.array([X[nodeindex]])
    else:
        node_children = children[nodeindex]
        branch0, branch0samples = go_down_tree(
            children, n_leaves, X, leaf_labels, node_children[0], spanner)
        branch1, branch1samples = go_down_tree(
            children, n_leaves, X, leaf_labels, node_children[1], spanner)
        node = np.vstack((branch0samples, branch1samples))
        branch0span = spanner(branch0samples)
        branch1span = spanner(branch1samples)
        nodespan = spanner(node)
        branch0distance = nodespan - branch0span
        branch1distance = nodespan - branch1span
        nodename = '({branch0}:{branch0distance},{branch1}:{branch1distance})'.format(
            branch0=branch0,
            branch0distance=branch0distance,
            branch1=branch1,
            branch1distance=branch1distance)
        return nodename, node


def get_cluster_spanner(aggClusterer):
    """
    spanner = get_cluster_spanner(aggClusterer)

    Input:
        aggClusterer: sklearn.cluster.AgglomerativeClustering instance

    Get a callable that computes a given cluster's span. To compute
    a cluster's span, call spanner(cluster)

    The cluster must be a 2D numpy array, where the axis=0 holds
    separate cluster members and the axis=1 holds the different
    variables.

    """
    if aggClusterer.linkage == 'ward':
        if aggClusterer.affinity == 'euclidean':
            spanner = lambda x:np.sum((x-aggClusterer.pooling_func(x,axis=0))**2)
    elif aggClusterer.linkage == 'complete':
        if aggClusterer.affinity == 'euclidean':
            spanner = lambda x:np.max(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2))
        elif aggClusterer.affinity == 'l1' or aggClusterer.affinity == 'manhattan':
            spanner = lambda x:np.max(np.sum(np.abs(x[:,None,:]-x[None,:,:]),axis=2))
        elif aggClusterer.affinity == 'l2':
            spanner = lambda x:np.max(np.sqrt(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2)))
        elif aggClusterer.affinity == 'cosine':
            spanner = lambda x:np.max(np.sum((x[:,None,:]*x[None,:,:]))/(np.sqrt(np.sum(x[:,None,:]*x[:,None,:],axis=2,keepdims=True))*np.sqrt(np.sum(x[None,:,:]*x[None,:,:],axis=2,keepdims=True))))
        else:
            raise AttributeError(
                'Unknown affinity attribute value {0}.'.format(
                    aggClusterer.affinity))
    elif aggClusterer.linkage == 'average':
        if aggClusterer.affinity == 'euclidean':
            spanner = lambda x:np.mean(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2))
        elif aggClusterer.affinity == 'l1' or aggClusterer.affinity == 'manhattan':
            spanner = lambda x:np.mean(np.sum(np.abs(x[:,None,:]-x[None,:,:]),axis=2))
        elif aggClusterer.affinity == 'l2':
            spanner = lambda x:np.mean(np.sqrt(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2)))
        elif aggClusterer.affinity == 'cosine':
            spanner = lambda x:np.mean(np.sum((x[:,None,:]*x[None,:,:]))/(np.sqrt(np.sum(x[:,None,:]*x[:,None,:],axis=2,keepdims=True))*np.sqrt(np.sum(x[None,:,:]*x[None,:,:],axis=2,keepdims=True))))
        else:
            raise AttributeError(
                'Unknown affinity attribute value {0}.'.format(
                    aggClusterer.affinity))
    else:
        raise AttributeError('Unknown linkage attribute value {0}.'.format(
            aggClusterer.linkage))
    return spanner


def get_mean_recipe(recipes, recipe_ids):
    recipe = {}
    totals = []
    urls = []
    for i in recipe_ids:
        totals.append(recipes[i]['original_total'])
        urls.append(recipes[i]['url'])
        for line in recipes[i]['lines']:
            ing = line['ingredient']
            qty = line['qty']
            unit = line['unit']
            if ing not in recipe:
                recipe[ing] = {'qty': [], 'unit': unit}
            if qty > 0.00001:
                recipe[ing]['qty'].append(qty)
    ordering = {}
    cur_total = 0
    for ing in recipe:
        if len(recipe[ing]['qty']) < 2:
            continue
        recipe[ing]['freq'] = len(recipe[ing]['qty']) / len(recipe_ids)
        recipe[ing]['qty'] = np.median(recipe[ing]['qty'])
        cur_total += recipe[ing]['qty']
        ordering[ing] = recipe[ing]['freq']

    median_total = np.median(totals)
    conv_quantity = median_total / cur_total

    d = collections.OrderedDict()
    for k in sorted(
            ordering.items(), key=operator.itemgetter(1), reverse=True):
        ing = k[0]
        d[ing] = {
            'freq': k[1],
            'qty': recipe[ing]['qty'] * conv_quantity,
            'unit': 'cup'
        }
        if ing == 'eggs':
            d[ing]['qty'] = d[ing]['qty'] * 2
            d[ing]['unit'] = 'whole'
        elif d[ing]['qty'] < 0.0417 * 4:
            d[ing]['qty'] = d[ing]['qty'] * 48
            d[ing]['unit'] = 'tsp'
        elif d[ing]['qty'] < 0.125 * 4:
            d[ing]['qty'] = d[ing]['qty'] * 16
            d[ing]['unit'] = 'tbsp'
        d[ing]['qty'] = round(d[ing]['qty'] * 8) / 8
    return d, urls


def dec_to_proper_frac(dec):
    sign = "-" if dec < 0 else ""
    frac = Fraction(abs(dec))
    if frac.numerator % frac.denominator == 0:
        return "{}".format(round(dec))
    if frac.numerator / frac.denominator < 1:
        return f"{frac.numerator % frac.denominator}/{frac.denominator}"
    return (f"{sign}{frac.numerator // frac.denominator} "
            f"{frac.numerator % frac.denominator}/{frac.denominator}")


def get_clusters(folder_name):
    if not os.path.isfile(folder_name + "_recipes.json"):
        filenames = os.listdir(folder_name)
        recipes = []
        for fname in tqdm(filenames):
            if not fname.endswith(".txt"):
                continue
            url, ingredient_lines = get_ingredient_lines(
                os.path.join(folder_name, fname))
            j = process_ingredient_lines(ingredient_lines)
            if len(j['lines']) > 3:
                j['url'] = url
                j['id'] = len(recipes)
                j['fname'] = fname
                recipes.append(j)
        with open(folder_name + "_recipes.json", 'w') as f:
            f.write(json.dumps(recipes, indent=2))

    recipes = json.load(open(folder_name + '_recipes.json', 'r'))

    all_ingredients = []
    for recipe in recipes:
        all_ingredients += recipe['ingredients']
    all_ingredients = list(
        set(all_ingredients) - set(['salt', 'vanilla', 'eggs']))

    X = np.zeros((len(recipes), len(all_ingredients)))
    for i, recipe in enumerate(recipes):
        for line in recipe['lines']:
            if line['ingredient'] in all_ingredients:
                X[i, all_ingredients.index(line[
                    'ingredient'])] = 1  # line['qty']

    clusterer = AgglomerativeClustering(
        n_clusters=20, compute_full_tree=True
    )  # You can set compute_full_tree to 'auto', but I left it this way to get the entire tree plotted
    clusterer.fit(X)  # X for whatever you want to fit
    spanner = get_cluster_spanner(clusterer)
    leaf_labels = []
    for i in range(0, len(recipes)):
        leaf_labels.append('{} ({})'.format(i, clusterer.labels_[i]))
    leaf_labels = list(range(0, len(recipes)))
    newick_tree = build_Newick_tree(
        clusterer.children_, clusterer.n_leaves_, X, leaf_labels,
        spanner)  # leaf_labels is a list of labels for each entry in X
    tree = ete3.Tree(newick_tree)

    label_counts = {}
    cluster_labels = {}
    for i, l in enumerate(clusterer.labels_):
        if l not in label_counts:
            cluster_labels[l] = []
            label_counts[l] = 0
        label_counts[l] += 1
        cluster_labels[l].append(i)

    for i, l in enumerate(
            sorted(
                label_counts.items(), key=operator.itemgetter(1),
                reverse=True)):
        if len(cluster_labels[l[0]]) < 5:
            continue
        mean_recipe, urls = get_mean_recipe(recipes, cluster_labels[l[0]])

        num_ingredients = 0
        for ing in sorted(mean_recipe.keys()):
            if mean_recipe[ing]['freq'] > 0.3:
                num_ingredients += 1

        if num_ingredients < 3:
            continue

        print("\ncluster {} (n={})".format(l[0], len(cluster_labels[l[0]])))
        t = PrettyTable(["Ingredient", "Amount", "Rel. Freq."])
        for ing in sorted(mean_recipe.keys()):
            if mean_recipe[ing]['freq'] > 0.3:
                row = []
                row.append(ing)
                row.append(
                    dec_to_proper_frac(mean_recipe[ing]['qty']) + " " +
                    mean_recipe[ing]['unit'])
                row.append(round(mean_recipe[ing]['freq'] * 100))
                t.add_row(row)
        print(t)
        print("urls:")
        print("\n".join(urls))
