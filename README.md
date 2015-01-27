Uwezo demo
=======

7 January 2015. A rough cut `d3.js` viz for the Uwezo folks to see what can be done.

### Main idea

Dynamic bar chart, by region, of kids' performance on English, Math, Swahili for 2012. Click for further information (side, informative tooltip?). Drop-down for `countries` (TZ, KE, UG) and `years` (2009/2010, 2011, 2012). ~~(`Subject` dimension to be added.)~~ `subject` added.


### To Do
(~~completed~~, _in progress_)

1. ~~Decide on exact bar chart type.~~ 
2. ~~Prep the data for each country in `Stata`. Need: Separate dataset for each country (call it like a url).~~ 
3. ~~Begin adapting the attrition dynamic bar chart...~~
4. ~~_Design principles_: Fancy fonts (Garamond, NYorker, Apple Garamond - italic), browns/earth tones.~~
5. ~~Drop-down menus for country, subject and year (review all that stuff about embedding functions in sites).~~
6. Spinning wheel - or just keep the `Submit` button grayed out while loading.
7. What to do with Swahili? Have it only be an option for TZ/KE?
8. ~~Style the ugly drop-down boxes.~~
9. ~~Style in general.~~
10. ~~Figure out how to call different `subjects`.~~ 
11a. ~~`Exit`/`enter`. Transitions! Country transitions (horizontal).~~ (Thanks, SO!)
11b. ~~Year transitions (vertical).~~
12. ~~Don't keep replicating the same `svg`...~~
13. ~~Why is `country` breaking in and out of the function (but only for `console.log` and `title`)?~~ Don't know why exactly - something to do with assigning undeclared variables. I've now removed the `var` declaration and it works. But this makes no sense!
14. ~~Call `year`. (`switch` statement isn't working...)~~
15. Make `barWidth` a function of the number of regions. 
16. ~~Rift Valley (KE) is missing 2011. Mtwara (TZ) is missing 2012. Add them as missing (in `Stata').~~
17. Center x-axis labels.
18. ~~Axis a dynamic function of `subject`.~~
19. Tooltip: Side info panel.
20. _Tooltip: boys' + girls' scores, on `mouseover`._ 
  


### Resources

* Data: [Uwezo - Datasets](http://www.uwezo.net/publications/datasets/?y=2012)
* Resource: [Cynthia Brewer - ColorBrewer](https://github.com/mbostock/d3/tree/master/lib/colorbrewer)
* Resource: [Mike Bostock - Population pyramid](http://bl.ocks.org/mbostock/4062085)
* Resource: [Mike Bostock - Every ColorBrewer scale ever](http://bl.ocks.org/mbostock/5577023)
* Example: [VxLabs - The best color interpolator is HSL (SYAC)](http://vxlabs.com/2013/10/04/d3-interpolators-vs-colorbrewer-single-hue-sequential-scales/)
* Example: [VxLabs - Color interpolating](https://gist.github.com/cpbotha/6831663)
* Q&A: [StackOverflow - Gradient onto bar chart](https://stackoverflow.com/questions/22138897/d3-js-getting-gradients-on-a-bar-chart)
* Q&A: [StackOverflow - Interpolating your own color scale](https://stackoverflow.com/questions/12217121/continuous-color-scale-from-discrete-domain-of-strings)
* Design: [DaFont.com - Apple Garamond](http://www.dafont.com/apple-garamond.font)
* Design: [DaFont.com - Frontenac](http://www.dafont.com/frontenac.font)
* Design: [DaFont.com - Night Still Comes](http://www.dafont.com/night-still-comes.font)



