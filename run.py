import os
import sys
import hashlib
import multiprocessing
import time
import gzip
import subprocess
import stat
import glob
import random
import json

import click
from tqdm import *
import pypandoc
import requests

datafolder = 'recipes'

s = requests.session()

def process_url(datas):
    global s
    url = datas[0]
    savedata = datas[1]
    if 'http' not in url:
        return
    fname = hashlib.md5(url.encode('utf-8')).hexdigest()
    fpath = os.path.join(savedata, fname + ".gz")
    if os.path.isfile(fpath):
        return
    try:
        r = s.get(url, timeout=1)
        text = pypandoc.convert_text(r.text, 'plain', format='html')
    except:
        return
    with gzip.open(fpath, 'wb') as f:
        f.write(url.encode('utf-8'))
        f.write(b'\n')
        f.write(text.encode('utf-8'))

def get_urls(phrase):
    if len(phrase[0]) < 3:
        return []
    try:
        output = subprocess.check_output(['node','fetch_urls.js','--phrase',phrase[0],'--search',phrase[1]], timeout=30)
        return output.decode('utf-8').split('\n')
    except Exception as e:
        print(e)
        return []

def download_urls(urls,recipe,datafolder):
    fs = glob.glob(datafolder + "/*.gz")
    print("have downloaded {} recipes".format(len(fs)))
    if len(fs) / len(urls) > 0.75:
        return
    try:
        os.remove(os.path.join(datafolder,'recipes.json'))
    except:
        pass
    print("downloading {} {} recipes...".format(len(urls), recipe))
    datas = []
    for url in urls:
        datas.append((url,datafolder))
    with multiprocessing.Pool(processes=multiprocessing.cpu_count()) as p:
        with tqdm(total=len(urls)) as pbar:
            for i, _ in tqdm(
                    enumerate(p.imap_unordered(process_url, datas))):
                pbar.update()

def get_unique_urls(recipe,datafolder):
    fname = os.path.join(datafolder,'urls.json')
    if os.path.isfile(fname):
        urls = json.load(open(fname,'r'))
        return urls
    phrases = []
    domains = ['bing','duckduckgo','google','yahoo']
    for domain in domains:
        phrases.append(("best {} recipe".format(recipe),domain))
        phrases.append(("homemade {} recipe".format(recipe),domain))
        phrases.append(("recipes for {}".format(recipe),domain))
        phrases.append(("diy {} recipe".format(recipe),domain))
        phrases.append(("favorite {} recipe".format(recipe),domain))
        phrases.append(("homemade {} recipe".format(recipe),domain))
        phrases.append(("delicious {} recipe".format(recipe),domain))
        phrases.append(("simple {} recipe".format(recipe),domain))
        phrases.append(("recipe for {} from scratch".format(recipe),domain))
        phrases.append(("simple {} recipe".format(recipe),domain))
        phrases.append(("vegetarian {} recipe".format(recipe),domain))
        phrases.append(("vegan {} recipe".format(recipe),domain))
        phrases.append(("gluten free {} recipe".format(recipe),domain))
    random.shuffle(phrases)
    temp_urls = []
    with multiprocessing.Pool(processes=multiprocessing.cpu_count()) as p:
        for i, data in enumerate(p.imap_unordered(get_urls, phrases)):
            print('got {} urls'.format(len(data)))
            temp_urls += data
    temp_urls = list(set(temp_urls))
    urls = []
    for url in temp_urls:
        if len(url) < 3:
            continue
        if 'http' not in url:
            continuez
        hasDomain = False
        for domain in domains:
            if domain in url:
                hasDomain = True 
                break
        if hasDomain:
            continue
        urls.append(url)
    print('found {} total unique urls'.format(len(urls)))
    with open(fname, 'w') as f:
        f.write(json.dumps(urls))
    return urls

@click.command()
@click.option("--recipe", prompt="Which recipe", help="name of basic recipe")
@click.option("--clusters", default=20, help="number of clusters")
@click.option("--url", help="test against a single url")
def start(recipe, url, clusters):
    global datafolder
    datafolder = recipe.replace(' ', '_')
    if not os.path.isdir(datafolder):
        os.mkdir(datafolder)

    # get urls
    urls = get_unique_urls(recipe,datafolder)

    # check how many are downloaded
    download_urls(urls,recipe,datafolder)

    # do analysis
    from analyze import get_clusters
    get_clusters(recipe, datafolder, num_clusters=clusters)


if __name__ == '__main__':
    start()