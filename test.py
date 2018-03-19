# coding=utf-8
import re
import sys
import operator
import json
from fractions import Fraction
import subprocess
import os

from tqdm import tqdm

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
    lines = out.decode('utf-8').replace('⅔','2/3').replace('½','1/2').split("\n")
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

    num_eggs = 1

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
        if processed_ingredients[i]['ingredient'] == 'eggs':
            if value == 0:
                value = 1
            num_eggs = value

    scale_factor = 2 / num_eggs
    for i, _ in enumerate(processed_ingredients):
        processed_ingredients[i]['qty'] = processed_ingredients[i]['qty']*scale_factor

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

    if 'eggs' not in all_ingredients:
        return {'lines':[],'ingredients':[]}
    return ({'lines':processed_ingredients,'ingredients':list(sorted(set(all_ingredients)))})

# ingredient_lines = get_ingredient_lines(os.path.join('brownies',sys.argv[1]))
# j= process_ingredient_lines(ingredient_lines)
# print(j)
# raise


# filenames =  os.listdir("brownies")
# recipes = []
# for fname in tqdm(filenames):
#     ingredient_lines = get_ingredient_lines(os.path.join('brownies',fname))
#     j= process_ingredient_lines(ingredient_lines)
#     # print(json.dumps(j,indent=2))
#     if len(j['lines']) > 3:
#         j['id'] = len(recipes)
#         j['fname'] = fname
#         recipes.append(j)

# with open("brownie_recipes.json",'w') as f:
#     f.write(json.dumps(recipes,indent=2))



recipes = json.load(open('brownie_recipes.json','r'))
for ii in enumerate(tqdm(recipes)):
    recipes[ii[0]]['similarity'] = {}
    for j,_ in enumerate(recipes):
        i = ii[0]
        set1 = set(recipes[i]['ingredients'])
        set2 = set(recipes[j]['ingredients'])
        print(set1)
        print(set2)
        similarity = 2*float(len(set1 & set2))/float(len(set1)+len(set2))
        print(i,j,similarity)
        recipes[ii[0]]['similarity'][j] = similarity


num_similar = {}
for i,recipe in enumerate(recipes):
    num_similar[i] = 0
    for k in recipe['similarity']:
        if recipe['similarity'][k] > 0.5:
            num_similar[i] += 1

print(num_similar)
similar_recipes = []
for k in  sorted(num_similar.items(), key=operator.itemgetter(1),reverse=True):
    print(k)
    print(recipes[k[0]]['similarity'])
    for i in recipes[k[0]]['similarity']:
        if recipes[k[0]]['similarity'][i] > 0.5:
            similar_recipes.append(i)
    break

print(similar_recipes)
mean_recipe = {}
for recipe in recipes:
    for line in recipe['lines']:
        if line['ingredient'] not in mean_recipe:
            mean_recipe[line['ingredient']] = []
        if line['qty'] > 0.0001 and line['qty'] < 20:
            mean_recipe[line['ingredient']].append(line['qty'])

with open('mean_recipe.json','w') as f:
    f.write(json.dumps(mean_recipe,indent=2))


import numpy as np 

def reject_outliers(data, m=2):
    if len(data) < 3:
        return data
    return data[abs(data - np.mean(data)) < m * np.std(data)]

for ing in mean_recipe:
    a = np.array(mean_recipe[ing])
    a = reject_outliers(a) 
    if len(a) < 3:
        continue
    m = np.mean(a)
    qty = 'cups'
    if m < 0.1:
        m = m*48
        qty = 'tsp'
    print(ing,m,qty)


from sklearn import tree
all_ingredients = []
for recipe in recipes:
    all_ingredients += recipe['ingredients']
all_ingredients = list(set(all_ingredients))
print(all_ingredients)
X = np.zeros((len(recipes),len(all_ingredients)))
for i,recipe in enumerate(recipes):
    for line in recipe['lines']:
        X[i,all_ingredients.index(line['ingredient'])] = 1

print(X)
clf = tree.DecisionTreeClassifier()
clf = clf.fit(X,np.zeros((len(recipes),1)))

import graphviz
dot_data = tree.export_graphviz(clf, out_file=None) 
dot_data = tree.export_graphviz(clf, out_file=None, 
                         feature_names=all_ingredients,  
                         class_names=np.zeros((len(recipes),1)),  
                         filled=True, rounded=True,  
                         special_characters=True)  
graph = graphviz.Source(dot_data) 
graph
graph.render('iris')



import numpy as np
from sklearn.cluster import AgglomerativeClustering
import ete3

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

clusterer = AgglomerativeClustering(n_clusters=8,compute_full_tree=False) # You can set compute_full_tree to 'auto', but I left it this way to get the entire tree plotted
clusterer.fit(X) # X for whatever you want to fit
spanner = get_cluster_spanner(clusterer)
leaf_labels = []
for i in range(0,len(recipes)):
    print(i,clusterer.labels_[i])
    leaf_labels.append('{} ({})'.format(i,clusterer.labels_[i]))
leaf_labels = list(range(0,len(recipes)))
newick_tree = build_Newick_tree(clusterer.children_,clusterer.n_leaves_,X,leaf_labels,spanner) # leaf_labels is a list of labels for each entry in X
tree = ete3.Tree(newick_tree)

print(tree)

label_counts = {}
for i,l in enumerate(clusterer.labels_):
    if l not in label_counts:
        label_counts[l] = 0
    label_counts[l] += 1

print(label_counts)
best_label = 0
print(label_counts)
for i,l in enumerate(sorted(label_counts.items(), key=operator.itemgetter(1),reverse=True)):
    print("-"*30)
    print("cluster {}".format(l[0]))
    for j,l2 in enumerate(clusterer.labels_):
        if l2 == l[0]:
            print(recipes[j]['ingredients'])
    if i == 10:
        break
