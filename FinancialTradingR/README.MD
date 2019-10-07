# Financial Trading in R
## Ilya Kipnis

# Trading Basics
- **Trading** is the act of buying or selling an asset.
- They do this to:
  1. Make a profit.
  2. Take on, offload or hedge Financial Risk.
  3. Protect a company from commodity price movements.
- The plan of **Systematic Trading** is the risk/reward payoff is favorable enough to bear the risk.
- There are two kinds of trading:
  1. Divergence: the movement of a quntity will continue in its current direction.
    * **Commodity Trading Advisers(CTAs)** are who think like this.
  2. Convergence: the movement of a quantity will eventually reverse.
- The package that we'll be using has a dependency:
```
install.packages('remotes')
remotes::install_github("braverock/quantstart")
```
- Market data is a mix of fear, greed and noise of millions.
- **Past Performance is not indicative of future results.**.
- **Overfitting** on past data means bad performance on future data.
- A system should behave similarly for similar settings levels.
- The first step is to actually get financial data.
- We'll be using the function `getSymbols()` from the quantmod package.
- The `quantmod` function has these to access the columns of the data pulled:
  * `Op()` for open prices.
  * `Hi()` for maximum value for the day.
  * `Lo()` for minimum value for the day.
  * `Cl()` for the closing price for the day.
  * `Vo()` for number of trades that day.
  * `Ad()` adjusted closing price.
```
# Get SPY from yahoo
getSymbols("SPY",
           from = '2000-01-01',
           to = '2016-06-30',
           src =  "yahoo",
           adjust =  TRUE)

# Plot the closing price of SPY
plot(Cl(SPY))
```
- the TTR package contains lots of classical trading indicators.
- An example would be a **Simple Moving Average**.
- Some CTAs have made money using the 200 day moving average.
  * It shows where the prices have been over the last 10 months.
```
# Plot the closing prices of SPY
plot(Cl(SPY))

# Add a 200-day SMA using lines()
lines(SMA(Cl(SPY), n = 200), col = 'red')
```


# A Biolerplate for Quantstrat Strategies

# Indicators

# Signals

# Rules

# Research:

# Reference:
