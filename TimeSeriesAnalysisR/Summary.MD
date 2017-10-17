# Introduction to Time Series Analysis
## David S. Matteson
## Lore Dirick
## Matt Isaacs

# Exploratory Time Series Data Analysis
- **Time Seies**: A sequence of data in chronological order.
- Data is commonly recorded sequentially.
- Time series data is everywhere, obv.
- You can use the base R plot function to plot it.
- Basic Time Series Models:
  1. White Noise
  2. Random Walk
  3. Autoregression
  4. Simple Moving Average
- Basic Assumptions:
  * Consecutive observations are evenly spaced.
  * Apply a discrete-time observation index.
  * This may only hold approximately true.
- `start()` tells you when the data begins.
- `end()` tells you when the data ends.
- `frequency()` tells you how many there are.
- `deltat()` tells you how common the sampling is.
- `time()` will calculate a time vector so that only one observation exists per index.
- `cycle()` will return the position in the cycle of each observation.
- You can create a time series object using `ts()`.
- You can tell `ts()` to start at a date using `start = <2001>`.
- You can tell `ts()` the frequency of time using `frequency = <1>`.
- You can use `is.ts()` to check if an object is a time series.


# Predicting the future
- There are many kinds of trends in time series;
  * Linear
  * Exponetial
- `log()` can linearize a graph.
- `diff()` can remove a linear trend.
- Passing `s = <n>` to `diff()` can remove seasonal trends.
- The **White Noise** is the simplest example of stationary process.
- It has the features:
  1. Stable Mean.
  2. Stable Variance.
  3. No trend over time.
- You can simulate a White Noise Model using the `arima.sim()`.
- arima stands for Auto Regressive Integrated Moving Average.
- You can pass:
  * `n = <n>` for number of samples.
  * `mean = <n>` for mean of time series.
  * `sd = <n>` for standard deviation of the time series.
- A **Random Walk** is simple example of a non-stationary process.
- It has the properties that:
  1. It doesn't have a stable mean or variance.
  2. It's very dependent on it's immediate neighbors.
  3. It's trending follows a white noise localized adjustment.
- The Random Walk recursion follows: `Today = Yesterday + Noise`.
- You can also add a constant - *C* - to the model to create a trend.
- You pass `list(order = c(0,1,0))` to `arima.sim()` to get a random walk.
- `arima()` does not accept a list part.
- A Stationary model is one where process are distributed stability over time.
- *Weak Stationary* means that the mean, variance, covariance are constant over time.
- As an example, COV( Y3, Y5) = COV( Y7, Y10)


# Correlation Analysis and the Autocorrelation Function

# Autoregression

# A Simple Moving Average

# Research:

# Reference:
