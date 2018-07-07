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
- `ts.plot()` can be used to auto-plot two different sets of data when `cbind()`ed together.
- `diff(log( <ts_object> ))` to normalize the data.
- You use the function `cov()` to calculate the covariance.
- Correlations are a standardized version of Covariance.
- You use the `cor()` function to calculate the correlation.
- Autocorrelation is a powerful measure of how predicable a dataset is.
- A **Lag 1 Autocorrelation** is when you compare a stock of yesterday with today.
- A **Lag 2 Autocorrelation** is when you compare a stock of two days with today.
- The **Autocorrelation Function** is the difference in Autocorrelation with respect to the time index.
- You can use `acf( <ts>, lag.max = <n>, plot = FALSE)` to calculate it.


# Autoregression
- We're going to start with a simple case: Autoregression recursion onto yesterday.
- Model: `Today = constant + slope*yesterday + noise`.
- Mean Centered Version: `(Today - Mean) = Slope*(yesterday - Mean) + noise`.
- Large values of Phi - or the slope - lead to greater autocorrelation.
- Negative values of Phi lead to oscillating time series.
- You can use `arima.sim( model = list(ar = <n>)` to model an Autoregression.
- The **Random Walk** is a special case of Autoregression.
- You can import data straight from a package using `data( Mishkin, package = 'Ecdat')`.
- `arima()` is for generating a model; `arima.sim()` is for simulating data.
- You can use `predict( <model> )` to make predictions.
- You can change the window of prediction by passing `n.ahead` to `predict()`.

# A Simple Moving Average
- A **Simple Moving Average** has the form ` Today = Mean + Noise + Slope*(Yesterdays_Noise)`.
- You can simulate one using `arima.sim()` by passing `list(ma = theta)`.
- You can generate a Moving Average model using `arima()` and passing it `order = c(0, 0, 1)`.
- You can get an Akaike Information Criterion using `AIC()`.
- You can get an Bayesian Information Criterion using `BIC()`.


# Research:

# Reference:
- [Explanation of Autocorrelation](https://s3.amazonaws.com/assets.datacamp.com/production/course_1143/slides/ch3_3_supplementary.pdf)
