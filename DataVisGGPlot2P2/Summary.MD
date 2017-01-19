# Clean Up.

# Data Visualization with GGPlot2, Part 2 at a Glance
- Coordinates layer controlled by coord_cartesian()
- `scale_x_continuous( limits= c(4.5, 5.5))` will hard limit x values between 4.5 and 5.5
- `xlim( c(4.5, 5.5) )` will impact how models and lines are displayed; lead to erroneous result.
- `coord_cartesian( xlim = c(4.5, 5.5))` will just zoom in on the graph; does not subset the dataset like xlim.
- Aspect Ratio adjusts the height-to-width ratio.
- `coord_fixed( .055 )` will change the ratio.`


```
thin.bar <- ggplot(mtcars, aes(x = 1, fill = cyl)) +
              geom_bar()
```
- 

# Convert thin.bar to pie chart
thin.bar + coord_polar( theta = "y")


facet_grid( [rows] ~ [columns] )


GGplot2 Themes
--------------
control visual elements.
Types: text, line, rectangle

element_[type]()

theme(
line = element_line()
text = element_text()
title = 
plot.title =
legend.text = 
legend.title =
axis.title = 
axis.title.x =
axis.title.y = 
axis.text = 
axis.text.x = 
axis.text.y = 
strip.text = 
strip.text.x = 
strip.text.y = )

all text elements inherit from text
you can use element_blank() to remove an item.


uniform_panels <- theme(panel.background = element_blank(), 
                        legend.key = element_blank(), 
                        legend.background=element_blank(), 
                        strip.background = element_blank())

# Move legend by position
z + theme( legend.position = c( .85, .85 ))

# Change direction
z + theme( legend.direction = "horizontal")

# Change location by name
z + theme( legend.position = "bottom")

# Remove legend entirely
z + theme( legend.position = "none")

> z + theme( panel.margin.x = unit( 2, "cm"))
Warning message: `panel.margin` is deprecated. Please use `panel.spacing` property instead
Warning message: `panel.margin.x` is deprecated. Please use `panel.spacing.x` property instead



1] save theme as object
2] Adjust as needed.


theme_classic()

[ ggtheme ]
theme_tufte() ?
theme_update()
	returns an object of the old theme while it sets the new defualt
theme_grey() // default

GGplot - Best Practices
m <- ggplot(mtcars, aes(x = cyl,y = wt, col = am, fill = am))


why not pie chart?
- only for Parts as a whole!
- really only want one way to interperet plot. [angle, area, length]


solution? Don't convert to pie chart!



[GGally]
ggparcoord(mtcars, my_names_am, groupColumn = group_by_am, alpha = .8) // looks ugly as sin.
scatter plot matrix 
ggpairs[ GGally ]

heatmaps
--------
hard to plot continuous data with colors.
facet_wrap vs facet_grid ?

"# Create color palette
myColors <- brewer.pal(9, "Reds")

# Build the heat map from scratch
ggplot( barley, aes( x = year, y = variety, fill = yield)) + geom_tile() +
facet_wrap( ~ site, ncol = 1) +
scale_fill_gradientn( colors = myColors )"

^ Collect and fix ^


Final chapter
-------------
CHIS 


[vcd]
mosiac( M, shade = TRUE, color = TRUE)



"# The initial contingency table
DF <- as.data.frame.matrix(table(adult$SRAGE_P, adult$RBMI))

# Add the columns groupsSum, xmax and xmin. Remove groupSum again.
DF$groupSum <- rowSums( DF )
DF$xmax <- cumsum( DF$groupSum )
DF$xmin <-  DF$xmax - DF$groupSum
# The groupSum column needs to be removed, don't remove this line
DF$groupSum <- NULL

# Copy row names to variable X
DF$X <- rownames( DF )

# Melt the dataset
library(reshape2)
DF_melted <- melt(DF, id.vars = c("X", "xmin", "xmax"), variable.name = "FILL")

# dplyr call to calculate ymin and ymax - don't change
library(dplyr)
DF_melted <- DF_melted %>% 
  group_by(X) %>% 
  mutate(ymax = cumsum(value/sum(value)),
         ymin = ymax - value/sum(value))

# Plot rectangles - don't change.
library(ggthemes)
ggplot(DF_melted, aes(ymin = ymin, 
                 ymax = ymax,
                 xmin = xmin, 
                 xmax = xmax, 
                 fill = FILL)) + 
  geom_rect(colour = "white") +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  BMI_fill +
  theme_tufte()
"

results <- chisq.test(table(adult$RBMI, adult$SRAGE_P))

library(ggplot2)
library(reshape2)
library(dplyr)
library(ggthemes)

# Script generalized into a function
mosaicGG <- function(data, X, FILL) {
  
  # Proportions in raw data
  DF <- as.data.frame.matrix(table(data[[X]], data[[FILL]]))
  DF$groupSum <- rowSums(DF)
  DF$xmax <- cumsum(DF$groupSum)
  DF$xmin <- DF$xmax - DF$groupSum
  DF$X <- row.names(DF)
  DF$groupSum <- NULL
  DF_melted <- melt(DF, id = c("X", "xmin", "xmax"), variable.name = "FILL")
  library(dplyr)
  DF_melted <- DF_melted %>% 
    group_by(X) %>% 
    mutate(ymax = cumsum(value/sum(value)),
           ymin = ymax - value/sum(value))
  
  # Chi-sq test
  results <- chisq.test(table(data[[FILL]], data[[X]])) # fill and then x
  resid <- melt(results$residuals)
  names(resid) <- c("FILL", "X", "residual")

  # Merge data
  DF_all <- merge(DF_melted, resid)
  
  # Positions for labels
  DF_all$xtext <- DF_all$xmin + (DF_all$xmax - DF_all$xmin)/2
  index <- DF_all$xmax == max(DF_all$xmax)
  DF_all$ytext <- DF_all$ymin[index] + (DF_all$ymax[index] - DF_all$ymin[index])/2
  
  # plot:
  g <- ggplot(DF_all, aes(ymin = ymin,  ymax = ymax, xmin = xmin, 
                          xmax = xmax, fill = residual)) + 
  geom_rect(col = "white") +
  geom_text(aes(x = xtext, label = X),
            y = 1, size = 3, angle = 90, hjust = 1, show.legend = FALSE) +
  geom_text(aes(x = max(xmax),  y = ytext, label = FILL),
            size = 3, hjust = 1, show.legend = FALSE) +
  scale_fill_gradient2("Residuals") +
  scale_x_continuous("Individuals", expand = c(0,0)) +
  scale_y_continuous("Proportion", expand = c(0,0)) +
  theme_tufte() +
  theme(legend.position = "bottom")
  print(g)
}


## Investigate:
- coord_equal()

## Reading List:
