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


# Investigate:
- Grid Package.
- geom_rug()?
- KDE?
- bw = "nrd0"
- kernel = "gaussian"