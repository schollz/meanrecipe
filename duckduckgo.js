#!/usr/bin/env node
'use strict';

const argv = require('yargs').argv
const puppeteer = require('puppeteer');

(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q='+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();



(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=homemade+'+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();



(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=best+'+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();



(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=delicious+'+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();


(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=recipe+for+'+argv.food.replace(' ','+')+'', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();




(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=favorite+'+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();




(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=diy+'+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();




(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=delicious+'+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();




(async() => {

const browser = await puppeteer.launch();
const page = await browser.newPage();
await page.goto('https://duckduckgo.com/?q=yummy+'+argv.food.replace(' ','+')+'+recipe', {waitUntil: 'networkidle2'});
await page.setViewport({
    width: 1200,
    height: 800
});


// Wait for the results to show up
await page.waitForSelector('h2 a');

await autoScroll(page);
await page.screenshot({
    path: 'jd.png',
    fullPage: true
});

// Extract the results from the page
const links = await page.evaluate(() => {
  const anchors = Array.from(document.querySelectorAll('h2 a.result__a'));
  return anchors.map(anchor => anchor.href);
});
console.log(links.join('\n'));
await browser.close();

})();


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