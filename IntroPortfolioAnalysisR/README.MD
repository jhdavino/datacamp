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
- `Returns.portfolio()` takes three arguments:
  1. The xts data.
  2. The `weights` argument.
  3. The `rebalance_on` argument which takes 'years', 'weeks', 'months', etc.
- You can pass `verbose = TRUE` to `Return.portfolio()` to get a *Beginning of Period*/*End of Period* weights and values.


# Analyzing Performance
- The **Arithmetic Mean Return** is the sum of the returns over the number of portfolios.
- The **De-Meaned Return** is the difference between the *Arithmetic Mean Return* and the return of that individual portfolio.
- You can get the variance using the sum of squares over the total portfolios minus one.
- The **Portfolio Volatility** is the standard deviation of the portfolio variance as defined above.
- Since there is a difference between the average return and the effective return, a different measure is preferred.
- This is the **Geometric Mean Return** which is defined as the product of one plus the return per portfolio return, raised to the 1/[Portfio_total] minus 1.
- You can calculate the *Geometric Mean* using the function `mean.geometric()`.
- You benchmark portfolios against a **Risk-Free Asset** such as treasury bill.
- The line drawn between a risky portfolio and the risk free asset is called the **Capital Allocation Line**.
- The slope of the *Capital Allocation Line* is called the **Sharpe Ratio**.
- This is usually done over a monthly time frame but is usually converted into and reported in an annualized way.
- This is called the **Annualized Sharpe Ratio** and is done by taking the geometric mean and changing the power to 12/T.
- The package `PerformanceAnalytics` has the function `Return.annualized()` to return the annualized returns.
- The package `PerformanceAnalytics` has the function `StdDev.annualized()` to return the annualized Standard Deviation.
- You can calculate the annualized returns, standard deviation, and *Sharpe Ratio* using the function `table.AnnualizedReturns()`.
- **Bull Markets** are when the markets increase.
- **Bear Markets** are when markets decrease.
- To choose a window length, you're going to want to a long enough sample to smooth the graph.
- You can use the function `SharpeRatio.annualized(<df>, <rf>)` to calculate the *Annualized Sharp Ratio*, where:
  * `df` is the xts object.
  * `rf` is the *risk free asset* values.
- You can have a graph created for you using the function `chart.RollingPerformance( <df>, width = <n>, FUN = <f>)`, where:
  * `df` is the xts object.
  * `width` is the number of months of the window.
  * `FUN` is the function to use.
- There is also a plural version that does not need the width or function: `charts.RollingPerformance()`.
- You can create a subset using the function `window()`.
- You pass a start date of the format *YYYY-MM-DD* and an optional end date.
- It also has it's own histogram function called `chart.Histogram()`.
- The assumption of a normal distribution is actually wrong since there are almost always more negative returns than positive.
- The **Portfolio Return Semi-Deviation** uses the subset of returns below the mean and then calculates the return.
- **Kurtosis** is the how strong the curve of a graph is.
- The function `kurtosis()` will measure the kurtosis of the data.
- The function `skewness()` will measure the skew of the data.
- The function `SemiDeviation(<xts>)` will calculate the PRSD.
- The function `Var(<xts>, <p/z>)` will calculate the **Value At Risk**, where `p/z` is the confidence level.
- The function `ES(<xts>, <p/z>)` will calculate the **Expected Shortfall**, ".
- The function `table.Drawdowns()` will calculate the peak-trough declines to quantify that risk.
- There is also a chart version too.

# Performance Drivers
- Portfolio Return is now a synonym of *Expected Value*.
- The function `chart.Scatter()` can be used to plot a scatter plot.
- The function `chart.RollingCorrelation()` will plot the correlations between the variables.
- You can also pass the parameter `width` to control the number of months to consider.
- Using Matrix notation:
  * Matrix, but really a vector, of portfolio weights.
  * Matrix, but really a vector, of asset returns.
  * Matrix, but really a vector, of expected returns.
- In the **Covariance Matrix**, the diagonal is the variance while the outside numbers are the **Covariance**.
- You can avoid large numbers of terms using **Matrix Notation**.
- You do matrix multiplication using `%*%`.
- You take the transpose using `t()`.
- To get a **Portfolio Violatility Budget**, you'll need to:
  1. Portfolio Volatility needs to be rewritten as the sum of RC_i, where:
    * RC_i = w_i(COVw)i / sqrt( w'COVw )
    * RC is called the **Risk Contribution**.
  2. Calculate the %RC, or **Percent Risk Contribution** using RC_i / Portfolio Volatility.
- The function `StdDev()` create a list which includes:
  1. the assets standard deviation.
  2. the assets risk contribution.
  3. the assets percent risk contribution.

# Optimizing Performance
- **Harry Markowitz** recommends finding optimal portfolio performance by minimizing variance.
- There is a function `tseries::portfolio.optim()` that will do the calculation for it.
- It also accepts other parameters:
  * `pm` is the target return.
  * `shorts` boolean for whether negative weights are forbidden.
  * `reshigh` is the upper contraints on the portfolio weights.
- You can find the Standard Deviation of these models at `object$ps`.
- The **Efficient Fronter** is the curve of the optimal values between the risk and the reward.
- Points above the curve cannot exist and points below the curve are dominated by the curve itself.
- The **Tangency Portfolio** is when the *Sharpe Ratio* is tangent to the *Efficient Frontier*.
```r
grid <- seq(from = .01, to = max(stockmu), length.out = 50)
```
- There is a limit to data-driven portfolio allocation.
- Use **Split-Sample Analysis** to do a realistic evaluation of portfolio performance.
- You split the sample into the In-Sample/Out-Sample like a Test/Train set.
- These two must not have overlap else there will something called **Look-Ahead Bias**.

# Research:
- Harry Markowitz?

# Reference:
