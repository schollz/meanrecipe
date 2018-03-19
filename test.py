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
    lines = out.decode('utf-8').split("\n")
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
    return ({'lines':processed_ingredients,'ingredients':list(set(all_ingredients))})

# filenames =  os.listdir("brownies")
# recipes = []
# for fname in tqdm(filenames):
#     ingredient_lines = get_ingredient_lines(os.path.join('brownies',fname))
#     j= process_ingredient_lines(ingredient_lines)
#     # print(json.dumps(j,indent=2))
#     if len(j['lines']) > 3:
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
