# Data Visualization with GGPlot2, Part 1 at a Glance
- Data visualization is Statistics and design combined.
- These are targeted at Exporation and Explanation, but keep in mind who your audiance is.
- Exploration is for Scientists and Experts; Explanation is for Laymens.




## Insights from Grammar of Graphics
- There are 7 Elements of the Grammar.
1. Data.
2. Aesthetics
3. Geometries
4. Facets
5. Statistics
6. Coordinates
7. Themes

- 1-3 are mandatory; 4-7 are optional.
- aes() can be called inside geoms!


- Colour stands for Outline.
- Fill stands for Inner Color.
- Size stands for Diameter.
- Alpha stands for Opacity (Transparency, How much you can see through it).
- Linetype is obvious.
- Labels stands for the Text on the plot.
- Shape stands for the Point Type.
- Reminder: Points have color but not fill!

- Attributes take precedent over aesthetics.
- You can use geom_text to replace points with letters and words!
- You can use position = 'jitter' to make graphs more obvious, but not damage the data.


- Scale functions alter the view of the graph.
- Those can be treated differently based on the type: factor, discrete or categorical

```
Scale:
	limits = c(x, y)
	breaks = c( break_values)
	expand = c( 2, 2) // multiplicative expansion
	labels = c('x', 'y', 'z') // category names
```

- Barplot positions can be set to Stack, Dodge or Fill.
- Descriptions are self evident.
- Geom_jitter is its own thing.



# This is where it gets awful.
- Binwidth can be used to change the display.
- ..density.. refers to internal dataframe that's used by stat.
- .. .. referes to internal frame via calculations.
- Setting stat = 'identity' will set the heights of the bars to represent values.

```
geom_errorbar(
	aes(
		ymin = avg - stdev,
		ymax = avg + stdev
	),
	width = .2
)
```
- ymin sets the lower error bar in reference to line.
- ymax sets the lower error bar in reference to line.
- width I don't remember.


- Scale_fill_brewer creates a range of colors for Graphs to use.
- `scale_fill_brewer( palette = 'x')` where x is the set of colors.
- geom_ribbon( aes( ymax = Capture, ymin = 0), alpha = .3)

```
geom_rect(
	data = recess,
	inherit.aes = FALSE,
	aes(
		xmin = begin,
		xmax = end,
		ymin = -Inf,
		ymax = Inf
	),
	fill = 'red',
	alpha = .2
)
```
- inherit.aes = FALSE will ignore aesthetics excluding itself.


- gather() takes four arguments:
  1. the original data frame (fish.species)
  2. the name of the key column (Species)
  3. the name of the value column (Capture)
  4. the name of the grouping variable, with a minus in front (-Year); They can all be specified as object names (i.e. no "").


## Research:
- brewer.par 
- colorRampPaleette


## Reading List:
- ["Grammar of Graphics" by Leland Wilkinson](https://smile.amazon.com/Grammar-Graphics-Statistics-Computing/dp/0387245448/ref=sr_1_1?ie=UTF8&qid=1484779645&sr=8-1&keywords=grammar+of+graphics)
- ["Graphs in Statistical Analysis" by Francis Anscombe](www.sjsu.edu/faculty/gerstman/StatPrimer/anscombe1973.pdf)