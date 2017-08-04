# Data Visualization in R
## Ron Pearson

# A Quick Introduction to Base R
- Our ability to interpret patterns is a key strength.
- Two types of data Visualizations
	1. Exploratory.
	2. Explanatory.
- Four types of graphics systems:
	1. Base.
	2. Grid.
	3. Lattice.
	4. GGplot2
- `sunflowerplot()`
- Pie charts still suck.
- There are high and low level functions for plots.


# Different Plot Types
- Values should be approximately Gaussian.
- There are three visualizations to show Normality:
	1. Histogram.
	2. Density Plot
	3. Normal QQ Plot,
- `truehist()` is a thing; comparable to `hist()`
- Scatterplots show how two variables vary with one another.
- Sunflowerplots do the same, but explain overlapping points as well.
- Boxplots are great for explaining categorical vs numerical distributions
- Mosaicplots can be viewed as a scatterplot between categorical values.
- I don't like Mosaic plots, really.
- `r boxplot(y ~ x, data = data, varwidth = TRUE, log = "y", las = 1)`
- Bagplots are really interesting.
- `aplpack::bagplot()` to use it.
- `corrplot::corrplot() shows the correlation matrix.
- `corrplot(mtCor, method = "ellipse")`
- `corrplot()` takes a correlation matrix as well as a method of display.
- `rpart::rpart()` to generate decision trees.

# Adding Details to Plots
- Some attributes can only be set globally.
- You do this using `par()`.
- **pch** controls the point character.
- If set globally, then consistent across all plots.
- **type** controls the type of plot; only local to a single graph.
- You can collect all the default parameters using an empty call to `par()`.
- Types of plots:
	1. p for points.
	2. l for lines.
	3. o for points ^ lines.
	4. s for steps.
	5. n for blank plot
- Plotting outliers with a different color accents their existence.
- Adding an x,y line to act as a reference line assists in making conclusions clear.
- Use `lines()` to add another line to the plot.
- You can control the view of the line using:
	1. `lty` for line type
	2. `lwd` for line width.
- You can also change the character using `pch` [Point Character]
- You can create a straight line on the graph using `abline`.
- It takes the variables of a line: a for y-intercept, b for slope.
- You can also pass the model intself to the `abline` function as a parameter.
- R will attempt to fill in text for you, but all this can be overridden.
- There is a generic text function for adding this text anywhere on the plot.
- Use:
```r
text( x,       # the x position.
	  y,       # the y position.
	  labels,  # the text itself.
	  adj)     # the adjustment to position.
```
- The text will be centered at (x,y) by default.
- `adj` is a deciaml number [0,1] such that .5 is centered - and the default.
- You can make the `adj` value ([,0] and [1, .)]) as well.
- Other variables are:
	1. `srt` which rotates the text
	2. `font` for the style.
	3. `cex` for the size
	4. `col` for color.
- `points` is like `lines()` but for points.
- You can add a legend using `legend()` with parameters:
	1. x s.t. it's either a coordinate or generic text; "topleft"
- You can generage custom axis for the plot.
- First, you'll need to pass `axes = FALSE` inside of `plot()`.
- `axis` uses `side` parameter to select a side to draw.
	1. x axis.
	2. y axis.
	3. top of graph.
	4. right of graph.
- `axis` uses `at` to specify where the axis tick marks are.
- `axis` uses `labels` to select the text for the ticks.
- `axis` uses `las` to rotate the tick marks drawn.
- If the best fit is polynomial instead of linear, then use `supsmu()`

# How Much is Too Much
- Too many plots can become too small to make meaningful conclusions.
- You can use `matplot()` to plot multiple sets of points on the same axis for base plot.
- You can generate wordclouds using the `wordcloud::wordcloud()` function.
- pairs is used under the hood when requesting plot do a multivariable comparison plot.
- The `par` parameter `pty` can be called with *s* to make a dimensionally square plot.
- You can use `layout()` and a matrix of numbers to select where to play graphs.
- So, *(1, 0, 2)* would place plot 1 on the left, then a blank space, then the second plot.
- To see a basic blueprint, use `layout.show( n = **<n>**)`.

# Advanced Plot Customization
- Most plots do not return values
- There are functions that return values invisibly.
- Create png files using `png( **<filename>**)
- There are limitations to color:
	1. Color-blindness.
	2. Black and White reproductions lose those details.
	3. Can be overused.
		i. Ideally ~6
		ii. Hopefully ~12
		iii. Never >20
	4. Best colors are:
		* Red.
		* Green.
		* Yellow.
		* Blue.
		* Black.
		* White.
		* etc, but ignore.
- Learning grid is a great idea since GGPlot uses this underneath.
- There is a middle function that acts as a middle ground between Grid and Plot using `tabplot::tableplot()`.
- Ignore `lattice::xyplot()`
- Take ggplot course

# Research
- What is a sunflowerplot?
- What is a QQ plot?

# Reference
["Beautiful Visualization: Looking at Data through the Eyes of Experts (Theory in Practice)"](https://www.amazon.com/Beautiful-Visualization-Looking-through-Practice/dp/1449379869)