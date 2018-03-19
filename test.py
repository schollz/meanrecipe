# coding=utf-8
import re
import sys
import operator
import json
from fractions import Fraction
import subprocess


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
    with open('../top_5k.txt','r') as f:
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

    return ({'lines':processed_ingredients,'ingredients':list(set(all_ingredients))})

ingredient_lines = get_ingredient_lines(sys.argv[1])
j= process_ingredient_lines(ingredient_lines)
print(json.dumps(j,indent=2))
