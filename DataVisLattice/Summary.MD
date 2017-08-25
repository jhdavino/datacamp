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
- Each panel is labeled with what is called a **strip**.
- You can edit those by passing `strip = strip.custom( factor.levels = c('Label1', 'Label2'))`
- Lattice builds an object of values instead of immediately being drawn after each call.
- You can update a 'trellis' object using the `update()` function.

# Controlling Scales and Graphical Parameters
- You can control whether panel axis are scaled separately or not using the **scales** argument.
- Ex: `scales = list(x = list(relation = "free"))`.
- There are three common values: 
	1. "free" for independant axis limits.
	2. "same" for uniform axis limits.
	3. "sliced" for holding the ranges as constant.
- *scales* can also allow you to control the number of ticks on the graph.
- `alternating` allows you to tell Lattice which sides get the tick marks:
	1. 1 for left/bottom.
	2. 2 for right/top
	3. 3 for both sides.
- `rot` to rotate the axis.
- You can use a log transform to assist with visability.
- Lattice has themes like ggplot2.
- You can get them from package `LatticeExtra`.
- You can mimic the ggplot theme using `ggplot2like()`.
- You can save the theme from Lattice using `trellis.par.get()`
- You can set the the theme using `trellis.par.set()`.
- This can also be done inside a Lattice function by passing the parameter `par.settings`.
- You can set borders to be invisible via "transparent".
- You can also control group character points by passing a vector via the parameter `pch`.
- You can make sure all panels appear the same by passing values to `par.settings = simpleTheme(...)`.
- `RColorBrewer` is a package to create more colors in a graph.


# Customizing Plots Using Panel Functions
- You can make your own graphs in Lattice two.
- There are two ways to approach this:
	1. Declarative
	2. Procedural
- You use a `panel.*` function to create the base model to use for graphing.
- All common base graphic functions have Lattice analogs.
- When there are a lot of points, Lattice includes the `panel.smoothScatter()` function.
- You can adjust the y value limits by passing parameter `ylim` inside of a `panel.*` function.
- When a high level function receives parameters not associated with the plot, it passes them to the panel.
- The `type` parameters has a few useful arguments:
	1. 'p' for points
	2. 'l' for lines.
	3. 'r' for linear regression.
	4. 'smooth' for LOESS smooth.
	5. 'a' for average y values.

# Extentions and the Lattice Ecosystem
- The first argument to Lattice need not be a formula.
- Lattice can accept matrices and dataframes directly in the first argument.
- You can suppress the strips on the top using `strip = FALSE`.
- You can enable strips in another location using `strip.left = TRUE`.
- You can override the panels using `superpose = TRUE`.
- `latticeExtra` supports `mapplot()` as long as you use the `maps` package.
```r
county.map <- map("county", plot = FALSE, fill = TRUE, 
                  # Specify projection
                  projection = "sinusoidal")
```
- `latticeExtra::seqplots()` will allow you to plot confidence intervals.
- Hexbin plots are cool.


# Research
- `density()`
- `directlabels()`


# Reference
- twemoji