# Data Visualization with GGPlot2, Part 3

scale_y_log10() 
scale_x_log10( expression( log[10](Carat) ), limits = c(.1, 10))

Box plots and Density plots are useful for scientific audiances.
John Tukey - Exploratory Data Analsis

5 point summary displays distribution as 25% pieces.
Also, shows outliers as distinct features.

outlier = 1.5 * IQR [ Interquartile Range ]
whiskers cannot be drawn outside the fence.

cut_interval(x, n) cut with equal range
cut_number( x, n) cut with equal number of observations.
cut_width( x, n) cut with n sized groups; takes into account of range!

plot_quart() 

density plot is good for univariate data
Kernal Density Estimate( KDE) 

how do you pick the bandwith in KDE? 
Bandwith smooths out graph.

Density plots are just graphs of the underlying distribution.
geom_density cuts off outer data when using limits; this means area under curve is no longer 1.



```
# Base layers
p <- ggplot(faithful, aes(x = waiting, y = eruptions)) +
  scale_y_continuous(limits = c(1, 5.5), expand = c(0, 0)) +
  scale_x_continuous(limits = c(40, 100), expand = c(0, 0)) +
  coord_fixed(60 / 4.5)

# Use geom_density_2d()
p + geom_density_2d()

# Use stat_density_2d()
p + stat_density_2d(aes(col = ..level..), h = c(5, 0.5))
```

library(viridis)




Problems with Large Data set:
Many observations
Many variables
Combination


Many obs solutions:

stat_density_2d( geom = "title", aes( fill = ..denstiry..), contour = FALSE)
geom_bin2d( bins = 100 )
geom_hex( bin = 100 )

Reducing over-plotting
reducing gamount of information taht is plotted.

Many variables solutions:
Data reduction | PCA [ Principle Component Analysis ]
Facets // limited when tons of 


Scatter PLOt Matrix - SPLOM
ggpairs()

ggparcoord()

```
# chart.Correlation
library(PerformanceAnalytics)
chart.Correlation( iris[1:4] )

# ggpairs
library(GGally)
ggpairs( mtcars_fact[1:3] )


Ternary Plot - Triangle Plot
Compsitional trivariate data 

libary( ggtern )
ggtern( )


africa_sample_tidy <- gather(africa_sample, key, value, -ID)

# Load ggtern
library(ggtern)

# Build ternary plot
ggtern(africa, aes(x = Sand, y = Silt, z = Clay)) +
  geom_point( shape = 16, alpha = .2)


ggtern(africa, aes(x = Sand, y = Silt, z = Clay)) +
  geom_density_tern()


ggtern(africa, aes(x = Sand, y = Silt, z = Clay )) +
  stat_density_tern( geom = "polygon", aes( fill = ..level..,  alpha = ..level..)) +
  guides( fill = guide_legend( show = FALSE ))
```

# NETOWRK PLOTS
packages:


```
# geomnet is pre-loaded

# Merge edges and vertices
mmnet <- merge(madmen$edges, madmen$vertices,
               by.x = "Name1", by.y = "label",
               all = TRUE)

# Finish the ggplot command
ggplot(data = mmnet, aes(from_id = Name1, to_id = Name2)) +
  geom_net( aes( col = Gender ), size = 6, linewidth = 1, label = TRUE, fontsize = 3, labelcolour = "black")
```


Diagnostic Plots


Package car
qqPlot
influencePlot
John Fox and Michael Friendly

```
library( ggfortify )
autoplot( res, ncol = 2 )
```

```
autoplot( Canada )
```

```
# Autoplot of MDS
autoplot( cmdscale( eurodist, eig = TRUE ), label = TRUE, label.size = 3, size = 0 )
```

```
# perform clustering
iris_k <- kmeans(iris[-5], 3)

# autplot: coloring according to cluster
autoplot(iris_k, data = iris, frame = TRUE)

# autoplot: coloring according to species
autoplot(iris_k, data = iris, frame = TRUE, col = 'Species')
```

Maps and animations:
Geographic Infomration System [ GIS ]

Choropleths
Drawing bunch of polygons.

```
library( ggplot2 )
usa<- map_data('usa')
ggplot( usa, aes( long, lat, group = group)) +
	geom_polygon() +
	coord_map()
```

coord_proj( "+proj=wintri") ?

```ggplot( usa, aes( long, lat, group = group, fill = region)) +
	geom_polygon( color = "white") +
	coord_map()
```	

```
ggplot(usa, aes(x = long, y = lat, group = group )) +
  geom_polygon() +
  coord_map() +
  theme_nothing()
```

```
# usa, cities, and all required packages are available

# Finish plot 1
ggplot(usa, aes(x = long, y = lat, group = group)) +
  geom_polygon() +
  geom_point( data = cities, aes( group = State, size = Pop_est), col = "red", shape = 16, alpha = .6 ) +
  coord_map() +
  theme_map()

# Arrange cities
library(dplyr)
cities_arr <- arrange(cities, Pop_est)

# Copy-paste plot 1 and adapt
ggplot(usa, aes(x = long, y = lat, group = group)) +
  geom_polygon( fill = "grey90") +
  geom_point( data = cities_arr, aes( group = State, size = 2, col = Pop_est), shape = 16, alpha = .6 ) +
  coord_map() +
  scale_color_viridis() +
  theme_map()
```

```
state<- map_data("state")

# Map of states
ggplot( state, aes( x = long, y = lat, group = group, fill = region )) +
  geom_polygon( col = "white") +
  coord_map() +
  theme_nothing()

# Merge state and pop: state2
state2<- merge(state, pop, by = "region" )

# Map of states with populations
ggplot( state2, aes( x = long, y = lat, group = group, fill = Pop_est )) +
  geom_polygon( col = "white") +
  coord_map() +
  theme_map()
```

Shapefiles:
several different files
.shp = shape geometry
.shx = shape index
.dbf = attributes for each shape

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

```
bundes$state <- factor(as.numeric(bundes$id))
levels(bundes$state) <- germany$NAME_1

# Merge bundes and unemp: bundes_unemp
bundes_unemp <- merge( bundes, unemp, by = "state")

# Update the ggplot call
ggplot(bundes_unemp, aes(x = long, y = lat, group = group, fill = unemployment)) +
  geom_polygon() +
  coord_map() +
  theme_map()
```




Cartographic maps

```
# Load the ggmap package
library( ggmap )

# Create london_map_13 with get_map
london_map_13 <- get_map( "London, England", zoom = 13)

# Create the map of london
ggmap( london_map_13 )

# Experiment with get_map() and use ggmap() to plot it!
london_data<- get_map( "London, England", source = "stamen", maptype = "toner")

ggmap( london_data )
```

```
xx <- geocode(london_sites)
xx$location <- sub(", London", "", london_sites)
xx$location[5] <- "Queen Elizabeth\nOlympic Park"

# Create bounding box: bbox
bbox <- make_bbox(lon = xx$lon, lat = xx$lat, f = .3)

# Update get_map to use bbox
london_ton_13 <- get_map(location = bbox, zoom = 13,
                         source = "stamen", maptype = "toner")

# Map from previous exercise
ggmap(london_ton_13) +
  geom_point(data = xx, aes(col = location), size = 6)

# New map with labels
ggmap( london_ton_13) +
  geom_label(data = xx,  aes(label = location), size = 4, fontface = "bold", fill = "grey90", col = "#E41A1C" )
```


Animations
Good for dense temproal data

Use animation package
package gganimate

Motion chart?


```
# Inspect structure of japan
str(japan)

# Finish the code inside saveGIF
saveGIF({

  # Loop through all time points
  for (i in unique( japan$time)) {

    # Subset japan: data
    data<- subset( japan, japan$time == i )

    # Finish the ggplot command
    p <- ggplot(data, aes(x = AGE, y = POP, fill = SEX, width = 1)) +
      coord_flip() +
      geom_bar(data = data[data$SEX == "Female",], stat = "identity") +
      geom_bar(data = data[data$SEX == "Male",], stat = "identity") +
      ggtitle(i)

    print(p)

  }

}, movie.name = "pyramid.gif", interval = .1)
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








# Investigate:
- Grid Package.
- geom_rug()?
- KDE?
- bw = "nrd0"
- kernel = "gaussian"
- car package
- cmdscale
- saveGIF?