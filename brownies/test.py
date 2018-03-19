import re
import sys
import operator
import json
from fractions import Fraction


def hasNumbers(inputString):
	return any(char.isdigit() for char in inputString)


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

regex = re.compile('[^a-z A-Z]')
ingredient_words = set(regex.sub('',ingredient_corpus.lower()).split())
# print(ingredient_words)

fname = sys.argv[1]
# print(fname)

import subprocess

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
		if word_intersection > 0:
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
print(ingredient_lines)


# GLOBALS
conversion_to_cup = {
	'tablespoon': 1/16,
	'teaspoon': 1/48, 
	'cup': 1,
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

def process_ingredient_lines(ingredient_lines):
	processed_ingredients = []
	for ingredient_line in ingredient_lines:
		processed_ingredients.append({'line':ingredient_line})

	# determine the ingredient	
	for i,_ in enumerate(processed_ingredients):
		ingredient_line = processed_ingredients[i]['line']
		sentence = ' ' +  regex.sub('',ingredient_line.lower()).strip() + ' ' 
		for ing in ingredient_list:
			if ing in sentence:
				processed_ingredients[i]['ingredient'] = ing.strip()
				break

	# determine quantity 
	for i,_ in enumerate(processed_ingredients):
		ingredient_line = processed_ingredients[i]['line']
		started = False
		value = 0 
		for word in ingredient_line.split():
			hasNum = hasNumbers(word)
			if started and not hasNum:
				break
			if hasNum:
				started = True
				print(word)
				try:
					value += float(sum(Fraction(s) for s in word.split()))
				except:
					pass
		processed_ingredients[i]['qty'] = value 

	# convert to cups
	for i,_ in enumerate(processed_ingredients):
		ingredient_line = processed_ingredients[i]['line']
		for conv in conversion_to_cup:
			if conv in ingredient_line:
				processed_ingredients[i]['unit'] = 'cup'
				processed_ingredients[i]['qty'] = processed_ingredients[i]['qty']*conversion_to_cup[conv]

	print(json.dumps(processed_ingredients,indent=2))

process_ingredient_lines(ingredient_lines)