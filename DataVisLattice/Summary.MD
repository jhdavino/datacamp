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
# Controlling Scales and Graphical Parameters
# Customizing Plots Using Panel Functions
# Extentions and the Lattice Ecosystem

# Research
# Reference