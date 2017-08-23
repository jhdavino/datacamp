# Data Visualization in R with Lattice
## Deepayan Sarkar

# Basic Plotting with Lattice
- Plotting is useful for:
	1. Exploratory Data Analysis.
	2. Presenting or reporting data.
- There are three primary Graphing packages.
	1. Base R.
	2. Lattice.
	3. GGPlot2
- To create a histogram, use `histogram( ~feature, data = <data> )`.
- To create a scatterplot, use `xyplot(  <yvar> ~ <xvar>, data = <data> )`.
- **Lattice** includes lots of optional arguments.
- Optional Arguments:
	1. `main = "salkdfjk"` will label the title of the graph.
	2. `xlab = "sldkfjaklj" will label the x-axis of the graph.
	3. `ylab = "jdsalkfj" will label the y-axis of the graph.
	4. `nint = <n>` will control the bins in a Histogram plot.
	5. `grid = TRUE` will include a background grid.
	6. `abline = c(<intercept>, <slope>)` will draw a straight line on the graph.
	7. `type = <percent, count, density>` for controlling y-axis display.
- You can create a denstiy plot using `densityplot( ~<feature>, data=<data>, plot.points = <style>)`
- To create a box and whisker plot, use `bwplot( <feature_1> ~ <feature_2>, data = <data> )`.
- `reorder( <feature_1>, <feature_2>, median, na.rm = TRUE )` will reorder the data on a computational function.
- The R boxplot is set to only extend out to 1.5 times the median and mark other values as outliers.
- You can change this behavior by using `boxplot.stats( coef = 0)` and have it extend to all values; why you would do that is beyond me.

# Conditioning and the Formula Interface
- Graphs need to make comparisons else you gain nothing from the data.
- Small Multiples, or Faceting, is when you compare different subgroups of data.
- You can use the `|` to facet by a variable in the formula.
- You can use the `+` to plot two sets of data.
- You can use `layout = c(<ncol>, <nrows>, <npages>)` to manipulate the panel output format.
- Sumamrizing data is useful for reporting.
- The parameter `groups` treats the feature as a factor and differentiated within the same panel.
- Lattice does not generate a legend by default, but one can be added using `auto.key = TRUE`.
- You can also exert finer control over `auto.key`:
	1. It accepts a list of parameters.
	2. `space` controls where the legend is drawn: [left, bottom, right, top].
	3. `columns` controls how many levels to divide them.
	4. `title` controls the name of the legend.
	5. `text` controls the names of the levels.
- You can generate a separator between panels using the `between` parameter.
- This takes a list with an index of where the divider will be.
- Ex: `between = list( y = c(0, 0, 0, 1, 0, 0))`.
- 


# Controlling Scales and Graphical Parameters
# Customizing Plots Using Panel Functions
# Extentions and the Lattice Ecosystem

# Research
# Reference