#!/usr/bin/env node
'use strict';

const argv = require('yargs').argv
const puppeteer = require('puppeteer');

function getResults(beforePhrase,afterPhrase) {    
    (async() => {
    const food = argv.food.replace(' ','+');
    beforePhrase = beforePhrase.replace(' ','+')
    afterPhrase = afterPhrase.replace(' ','+')
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    const url = 'https://duckduckgo.com/?q='+beforePhrase+'+'+food+'+'+afterPhrase
    console.error(url)
    await page.goto(url, {waitUntil: 'networkidle2'});
    await page.setViewport({
        width: 1200,
        height: 800
    });


    // Wait for the results to show up
    await page.waitForSelector('h2 a');

    await autoScroll(page);
    // await page.screenshot({
    //     path: 'jd.png',
    //     fullPage: true
    // });

    // Extract the results from the page
    const links = await page.evaluate(() => {
      const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
      return anchors.map(anchor => anchor.href);
    });
    console.log(links.join('\n'));
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

getResults("best","recipe")
getResults("homemade","recipe")
getResults("recipes for","")
getResults("diy","recipe")
getResults("favorite","recipe")
getResults("delicious","recipe")
getResults("easy","recipe")
getResults("simple","recipe")

