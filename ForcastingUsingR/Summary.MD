# Forecasting Using R
## Rob J. Hyndman

# Exploring and Visualizing Time Series in R
- You'll learn:
  1. Exploring and visualizing time series.
  2. Simple Benchmarking
  3. Exponential Smoothing and Arima models.
  4. Advanced Forecast Methods.
  5. Choosing the best method.
- The class is based on the course *Forecasting Principle and Practice*.
- There is an associated package called fpp2.
- A *Time Series* is merely a series of data over time.
- You can use `autoplot()` to configure much of the settings for plotting data.
- You can facet the data by passing `facets = TRUE`.
- A Seasonal plot is similar to a time series plot but is plotted against seasons.
- You can create one using `ggseasonplot()`.
- You can split up a time series using `windows( <data>, start = <>, end = <>)`.
- You can use `ggsubseriesplot()` to divide and draw the average of each subset.
- A **Trend** is when there is a long term increase or decrease in the data.
- A **Seasonal** is a pattern that exists due to the calendear.
- A **Cycle** is a periodic pattern over time.
- We need to distinguish between seasonal and cyclical since they use different models.
- You can plot a lagging graph using `gglagplot()`.
- You can plot the autocorrelation function plot using `ggAcf()`.
- Identical and independently distributed means the same thing as *white noise*.
- **Ljung-Box Test** is considers the first h autocorrelations and values together.
- You can use this test using `Box.text( <.x>, lag = <n>, fitdf = <n>, type = "Lj")`.
- `Box.test(diff(goog), lag = 10, type = "Ljung")`

# Benchmark Methods and Forecast Accuracy

# Exponential Smoothing

# Forecasting With ARIMA Models

# Advanced Methods

# Reserach:


# Refernce:
- [Online Textbook]( http://otexts.org/fpp2/)
-
