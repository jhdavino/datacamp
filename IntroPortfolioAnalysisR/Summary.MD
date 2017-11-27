# Introduction to Portfolio Analysis in R
## Kris Boudt

# The Building Blocks
- Two simple tricks to minimze losses:
  1. Diversify portfolios.
  2. Use **backtesting** and historical data.
- There are Four allocating Strategies:
  1. Betting on 1 Asset.
  2. Equal Weighting
  3. Market Cap Weighting
  4.  Optimize Mean/Variance.
- *Don't put all your eggs in one basket.*
- Returns are a relative change in value: (final_value - init_value) / final_value
- Because of the way returns work, you will need to double the returns to equal a loss.
- We will be using the package **PerformanceAnalytics**.
- PerformanceAnalytics was written by Peter Carl and Brian Peterson.
- You can calculate the asset's returns using `Return.calculate()`.
- You can calculate the portfolio's returns using `Return.portfolio()`.
- `Return.calculate()` takes prices and returns an *xts* object of percent returns.
- Since there is no previous data to compare against, the first row will always be *NAs*.
- `Returns.portfolio()` takes three arguements:
  1. The xts data.
  2. The `weights` argument.
  3. The `rebalance_on` argument which takes 'years', 'weeks', 'months', etc.
- You can pass `verbose = TRUE` to `Return.portfolio()` to get a *Beginning of Period*/*End of Period* weights and values.


# Analyzing Performance
- 

# Performance Drivers
-

# Optimizing Performance
-

# Research:


# Reference:
