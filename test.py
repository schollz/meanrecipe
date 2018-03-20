# coding=utf-8
import re
import sys
import operator
import json
from fractions import Fraction
import subprocess
import os
import collections 

from tqdm import tqdm
import numpy as np 
from sklearn import tree
from sklearn.cluster import AgglomerativeClustering
import ete3

def hasNumbers(inputString):
    return any(char.isdigit() for char in inputString)


# GLOBALS
# 1 ounce = 28.3495 grams
# densities are 0.9 g/ml (average), so
# 1 ounce ~ 0.1331427 cups
regex = re.compile('[^a-zA-Z\d\s:]')
conversion_to_cup = {
    'tablespoon': 1/16,
    'tbsp': 1/16,
    'teaspoon': 1/48, 
    'tsp': 1/48,
    'cup': 1,
    'ounce': 0.1331427,
    'gram':0.00469,
}
def get_ingredient_list():
    possible_ingredients_map = {}
    with open('top_5k.txt','r') as f:
        for line in f:
            ing = regex.sub('',line.lower()).strip()
            if len(ing) < 3:
                continue
            possible_ingredients_map[ing] = len(ing)
    ingredient_list = []
    for ing in sorted(possible_ingredients_map.items(), key=operator.itemgetter(1),reverse=True):
        ingredient_list.append(' ' + ing[0] + ' ')
    return ingredient_list
ingredient_list = get_ingredient_list()
ingredient_corpus="""    chopped bittersweet chocolate
-   8 tablespoons unsalted butter (1 stick), cut into 8 pieces
-   2 large eggs, at room temperature
-   1 cup granulated sugar
-   1 teaspoon vanilla extract
-   1/2 teaspoon baking powder
-   1/4 teaspoon fine salt
-   1 cup all-purpose flour
-    ┬╜ cup cocoa
-    ┬╜ cup butter (1 stick)
-    2 eggs
-    1 cup sugar
-    ┬╝ cup flour
-    1 cup chopped or broken-up walnuts or pecans
-    1 teaspoon vanilla
-    Pinch of salt
-    1 stick unsalted butter, cut into large pieces
-    6 ounces bittersweet chocolate, chopped
-    1 1/2 cups sugar
semolina
-    3 large eggs
-    1/4 cup unsweetened Dutch-process cocoa powder
-    1/2 teaspoon coarse salt
-    1/2 cup plus 2 tablespoons all-purpose flour, sifted
"""
ingredient_words = set(regex.sub('',ingredient_corpus.lower()).split())
# print(ingredient_words)


def get_ingredient_lines(fname):
    global regex
    cmd = "pandoc -f html -t plain {}".format(fname)
    proc = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
    out = proc.communicate()[0]
    # print(out.decode('utf-8'))
    newlines = []

    group_mags = {}
    group_mag = 0
    group_list = []
    try:
        lines = out.decode('utf-8').replace('⅔','2/3').replace('⅓','1/3').replace('½','1/2').split("\n")
    except:
        return []
    for i,line in enumerate(lines):
        words = set(regex.sub('',line.lower()).split())
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
    for key in sorted(group_mags.keys(),reverse=True):
        for i in group_mags[key]:
            ingredient_lines.append(lines[i].strip().lower())
        break

    return ingredient_lines



def process_ingredient_lines(ingredient_lines):
    processed_ingredients = []
    all_ingredients = []

    # determine the ingredient  
    for ingredient_line in ingredient_lines:
        sentence = ' ' +  ' '.join(regex.sub('',ingredient_line.lower()).strip().split()) + ' ' 
        gotOne = False
        for ing in ingredient_list:
            if ing in sentence:     
                processed_ingredients.append({'line':ingredient_line,'ingredient':ing.strip()})
                all_ingredients.append(ing.strip())
                gotOne = True
                break
        if not gotOne:
            print("PROBLEM")
            print(ingredient_line)
            print(sentence)

    # determine quantity 
    for i,_ in enumerate(processed_ingredients):
        ingredient_line = processed_ingredients[i]['line']
        started = False
        value = 0 
        for j,word in enumerate(ingredient_line.split()):
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
    for i,_ in enumerate(processed_ingredients):
        if 'qty' not in processed_ingredients[i]:
            continue
        ingredient_line = processed_ingredients[i]['line']
        processed_ingredients[i]['unit'] = 'whole'
        for conv in conversion_to_cup:
            if conv in ingredient_line:
                processed_ingredients[i]['unit'] = 'cup'
                processed_ingredients[i]['qty'] = processed_ingredients[i]['qty']*conversion_to_cup[conv]
        if processed_ingredients[i]['ingredient'] == 'eggs':
            processed_ingredients[i]['unit'] = 'cup'
            processed_ingredients[i]['qty'] = processed_ingredients[i]['qty']*0.5
        if processed_ingredients[i]['qty'] > 20:
            processed_ingredients[i]['qty'] = 0

    total_cups = 0
    for i, _ in enumerate(processed_ingredients):
        total_cups +=  processed_ingredients[i]['qty']
    if total_cups == 0:
        return {'lines':[],'ingredients':[]}

    for i, _ in enumerate(processed_ingredients):
        processed_ingredients[i]['qty'] = float(processed_ingredients[i]['qty']) * float(10)/float(total_cups)

    return ({'lines':processed_ingredients,'ingredients':list(sorted(set(all_ingredients)))})

# ingredient_lines = get_ingredient_lines(os.path.join('brownies2',sys.argv[1]))
# j= process_ingredient_lines(ingredient_lines)
# print(j)
# raise


folder_name = 'brownies'

filenames =  os.listdir(folder_name)
recipes = []
for fname in tqdm(filenames):
    ingredient_lines = get_ingredient_lines(os.path.join(folder_name,fname))
    j= process_ingredient_lines(ingredient_lines)
    # print(json.dumps(j,indent=2))
    if len(j['lines']) > 3:
        j['id'] = len(recipes)
        j['fname'] = fname
        recipes.append(j)

with open(folder_name + "_recipes.json",'w') as f:
    f.write(json.dumps(recipes,indent=2))

recipes = json.load(open(folder_name + '_recipes.json','r'))









def build_Newick_tree(children,n_leaves,X,leaf_labels,spanner):
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
    return go_down_tree(children,n_leaves,X,leaf_labels,len(children)+n_leaves-1,spanner)[0]+';'

def go_down_tree(children,n_leaves,X,leaf_labels,nodename,spanner):
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
    nodeindex = nodename-n_leaves
    if nodename<n_leaves:
        return leaf_labels[nodeindex],np.array([X[nodeindex]])
    else:
        node_children = children[nodeindex]
        branch0,branch0samples = go_down_tree(children,n_leaves,X,leaf_labels,node_children[0],spanner)
        branch1,branch1samples = go_down_tree(children,n_leaves,X,leaf_labels,node_children[1],spanner)
        node = np.vstack((branch0samples,branch1samples))
        branch0span = spanner(branch0samples)
        branch1span = spanner(branch1samples)
        nodespan = spanner(node)
        branch0distance = nodespan-branch0span
        branch1distance = nodespan-branch1span
        nodename = '({branch0}:{branch0distance},{branch1}:{branch1distance})'.format(branch0=branch0,branch0distance=branch0distance,branch1=branch1,branch1distance=branch1distance)
        return nodename,node

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
    if aggClusterer.linkage=='ward':
        if aggClusterer.affinity=='euclidean':
            spanner = lambda x:np.sum((x-aggClusterer.pooling_func(x,axis=0))**2)
    elif aggClusterer.linkage=='complete':
        if aggClusterer.affinity=='euclidean':
            spanner = lambda x:np.max(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2))
        elif aggClusterer.affinity=='l1' or aggClusterer.affinity=='manhattan':
            spanner = lambda x:np.max(np.sum(np.abs(x[:,None,:]-x[None,:,:]),axis=2))
        elif aggClusterer.affinity=='l2':
            spanner = lambda x:np.max(np.sqrt(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2)))
        elif aggClusterer.affinity=='cosine':
            spanner = lambda x:np.max(np.sum((x[:,None,:]*x[None,:,:]))/(np.sqrt(np.sum(x[:,None,:]*x[:,None,:],axis=2,keepdims=True))*np.sqrt(np.sum(x[None,:,:]*x[None,:,:],axis=2,keepdims=True))))
        else:
            raise AttributeError('Unknown affinity attribute value {0}.'.format(aggClusterer.affinity))
    elif aggClusterer.linkage=='average':
        if aggClusterer.affinity=='euclidean':
            spanner = lambda x:np.mean(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2))
        elif aggClusterer.affinity=='l1' or aggClusterer.affinity=='manhattan':
            spanner = lambda x:np.mean(np.sum(np.abs(x[:,None,:]-x[None,:,:]),axis=2))
        elif aggClusterer.affinity=='l2':
            spanner = lambda x:np.mean(np.sqrt(np.sum((x[:,None,:]-x[None,:,:])**2,axis=2)))
        elif aggClusterer.affinity=='cosine':
            spanner = lambda x:np.mean(np.sum((x[:,None,:]*x[None,:,:]))/(np.sqrt(np.sum(x[:,None,:]*x[:,None,:],axis=2,keepdims=True))*np.sqrt(np.sum(x[None,:,:]*x[None,:,:],axis=2,keepdims=True))))
        else:
            raise AttributeError('Unknown affinity attribute value {0}.'.format(aggClusterer.affinity))
    else:
        raise AttributeError('Unknown linkage attribute value {0}.'.format(aggClusterer.linkage))
    return spanner


all_ingredients = []
for recipe in recipes:
    all_ingredients += recipe['ingredients']
all_ingredients = list(set(all_ingredients)-set(['salt','vanilla','eggs']))

X = np.zeros((len(recipes),len(all_ingredients)))
for i,recipe in enumerate(recipes):
    for line in recipe['lines']:
        if line['ingredient'] in all_ingredients:
            X[i,all_ingredients.index(line['ingredient'])] = 1 # line['qty']

clusterer = AgglomerativeClustering(n_clusters=20,compute_full_tree=True) # You can set compute_full_tree to 'auto', but I left it this way to get the entire tree plotted
clusterer.fit(X) # X for whatever you want to fit
spanner = get_cluster_spanner(clusterer)
leaf_labels = []
for i in range(0,len(recipes)):
    leaf_labels.append('{} ({})'.format(i,clusterer.labels_[i]))
leaf_labels = list(range(0,len(recipes)))
newick_tree = build_Newick_tree(clusterer.children_,clusterer.n_leaves_,X,leaf_labels,spanner) # leaf_labels is a list of labels for each entry in X
tree = ete3.Tree(newick_tree)

label_counts = {}
cluster_labels = {}
for i,l in enumerate(clusterer.labels_):
    if l not in label_counts:
        cluster_labels[l] = []
        label_counts[l] = 0
    label_counts[l] += 1
    cluster_labels[l].append(i)


print(cluster_labels)


def get_mean_recipe(recipes,recipe_ids):
    recipe = {}
    for i in recipe_ids:
        for line in recipes[i]['lines']:
            ing = line['ingredient']
            qty = line['qty']
            unit = line['unit']
            if ing not in recipe:
                recipe[ing] = {'qty':[],'unit':unit}
            if qty > 0.00001:
                recipe[ing]['qty'].append(qty)
    ordering = {}
    for ing in recipe:
        if len(recipe[ing]['qty']) <2:
            continue
        recipe[ing]['freq'] = len(recipe[ing]['qty'])/len(recipe_ids)
        recipe[ing]['qty'] = np.median(recipe[ing]['qty'])
        ordering[ing] = recipe[ing]['freq']

    d = collections.OrderedDict()
    for k in sorted(ordering.items(), key=operator.itemgetter(1),reverse=True):
        ing = k[0]
        d[ing] = {'freq':k[1],'qty':recipe[ing]['qty'],'unit':'cup'}
        if ing == 'eggs':
            d[ing]['qty'] = d[ing]['qty'] * 2
            d[ing]['unit'] = 'whole'           
        elif d[ing]['qty'] < 0.0417:
            d[ing]['qty'] = d[ing]['qty'] * 48
            d[ing]['unit'] = 'tsp'
        elif d[ing]['qty'] < 0.125:
            d[ing]['qty'] = d[ing]['qty'] * 16
            d[ing]['unit'] = 'tbsp'
    return d

for i,l in enumerate(sorted(label_counts.items(), key=operator.itemgetter(1),reverse=True)):
    if len(cluster_labels[l[0]]) < 5:
        continue
    print("-"*30)
    print("cluster {} (n={})".format(l[0],len(cluster_labels[l[0]])))
    mean_recipe = get_mean_recipe(recipes,cluster_labels[l[0]])
    for ing in mean_recipe:
        if mean_recipe[ing]['freq'] > 0.5:
            print('{:2.1f} {} {} ({:2.1f}%)'.format(mean_recipe[ing]['qty'],mean_recipe[ing]['unit'],ing,mean_recipe[ing]['freq']*100))


