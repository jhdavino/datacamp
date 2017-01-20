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



# Investigate:
- Grid Package.
- geom_rug()?
- KDE?
- bw = "nrd0"
- kernel = "gaussian"
- car package
- cmdscale