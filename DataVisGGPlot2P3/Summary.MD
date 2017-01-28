# Data Visualization with GGPlot2, Part 3

- ```
  stat_summary(fun.data = "mean_cl_normal", // mean "Confidence Levels" Normal
    geom = "crossbar",                      // crossbar 
    width = .2,                             // width of the bars.
    col = 'red')                            // Obv.
  ```



- `scale_y_log10()` will scale the y axis.
- ```scale_x_log10(
      expression( log[10](Carat) ), // use this as the text
      limits = c(.1, 10)           // set x limits as ..
    )
  ```

- Box plots and Density plots are useful for scientific audiances.
- 5 point summary displays distribution as 25% pieces.
- Also, shows outliers as distinct features.

- defined as: outlier = 1.5 * IQR [ Interquartile Range ]
- whiskers cannot be drawn outside the fence.

- `cut_interval(x, n)` will cut with equal range.
- `cut_number( x, n)` will cut with equal number of observations.
- `cut_width( x, n)` cut with n sized groups; takes into account of range!

- Density plot is good for univariate data
- Kernal Density Estimate( KDE) 
- Many overlapping lines -> Higher Value -> Higher Density.
- How do you pick the bandwith in KDE? 
- Bandwith smooths out graph.

- Density plots are just graphs of the underlying distribution.
- geom_density cuts off outer data when using limits; this means area under curve is no longer 1.


- ```
  fun_args <- list(mean = mean(test_data$norm), // mean of data
                   sd   = sd(test_data$norm))   // st. dev. of data
  ...
  // this is basically do.call
  stat_function( fun  = dnorm,    // function to call
                 args = fun_args, // args to the function.
                 col  = "blue")   // aes mappings to pass
```
- do.call use of function header
  1. what is func.
  2. args is args.
  3. Don't really need to care about the rest.


- `geom_boxplot( varwidth = TRUE)` can be used to adjust width on observation count.
- geom_density( aes( weight = n))` using n()/nrow( [item]) as n, will change volume of curve.
- geom_violin will do this for you.
- You can also weight this as well.


- `p + geom_density_2d()` is the contour map of ggplot2
- ```
  stat_density_2d(            // Known.
    geom = "tile",            // 
    aes( fill = ..density..), // use internal
    contour = FALSE)          // contour lines; = T will break former assignments.
  ```

- can replace `geom = ` with others: like "point"



-```
  # Base layers
  p <- ggplot(faithful, aes(x = waiting, y = eruptions)) +
  scale_y_continuous(limits = c(1, 5.5), expand = c(0, 0)) +
  scale_x_continuous(limits = c(40, 100), expand = c(0, 0)) +
  coord_fixed(60 / 4.5)  // force a specific fixed ratio.
```
- `p + stat_density_2d( aes(col = ..level..), h = c(5, 0.5))` uses the internal columns of data.
- scale_fill_viridis() requires viridis package.

## Graphics of Large Data
- Problems with Large Data set:
  1. Many observations
  2. Many variables
  3. Combination

- Solutions:
  1. Change your geom : ex `geom_bin2d( bins = 100 )` or `geom_hex( bin = 100 )`
  2. Reducing over-plotting
  3. Reducing amount of information plotted.
  4. Data reduction | PCA [ Principle Component Analysis ]
  5. Facets // limited when tons of 
  6. Scatter PLOt Matrix - SPLOM
  7. ggpairs() from GGally Package
  8. ggparcoord() // This is ugly; don't use it.
  8. Animations


- You can get a pxp correlation using:
  1. chart.Correlation from Package PerformanceAnalytics
  2. ggpairs from Package GGally


- Ternary Plot - Triangle Plot
- Good Compsitional trivariate data
- Who says "Zed" for "z"?
- Use ggtern from Package ggtern
- `geom_density_tern()` simple version of ternary plot
- ```
  ...
  stat_density_tern(
    geom = "polygon",              // how should info be drawn.
      aes( fill = ..level..,       // fill by internal frame.
           alpha = ..level..)) +   // opacity by internal frame.
  guides(                          // Remove guide legend
    fill = guide_legend( show = FALSE ))
  ```


## Network Plots
- geomnet Package
- The arrangement of nodes affects interpretation.
- `aes(from_id = Name1, to_id = Name2))` will be used for Network Mapping.
- ```
  geom_net(
    aes( col = Gender ),   // select via Gender
    size = 6,              // Obv.
    linewidth = 1,         // Obv.
    label = TRUE,          // Add data labels to nodes.
    fontsize = 3,          // Obv.
    labelcolour = "black") // You can define text color: cool.
```

- Needs to be expanded, tbh.

## Diagnostic Plots
- Calling plot with linear model gets you:
  1. Residuals vs Fitted
  2. Q-Q Plot?
  3. Scale-Location Plot
  4. Residuals vs Leverage

- qqPlot from car Package.
- influencePlot from car Package.
- `autoplot( [model], ncol = 2 )` from package ggfortify
- autoplot, since it's based on ggplot, can be extended via ggplot
- ```
  autoplot(
    cmdscale( eurodist, eig = TRUE ), // Classical Multidimensional Scaling of data.
    label = TRUE,                     // add labels
    label.size = 3,                   // Obv.
    size = 0 )                        // Obv.
  ```

- kmeans( [ data ], [ k-centers] )


## Maps and animations:
  1. Choropleths
  2. Geographic Infomration System [ GIS ]



- Choropleth's Draw bunch of polygons representative of geography.
- This is built into ggplot2
- `[region] <- map_data( [region] )`
- ```
  ggplot( usa,
    aes( x = long,          // Obv.
         y = lat ,          // Obv.
         group = group)) +  // Interesting?
  geom_polygon() +          // Draw shapes.
   coord_map() +            // adjust scales
   theme_nothing()          // Remove background
  ```

- `coord_map()` this actually quite complicated.
- `state<- map_data("state")` will get United State's States.

-```
  ggplot(state,                    // State Data
    aes( x = long,                 // Obv.
         y = lat,                  // Obv.
         group = group,            // Strange whites lines if missing?
         fill = region )) +        // Color state inner region.
    geom_polygon( col = "white") + // Remember that col = outside barrier.
    coord_map() +
    theme_nothing()
  ```
- As with other graphs, you can map fill onto different shades of color.


## Cartographic maps
- `get_map( location = [ City, Country], zoom = [X])` can be used to query Google Maps.
- `ggmap( def_03, extent = "device" )` // extent asks how much of the map should be plotted
- Increasing `zoom` will get you closer.
- There are different kinds of map types
  1. "watercolor"   // Do you need source = "stamen"?
  2. "toner"        // Do you need source = "stamen"?
  3. "hybrid"       // Do you need source = "stamen"?
  4. "satellite"    // Do you need source = "google"?

- Use `geocode( [vector of Names])` to get latitudes and longitudes of cities.
- Since ggmap is a ggplot object, you can add points just like other ggplot types
- Map is not redrawn based on the points, so you can lose data.
- Create a 'boundary box' using `make_bbox( lon = [longitudes], lat = [ latitudes], f = [fuzzing])
- You can request locations using the bbox setting `location = bbox_name` in get_map
- ```
  ggmap( london_ton_13) +
  geom_label(data = xx,     // geom_label is a thing.
    aes(label = location),  // label = names
    size = 4,               // Obv.
    fontface = "bold",      // Obv.
    fill = "grey90",        // Obv.
    col = "#E41A1C" )       // Obv.
  ```

- You can combine maps from Google and adding polygons to it.
- ```
  geom_polygon( data = bundes,
    aes(x = long,               // Obv.
        y = lat,                // Obv.
        group = group),         // Obv.
    fill = NA,                  // Obv; Do this to maintain the background of the map.
    col = "red")                // Obv.
  ```


## Animations
- Good for dense temproal data
- Can be used for exploration
- Packages:
  1. animation
  2. gganimate
- Motion chart? [ Hans Rosling ] // Gapminder
- gganimate uses the `frame` variable to tell which variable to alter per image.
- gganimate uses the `interval` variable to control the time, in seconds, to switch frames.
- You will need to install package devtools, then use `devtools::install_github("dgrtwo/gganimate")` to install.
- Then, you can load package.
- gg_animate( [ggplot2_object], [nameOfGif])
- saveGIF can be used from the animation Package.
- saveGIF takes an expression, a name assigned to movie.name and interval.

-```
saveGIF({
  for (i in unique( japan$time)) {            // this could be done better with dplyr
    data<- subset( japan, japan$time == i )   // subset; use filter( ... )

    p <- ggplot(data, aes(x = AGE, y = POP, fill = SEX, width = 1)) +   // Obv.
      coord_flip() +                                                    // Obv.
      geom_bar(data = data[data$SEX == "Female",], stat = "identity") + // Obv.
      geom_bar(data = data[data$SEX == "Male",], stat = "identity") +   // Obv.
      ggtitle(i)                                                        // Obv.

    print(p)                                                            // Obv.

  }

}, movie.name = "pyramid.gif", interval = .1)                           // See Desc.
```




gg_animate()


```
# Update the static plot
p <- ggplot(Vocab, aes(x = education, y = vocabulary,
                       color = year, group = year, frame = year, cumulative = TRUE)) +
  stat_smooth(method = "lm", se = FALSE, size = 3)

# Call gg_animate on p
gg_animate(p, interval = 1.0, filename = "vocab.gif")
```





- Shapefiles:
  1. several different files
  2. .shp = shape geometry
  3. .shx = shape index
  4. .dbf = attributes for each shape

```
rgdal::readOGR()
```

```
germany <- readOGR(dsn = "shapes", layer = "DEU_adm1")

# fortify germany: bundes
bundes <- fortify(germany)

# Plot map of germany
ggplot(bundes, aes(x = long, y = lat, group = group)) +
    geom_polygon(fill = "blue", col = "white") +
    coord_map() +
    theme_nothing()
```






Grid package

2 plotting systems in R: base and Grid.

Paul Murell designer.

ggplot2 built on Grid

Create graphics


grid.rect()
grid.lines()
grid.circle()
grid.polygon()
grid.text()
	(x = .5, y = .5, width = .5, height = .5, just = "center",
	name = "myCircle")

grid.edit("myCircle", gp = gpar( fill = "pink" ))

gp = graphical parameter

Viewports are a window which we draw graphic output.
vp <- viewport( ... )
pushViewport( vp )

grid.xaxis()
grid.yaxis()


# Create data viewport: dvp
dvp <- dataViewport( xData = mtcars$wt, yData = mtcars$mpg)


```
pushViewport(plotViewport(c(5, 4, 2, 2)))
grid.rect(gp = gpar())
pushViewport(dataViewport(xData = mtcars$wt, yData = mtcars$mpg))
grid.xaxis()
grid.yaxis()

# Add text to x axis
grid.text( label = "Weight", y = unit( -3, "lines" ))

# Add text to y axis
grid.text( label = "MPG", x = unit(-3, "lines" ), rot = 90)

# Add points
grid.points( x = mtcars$wt, y = mtcars$mpg, pch = 16)
```


Having a name allows you to call grid.edit


Graphical Objects -> Grobs

grid.rect() -> rectGrob()


ggplotGrob( [object] )
can access grobs via g$grob[[ # ]]

library( gtable)
gtable_show_layout(g$grob[[8]])



```
p <- ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) + geom_point()

# Create gtab with ggplotGrob()
gtab<- ggplotGrob( p )

# Print out gtab
print( gtab )

# Extract the grobs from gtab: gtab
g<- gtab$grobs

# Draw only the legend
grid.draw( g[[ 8 ]] )
```

```
# Code from before
p <- ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) + geom_point()
gtab <- ggplotGrob(p)
g <- gtab$grobs
grid.draw(g[[8]])

# Show layout of g[[8]]
gtable_show_layout( g[[8]])



# Create text grob
my_text <- textGrob(label = "Motor Trend, 1974", gp = gpar(fontsize = 7, col = "gray25"))

# Use gtable_add_grob to modify original gtab
new_legend <- gtable_add_grob(gtab$grobs[[8]], my_text, 3, 2)

# Update in gtab
gtab$grobs[[8]] <- new_legend

# Draw gtab
grid.draw( gtab )
```


ggplot2 Objects

renders ggplot2 with ggplot_build()
convert ggplot to gtable using ggplot_gtable( object )


gridExtra package ?

plyr package

```
# Load gridExtra
library( gridExtra )

# Call grid.arrange()
grid.arrange( g1, g2, ncol = 2)
```

```
grid.arrange(g1_noleg, g2, my_legend,
             layout_matrix = matrix(c(1, 3, 2, 3), ncol = 2),
             heights = unit.c(unit(1, "npc") - legend_height, legend_height))
```

Write your own extensions in ggplot2

john tukey ( Bag Plot )

Bag Plot?

package aplpack
compute.bagplot( x = dat$group1, y = dat$group2 )


bag<- compute.bagplot( test_data )

# Display information
bag$hull.loop
bag$hull.bag

ggproto | four arguments.
1. Name
2. What inherited from.
3. Required Aesthetics
4. Action taken.


StatLoop <- ggproto("StatLoop", Stat,
                    required_aes = c("x", "y"),
                    compute_group = function(data, scales) {
                      bag <- compute.bagplot(x = data$x, y = data$y)
                      data.frame(x = bag$hull.loop[,1], y = bag$hull.loop[,2])
                    })


What is a layer function?

list(
    # StatLoop layer
    layer(
      stat = StatLoop, data = data, mapping = mapping, geom = geom, 
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, alpha = 0.35, col = NA, ...)
    ),

Case Study 2:

```
  geom_linerange(aes(ymin = min, ymax = max), col = "#EED8AE", alpha = 0.2)
```

CREATING NEW STAT LAYERS!

"StatHistorical" is the class name

```
# Create the stats object
StatHistorical <- ggproto("StatHistorical", Stat,
                    compute_group = function(data, scales, params) {
                      data <- data %>%
                        filter(year != max(year)) %>%
                        group_by(x) %>%
                        mutate(ymin = Hmisc::smean.cl.normal(y)[3],
                               ymax = Hmisc::smean.cl.normal(y)[2]) %>%
                        ungroup()
                    },
                    required_aes = c("x", "y", "year"))

# Create the layer
stat_historical <- function(mapping = NULL, data = NULL, geom = "point",
                            position = "identity", na.rm = FALSE, show.legend = NA, 
                            inherit.aes = TRUE, ...) {
  list(
    layer(
      stat = "identity", data = data, mapping = mapping, geom = geom,
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, col = "#EED8AE", alpha = 0.3, shape = 16, ...)
    ),
    layer(
      stat = StatHistorical, data = data, mapping = mapping, geom = "linerange",
      position = position, show.legend = show.legend, inherit.aes = inherit.aes,
      params = list(na.rm = na.rm, col = "#8B7E66", ...)
    )
  )
}

# Build the plot
my_data <- clean_weather("NYNEWYOR.txt")
ggplot(my_data, aes(x = x, y = y, year = year)) +
  stat_historical()
```

Need to take this all apart.


## Investigate:
- Grid Package.
- KDE?
- bw = "nrd0"
- kernel = "gaussian"
- car package
- cmdscale
- saveGIF?
- plot_quart() ?
- viridis Package
- PerformanceAnalytics Package
- gather function from Package tidyr?
- matlib Package

## Reading List:
["Exploratory Data Analysis" by John Tukey](https://www.amazon.com/Exploratory-Data-Analysis-John-Tukey/dp/0201076160)
["An R Companion to Applied Regression" by John Fox & Sanford Weisberg](https://www.amazon.com/R-Companion-Applied-Regression/dp/141297514X)