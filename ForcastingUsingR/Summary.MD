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
- `naive()` will take create a forcast based on the last observation.
- `snaive()` will do the same but for seasonal forecasts.
- Both functions can accept an `h = <n>` parameter for how many observations you'd like to predict.
- A **residual** is the difference between an observation and its fitted value.
- Assumptions about residuals:
  1. (Need): are uncorrelated.
  2. (Need): Mean Zero.
  3. (Want): Constant variance.
  4. (Want): Normally Distributed.
- You can use the `checkresiduals()` function to our assumptions.
- P-values in the Ljung-Box test are reverse to normal; ie. large values are better.
- You can cut off the latest set of points to try and predict them.
- Training/Test set again.
- The `accuracy()` function calculates pretty much all of the error formulas for us.
- You can use the `ts.subset()` function to divide up the time series.
- `ts.subset()` accepts parameters `start = <n>` and `end = <n>` by counting the total observations.
- You can calculate the mean forecast of a time series using `meanf()`.
- **Time Series Cross Validation** is a solution to bias of the old models.
- The function `tsCV()` uses the MSE and does the cross validation for you.

# Exponential Smoothing
- Simple Exponential Smoothing weights observations as the (time/data) move further from initial point.
- You can use this using `ses()`.
- `accuracy(fcses, marathon)`
- **Holt's Method** is used to dampen the effect of a trend.
- You can use this using `holt()`.
- Charles Holt also came up with a way to deal with seasonality and trending: the **Holt-Winter's Method**.
- You can use this using `hw( <data>, seasonal = "[additive|multiplicative]")`.
- All exponential smoothing models can be written as **Innovation State Space Models**.
- **ETS Models** stands for Error, Trend, Seasonal models.
- To invoke this model, use `ets()`.
- This model minimizes the errors based on the Akaike Information Critereon.
- `ets()` does not produce a forecast, but instead a model.
- To get a forecast, use `<data> %>% ets() %>% forecast() %>% autoplot()`.

# Forecasting With ARIMA Models

# Advanced Methods

# Reserach:
- Charles Holt?

# Refernce:
- [Online Textbook]( http://otexts.org/fpp2/)
-
