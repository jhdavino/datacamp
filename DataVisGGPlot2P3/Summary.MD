# Data Visualization with GGPlot2, Part 3

```
stat_summary(fun.data = "mean_cl_normal", // mean "Confidence Levels" Normal
  geom = "crossbar",                      // crossbar 
  width = .2,                             // width of the bars.
  col = 'red')                            // Obv.
```



- `scale_y_log10()` will scale the y axis.
```
scale_x_log10(
  expression( log[10](Carat) ),  // use this as the text
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


```
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
```
stat_density_2d(            // Known.
  geom = "tile",            // 
  aes( fill = ..density..), // use internal
  contour = FALSE)          // contour lines; = T will break former assignments.
```

- can replace `geom = ` with others: like "point"


```
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
```
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
```
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
```
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
```
ggplot( usa,
  aes( x = long,          // Obv.
       y = lat ,          // Obv.
       group = group)) +  // Interesting?
  geom_polygon() +          // Draw shapes.
  coord_map() +            // Adjust scales
  theme_nothing()          // Remove background
```

- `coord_map()` this is actually quite complicated.
- `state<- map_data("state")` will get United State's States.

```
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
```
ggmap( london_ton_13) +
  geom_label(data = xx,     // geom_label is a thing.
    aes(label = location),  // label = names
    size = 4,               // Obv.
    fontface = "bold",      // Obv.
    fill = "grey90",        // Obv.
    col = "#E41A1C" )       // Obv.
```

- You can combine maps from Google and adding polygons to it.
```
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
- `gg_animate( [ggplot2_object], [nameOfGif])`
- saveGIF can be used from the animation Package.
- saveGIF takes an expression, a name assigned to movie.name and interval.

```
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

- Use filename in gg_animate to specify saved file name.


## Grid package
- Two plotting systems in R: base and Grid.
- Grid is module; base is static.
- Paul Murell designed Grid.
- Grid is low level builder for plots; does not make them.
- ggplot2 built on Grid Graphics
- Two components to Grid:
  1. Create Layouts
  2. Layer and Position with viewports
- Grid low level functions:
  - grid.rect()
  - grid.lines()
  - grid.circle()
  - grid.polygon()
  - grid.text()
- Arguments:
```
  (x = .5,                    // Obv.
   y = .5,                    // Obv.
   width = .5,                // Obv.
   height = .5,               // Obv.
   just = "center",           // Obv.
	 name = "myCircle",         // internal name to reference
   gp = gpar( fill = 'pink')) // gpar means 'Graphical Part'
```
- grid.edit("myCircle", gp = gpar( fill = "pink" )) // allows one to change elements of named objects

- Viewports are a window which we draw graphic output.
- Default viewport is called the "Null Viewport"

- `vp <- viewport( ... )` to create viewport // same args as gpar, etc.
- Not active by default.
- To show viewport use `pushViewport( vp )`.
- You can also name viewports.
- Using plotViewport allows one to define margins.
- Define margins via  `margins = [vector_of_4_ints]`

- DataViewport pushes data onto the viewport
- You can manage the axis of the plot using:
  1. grid.xaxis()
  2. grid.yaxis()

- You can use grid.text to add labels:
  1. `grid.text( label = [x_label_name], y = unit( -3, "lines"))`
  2. `grid.text( label = [y_label_name], x = unit(-3, "lines" ), rot = 90)`


- Add points via `grid.points( x = mtcars$wt, y = mtcars$mpg, pch = 16)`


## Internals of ggplot2
- Graphical Objects -> Grobs
- Grids map to grobs as such: grid.rect() -> rectGrob()
- All ggplot objects are a collection of grobs.
- Access to grobs using Grid package
- Convert to grob Table using `ggplotGrob( [object] )`
- Access elements of table using `g$grob[[ # ]]`
  1. Why not use the name column with %in%, which or grep?
- Draw elements onto Null viewport using `grid.draw( g[[ # ]] )`
- Use `gtable_show_layout( ... )` from Package gtable to see str of table.

- Objects are mini arrays/matrices of drawn objects.
```
my_text <- textGrob( label = "My Added Text",   // The text to add.
                     gp = gpar( fontsize = 4,  // text attributes
                                col = "blue")) // "
```

- Use`var<- gtable_add_grob(object$grobs[[ # ]], my_text, [row], [column])` to create new grob element
- You can replace the old grob object in the grob table by assigning new value to old object.



## ggplot2 Objects
- When you call ggplot, you get an object even if it's empty.
- Object contains 9 elements:
  1. data
  2. layers
  3. scales
  4. mapping
  5. theme
  6. coordinates
  7. facet
  8.  plot_env
  9. labels

- Plot is rendered using `ggplot_build( [object] )`
- The returned object contains:
  1. data  // all layers of data
  2. panel // axis info
  3. plot  // the actual image returned
- Convert ggplot -> gtable using `ggplot_gtable( [object] )`
- Change the clipping of axis using `gtableObject$layout$clip <- "off"`




## gridExtra
- Using plyr package. // purrr package is better.
- Load gridExtra to gain access to `grid.arrange()`.
- To combine plots, use `grid.arrange( [plot1], [plot2], ncol = #)` // ncol is optional
- Use `do.call( grid.arrange, [list_of_plot_objects] )` to plot all plots.
- Use `grid.arrange` when you are not able to make manual adjustments.
```
  grid.arrange(
    g1_noleg,          // plot1
    g2,                // plot2
    my_legend,         // extracted legend_grob
    layout_matrix =    // creates matrix with form [ 1, 2 ]
      matrix(c(1, 3, 2, 3),ncol = 2),    //        [ 3, 3 ]
    heights = unit.c( unit(1, "npc") - legend_height, // what is a unit.c()?
    legend_height))
```

## Your Own Extensions

- John Tukey wrote created the concept of the Bag Plot.
- Create bagplot using `bagplot([ data ])` using package aplpack
- Bagplot has four peieces:
  1. The Hull - center of the plot
  2. The Bag - which is similiar to the IQR.
  3. The Loop - which contains all points inside the 'fence'
  4. Points outside the bag are drawn as single points.

-Use `compute.bagplot( x = [x], y = [y] )` from package aplpack to create the data.
- ggproto takes 4 arguments:
  1. Name
  2. What inherited from.
  3. Required Aesthetics
  4. Action taken.

```
StatLoop <-
  ggproto("StatLoop",            // name of layer.
    Stat,                        // class inherited from.
    required_aes = c("x", "y"),  // Obv.
    compute_group = function(data, scales){                  // actual calculations.
    bag <- compute.bagplot(x = data$x, y = data$y)
    data.frame(x = bag$hull.loop[,1], y = bag$hull.loop[,2])
  })
```


```
  stat_bag <-
    function(mapping = NULL,                   // what is mapping?
    data = NULL,                               // Obv.
    geom = "polygon",                          // Which internal geom to use.
    position = "identity",                     // Obv.
    na.rm = FALSE,                             // Obv.
    show.legend = NA,                          // Obv.
    inherit.aes = TRUE, loop = FALSE, ...) {   // What is loop for?
      list(
        # StatLoop layer
        layer(
          stat = StatLoop,                     // use defined ggproto
          data = data,                         // use passeed data
          mapping = mapping,                   // mapping?
          geom = geom,                         // Obv.
          position = position,                 // Obv.
          show.legend = show.legend,           // Obv.
          inherit.aes = inherit.aes,           // Obv.
          params = list(na.rm = na.rm,         // aes information?
                        alpha = 0.35,
                        col = NA, ...)
        ),
    ...
    )}
  )
```

- `geom_linerange()` is a thing.

## Etc - Where did I get this stuff?
- Package rgdal?
- `rgdal::readOGR()` ?
- `germany <- readOGR(dsn = "shapes", layer = "DEU_adm1")` ?

- Shapefiles:
  1. several different files
  2. .shp = shape geometry
  3. .shx = shape index
  4. .dbf = attributes for each shape


## Investigate:
- Grid Package.
- KDE?
- bw = "nrd0"
- kernel = "gaussian"
- car package
- cmdscale
- plot_quart() ?
- viridis Package
- PerformanceAnalytics Package
- gather function from Package tidyr
- matlib Package

## Reading List:
["Exploratory Data Analysis" by John Tukey](https://www.amazon.com/Exploratory-Data-Analysis-John-Tukey/dp/0201076160)
["An R Companion to Applied Regression" by John Fox & Sanford Weisberg](https://www.amazon.com/R-Companion-Applied-Regression/dp/141297514X)