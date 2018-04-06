import json
import re
import operator
from collections import defaultdict

from tqdm import tqdm 
import numpy

def get_ingredient_list():
    regex = re.compile('[^a-zA-Z\d\s:]')
    possible_ingredients_map = {}
    with open('../top_5k.txt', 'r') as f:
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


def recursive_defaultdict():
    return defaultdict(recursive_defaultdict)


def fixName(name):
    newName = ""
    name = name.lower()
    name = name.replace('raw', '')
    names = name.split(',')
    for name in names[::-1]:
        if "with" not in name:
            newName += name + " "
    for name in names[::-1]:
        if "with" in name:
            newName += name + " "
    return ' '.join(newName.split())

foodDes = open('FOOD_DES.txt', 'r', encoding="ISO-8859-1").read().split("\n")
sr = recursive_defaultdict()
for line in foodDes:
    try:
        data = line.split('~^~')
        sr[data[0][1:]]['long_desc'] = fixName(data[2])
        sr[data[0][1:]]['shrt_desc'] = fixName(data[3])
    except:
        pass

foodWeight = open('WEIGHT.txt', 'r', encoding="ISO-8859-1").read().split("\n")
for line in foodWeight:
    data = line.split('^')
    dataId = data[0][1:-1]
    weight = recursive_defaultdict()
    try:
        weight["qty"] = float(data[2])
    except:
        continue
    weight["unit"] = data[3][1:-1]
    weight["g"] = float(data[4])
    if 'weight' not in sr[dataId]:
        sr[dataId]['weight'] = []
    sr[dataId]['weight'].append(weight)



ingredient_list =  get_ingredient_list()
for _,dataID in tqdm(enumerate(sr)):
    for ingredient in ingredient_list:
        if ingredient in " " + sr[dataID]['long_desc'] + " ":
            sr[dataID]['parsed'] = ingredient.strip()
            break


ingredient_densities = {}

for _, dataID in tqdm(enumerate(sr)):
    if 'parsed' not in sr[dataID]:
        continue
    for w in sr[dataID]['weight']:
        if 'cup' in w['unit']:
            ing = sr[dataID]['parsed']
            if ing not in ingredient_densities:
                ingredient_densities[ing] = []
            ingredient_densities[ing].append(1.0/w['qty']*w['g'])

for ing in ingredient_densities:
    ingredient_densities[ing] = round(numpy.mean(ingredient_densities[ing]),1)
with open('sr28.json', 'w') as f:
    f.write(json.dumps(sr, indent=2))

with open('../ingredient_densities.json','w') as f:
    f.write(json.dumps(ingredient_densities, indent=2))