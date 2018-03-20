import os
import sys
import hashlib
from multiprocessing import Pool
import time
import gzip
import subprocess
import stat

import click
from tqdm import *
import pypandoc
import requests

datafolder = 'recipes'

def process_url(url):
    if 'http' not in url:
        return
    fname = hashlib.md5(url.encode('utf-8')).hexdigest()
    fpath = os.path.join(datafolder,fname+".txt")
    if os.path.isfile(fpath):
        return
    try:
        r = requests.get(url, timeout=3)
        text = pypandoc.convert_text(r.text,'plain',format='html')
    except:
        return
    with gzip.open(fpath,'wb') as f:
        f.write(url.encode('utf-8'))
        f.write(b'\n')
        f.write(text.encode('utf-8'))

@click.command()
@click.option("--recipe",prompt="Which recipe",help="name of basic recipe")
def start(recipe):
    global datafolder
    datafolder = recipe
    if not os.path.isdir(datafolder):
        os.mkdir(datafolder)
        try:
            os.remove('urls')
        except:
            pass

    # get urls
    if not os.path.isfile("urls"):
        with open("run.sh","w") as f:
            f.write("""#!/bin/bash
    node fetch_urls.js --food {} | grep -v duckduck | sort | uniq > urls 
    """.format(recipe))
        st = os.stat('run.sh')
        os.chmod('run.sh', st.st_mode | stat.S_IEXEC)
        print("getting urls...")
        subprocess.run(['./run.sh'], stdout=subprocess.PIPE, shell=False)
        os.remove("run.sh")

    # download urls
    urls = open('urls','r').read().split('\n')
    print("downloading {} recipes...".format(len(urls)))
    with Pool(processes=30) as p:
        with tqdm(total=len(urls)) as pbar:
            for i, _ in tqdm(enumerate(p.imap_unordered(process_url, urls))):
                pbar.update()

    # do analysis
    from analyze import get_clusters
    get_clusters(recipe)


if __name__ == '__main__':
    start()    