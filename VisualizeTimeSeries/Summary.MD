# Visualizing Time Series Data in R
## Arnaud Amsellem

# R Time Series Visualization Tools
- **xts** is a special class of object used to handle time series.
- It stands for extensible Time Series.
- Time Index + Data.
- The *index* must be a true time object.
- *Insert primier on graphs*.
- `sub = <Insert Subtitle Here?`.
- `pretty()` allows you to scale axis efficiently.
- You can create a highlighted period using `PerformanceAnaalytics::chart.TimeSeries( <data>, period.areas = <period>)`.
- The format for the period is `c(2014-01/2015-01)`.
- You can control the color using `period.color = "<color>"`.

# Univariate Time Series
- Univariate Time Series are focused on:
  1. Location
  2. Disperision
  3. Distribution
- In their standard form most time series do not exhibit the right statistical properties.
- We want to convert price into a series of returns.
- `TTR:ROC()` will be used to convert from price to rate of return.
- *Discussion of Historgrams and Box and Whisker*
- *Discussion of Autocorrelation*
- *Discussion about Normality Assumption*
- You can flip the x-y relationship using `horizontal = TRUE`.
- You can draw an **Autocorrelation Plot** using `acf()`
- You can alter the lags using `lag.max`.

# Multivariate Time Series


- To make a **Stacked Chart** you use the `barchart()` function.
- The goal of Multivariate Analysis is to understand the relationship between multiple variables.
- A **Correlation Matrix** is used to draw simple conclusions from the relationship betweeen variables.
- You can use `corrplot::corrplot()` to simplify the drawing of the the relationships in a graph.
```r
corrplot( my_stocks,
  method = "number",
  type="upper")
```
- You can do something similar with `pairs` and passing `lower.panel = NULL`
- `corrplot()` also accept a great deal of parameters to control it's visualizations.
  * Method can be:
    1. "circle"
    2. "square"
    3. "ellipse"
    4. "number"
    5. "shade"
    6. "color"
    7.  "pie"
- A **Heatmap** is a diagram of data where relationships are represented as colors.
- You can use most of the same options; including `order = "hclust"`.

# Case Study
- 


# Research:

# Reference:
