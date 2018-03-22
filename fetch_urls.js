#!/usr/bin/env node
'use strict';

process.setMaxListeners(Infinity); // <== Important line

const argv = require('yargs').argv
const puppeteer = require('puppeteer');

function duckduckgo(phrase){
    (async() => {
    const browser = await puppeteer.launch({args:['--no-sandbox']});
    const page = await browser.newPage();
    const url = 'https://duckduckgo.com/?q='+phrase;    
    console.error(url)
    await page.goto(url, {waitUntil: 'networkidle2'});
    await page.setViewport({
        width: 1200,
        height: 800
    });


    // Wait for the results to show up
    await page.waitForSelector('h2 a');

    await autoScroll(page); // duckduckgo needs to scroll to bottom

    // Extract the results from the page
    const links = await page.evaluate(() => {
      const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
      return anchors.map(anchor => anchor.href);
    });
    console.log(links.join('\n'));
    await browser.close();

    })();
}


function google(phrase){
    (async() => {
    const browser = await puppeteer.launch({
        args:['--no-sandbox'],
    });
    const page = await browser.newPage();

    const url = 'https://www.google.com/search?num=100&hl=en&q='+phrase;    
    console.error(url)
    await page.goto(url, {waitUntil: 'networkidle2'});
    await page.setViewport({
        width: 1200,
        height: 800
    });
    // Wait for the results to show up
    await page.waitForSelector('h3 a');
    // Extract the results from the page
    const links = await page.evaluate(() => {
      const anchors = Array.from(document.querySelectorAll('h3 a'));
      return anchors.map(anchor => anchor.href);
    });
    console.log(links.join('\n'));
    await browser.close();

    })();
}


function yahoo(phrase){
    (async() => {
    const browser = await puppeteer.launch({
        args:['--no-sandbox'],
    });
    const page = await browser.newPage();

    const url = 'https://search.yahoo.com/search?n=100&p='+phrase;    
    console.error(url)
    await page.goto(url, {waitUntil: 'networkidle2'});
    await page.setViewport({
        width: 1200,
        height: 800
    });
    // Wait for the results to show up
    await page.waitForSelector('h3 a');
    // Extract the results from the page
    const links = await page.evaluate(() => {
      const anchors = Array.from(document.querySelectorAll('h3 a'));
      return anchors.map(anchor => anchor.href);
    });
    console.log(links.join('\n'));
    await browser.close();

    })();
}


function bing(phrase){
    (async() => {
    const browser = await puppeteer.launch({
        args:['--no-sandbox'],
    });
    const page = await browser.newPage();


    for (var j=0; j<100;j += 10) {
        const url = 'https://www.bing.com/search?first='+j+'&q='+phrase;    
        console.error(url)
        await page.goto(url, {waitUntil: 'networkidle2'});
        await page.setViewport({
            width: 1200,
            height: 800
        });
        // Wait for the results to show up
        await page.waitForSelector('h2 a');
        // Extract the results from the page
        const links = await page.evaluate(() => {
          const anchors = Array.from(document.querySelectorAll('h2 a'));
          return anchors.map(anchor => anchor.href);
        });
        console.log(links.join('\n'));        
    }

    await browser.close();

    })();
}

function autoScroll(page){
    return page.evaluate(() => {
        return new Promise((resolve, reject) => {
            var totalHeight = 0;
            var distance = 100;
            var timer = setInterval(() => {
                var scrollHeight = document.body.scrollHeight;
                window.scrollBy(0, distance);
                totalHeight += distance;

                if(totalHeight >= scrollHeight){
                    clearInterval(timer);
                    resolve();
                }
            }, 100);
        })
    });
}

const phrase_to_search = argv.phrase.replace(/ /g,'+')
if (argv.search == "google") {
    google(phrase_to_search);
} else if (argv.search == 'bing') {
    bing(phrase_to_search);
} else if (argv.search == 'yahoo') {
    yahoo(phrase_to_search);
} else {
    duckduckgo(phrase_to_search);
}

// getResults("best","recipe")
// getResults("homemade","recipe")
// getResults("recipes for","")
// getResults("diy","recipe")
// getResults("favorite","recipe")
// getResults("delicious","recipe")
// getResults("easy","recipe")
// getResults("simple","recipe")
// getResults("recipe for","from scratch")
// getResults("vegetarian","recipe")
// getResults("vegan","recipe")
// getResults("gluten free","recipe")

