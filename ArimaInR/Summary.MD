# ARIMA Modeling with R
## David Stoffer

# Time Series Data and Models
- duder wrote a book.
- .. and a package `astsa`.
- White Noise is:
  1. Independent normals with common variance.
  2. Basic building blocks of time series.
- ARIMA is a combination of Autoregression and Moving Average.
- **Stationarity** is when the time series is "stable"; i.e.:
  1.  the Mean is constant.
  2. Correlation structure remains constant.
- **Wold Decomposition**: any stationary time series can be rewritten as a linear combination of white noise.

# Fitting Arima Models
- You can't tell whether a dataset is Moving Average or Autoregression.
- You will need to use `acf()` or `pacf()`
-Table of possible results:
|      | Auto Regression | Moving Average |   ARMA    |
|------|-----------------|----------------|-----------|
| acf  |    Tails off    |  Cuts off lag  | Tails off | 
| pacf |   Cuts off lag  |   Tails off    | Tails off |

- Estimation for tiems series is similar to using Least Squares.
- `astsa::sarima()`?
- `sarima(x, p = 1, d = 0, q = 0)` comes with all sorts of output - including graphs.
- `acf2()` gives the sample **P/ACF's** of the object in question.
- Now we're going to put AR and MA together for ARMA models.
- Remember that, as you include more parameters the error gets smaller.
- Therefore, AIC and BIC usually include a penalty.
- We want to make sure that residuals are white noise.


# Arima Models
- A time series exhibits ARMIMA behavior if the differenced data has ARMA behavior.
- The `d` parameter we were ignoring is for *difference*.
- You can use `sarima.for()` for forecasting.

# Seasonal Arima
- **Seasonal ARMA** models are the same as normal ARMA models when you account for their seasonality.
- To have `acf2()` correct for seasonality, pass the parameter `max.lag = <n>`.
- A seasonal model can be fit with `sarima()` by passing the additional parameters `P = <n>, D = <n>, Q = <n>, S = <n>`.
- Note that the *S* parameter stands in for the period; divisions in the data.
- Purely seasonal models are very rare.
- We'll need to build what are called **Mixed Seasonal Models**.
- Notation: `SARIMA(p,d,q)x(P,D,Q)` where lower letters is normal input and upper letters are seasonal.
- Seasonal Persistence is when a trend stays year per year and can be removed using seasonal difference.

# Research:
- `sarima()`.
- `QQplot()`?

# Reference:
