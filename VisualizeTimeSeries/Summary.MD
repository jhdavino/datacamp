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
- 


# Case Study

# Research:


# Reference:
