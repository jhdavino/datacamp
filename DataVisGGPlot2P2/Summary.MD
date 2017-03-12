# Data Visualization with GGPlot2, Part 2 at a Glance

- Coordinates layer controlled by coord_cartesian().
- `scale_x_continuous( limits= c(4.5, 5.5))` will hard limit x values between 4.5 and 5.5.
- `xlim( c(4.5, 5.5) )` will impact how models and lines are displayed; lead to erroneous result.
- `coord_cartesian( xlim = c(4.5, 5.5))` will just zoom in on the graph; does not subset the dataset like xlim.
- Aspect Ratio adjusts the height-to-width ratio.
- `coord_fixed( .055 )` will change the ratio.


```
thin.bar <- ggplot(mtcars, aes(x = 1, fill = cyl)) + geom_bar()
```
- Setting x = 1 will fill the area.
- The local version of this code is not coloring the graph.

```
# Convert thin.bar to pie chart
thin.bar + coord_polar( theta = "y")
```
- Change to Circles/Pie.
- `facet_grid( [rows] ~ [columns] )`


## GGplot2 Themes
- Themes can be used to control visual elements.
- There are three types:
  1. Text
  2. Line
  3. Rectangle

- Using this will take the form: element_{type}(); where type is from [Text, Line, Rectangle].

- Full list of possible elements:
```
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
  strip.text.y = 
)
```

- All text elements inherit from text
- You can use element_blank() to remove an item.

```
# Remove all the elements.
uniform_panels <- theme(
  panel.background = element_blank(), 
  legend.key = element_blank(), 
  legend.background=element_blank(), 
  strip.background = element_blank()
)
```


- Move the legend position using legend.position = c( [x], [y] ).
- Move the legend rotation using legend.direction = "horizontal".
- Move the legend position using legend.position = "bottom".
- Remove the legend fully  using legend.position = "none".

- Instead of panel.margin, use panel.spacing .
- Instead of panel.margin.x, use panel.spacing.x .

- Create space between graphs using panel.margin.x = units( 2, "cm").
- You can save the base plot and then adjust as needed.
- This can be used to reset the plot.


- theme_update() does two things:
  1. Updates the current theme with your changes.
  2. Returns a copy of the non-updated theme.
- theme_grey() is the default.


## ggplot2 - Best Practices
`m <- ggplot(mtcars, aes(x = cyl, y = wt, col = am, fill = am) ) `

- Don't use Pie Charts:
  1. They only show parts of the whole.
  2. Interpretation of graph is ambiguous. [angle?, area?, length?]

- Solution is to avoid Pie Charts when possible.


## GGally Package

- ggparcoord() is ugly; don't ever use this.
- ggpairs() creates scatter plot matrix of features.


## heatmaps
- It is hard to plot continuous data with colors.
- Use facet_wrap / facet_grid instead.

- Use brewer.pal to create a pallete of colors to plot with:
  + brewer.pal(
  + 9,     // count of colors
  + "Reds" // Color Target.

```
# Build the heat map from scratch
ggplot( barley, aes( x = year, y = variety, fill = yield)) +
  geom_tile() +  // Not a fan.
  facet_wrap( ~ site,
    ncol = 1) + // ncol adjusts how one should stack the facets
  scale_fill_gradientn( colors = myColors )
```

- scale_fill_gradientn is for an 'n' array of colors.
- scale_fill_gradient is for two different colors.


- California Health Interview Survey (CHIS).
- Package vcd; "Visualizing Categorical Data".
- `mosiac( M, shade = TRUE, color = TRUE)`.





```
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
```

## Research
- coord_equal()
- theme_tufte()
- facet_wrap vs facet_grid?
- Investigate vcd package.
- as.data.frame.matrix

## Reading List:
- None.
