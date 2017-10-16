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

# Correlation Analysis and the Autocorrelation Function

# Autoregression

# A Simple Moving Average

# Research:

# Reference:
