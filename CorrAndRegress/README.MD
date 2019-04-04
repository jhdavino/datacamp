# Correlation and Regression
## Ben Baumer

# Visualizing Two Variables
- Both Variables are Numerical
- Response Variable - denoted **y** or **dependant**
- Explanatory Variable - denoted **x** or **independant**
- Scatterplot GG.
- See ggplot classes about how to make graphs.
- You can label graphs using `scale_{x,y}_continuous( "**label_name**" )` instead of using `labs()`.
- You can think of boxplots as scatterplots except:
		1. but with discrete explanatory variables.
- You can make subsets using `cut(**x**, breaks = **<n>**)`.
- With Scatterplots, look for:
	1. Form
	2. Direction.
	3. Strength.
	4. Outliers.
- ggplot includes a function to scale using:
	1. `coord_trans(x = "log10", y = "log10")`
	2. `scale_{x,y}_log10()`
- There is no hard and fast rule for what constitues an outlier.
- To combat **point stacking** one should use:
	1. Transparency.
	2. `position = 'jitter'`


# Correlation
- .. is a coefficient between -1 and 1 that indicates the strength of the relationship.
- Attributes:
	1. Sign means direction.
	2. Magnitude means strength.
- Non-linear relationships will not be represented correctly.
- "Pearson product-moment Correlation"
- Equation: r(x,y) = (Cov(x, y) / SQRT( SXX * SYY))
-  .. or           = (SUM( [xi-xm]*[yi-ym]) / SUM( [xi-xm]^2) *SUM( [yi-ym]^2))
- To override the default behavior of `cor()` when dealing with NAs use `use = "pairwise.complete.obs"`.
- Spurious Correlations are funny.

# Simple Linear Regression
- ggplot has it's own version of the `abline()` function called `geom_abline()`.
- You can add the "best fit" line using `geom_smooth( method = 'lm')`.
- You can remove the **Standard Error** area using `se=FALSE`.
- In a Linear model, we assume that the data fits a linear model.
- The Residials, or error terms, *MUST* be normally distributed.


# Interpreting Regression Models
# Model Fit
- By convention Sum of Square Errors is abbreviated SSE.
- The easier way to conceptualize model fit is the Root Mean Squared Error:
	1. SQRT( SUM( residuals^2) / [degrees_of_freedom])
	2. SQRT( SSE / n - 2 )
- You can get the degress of freedom from a model using `df.residual()`.
- You can use what is called the *Null Model* as a benchmark; which is using the mean values.
- You can fit a *Null Model* by passing the response feature against 1: `lm( var ~ 1, data = **<data>**)`
- The *Null Model* is also sometimes called the *Sum of Squares Total*.
- Which leads us to the *R^2* value calculated using 1 - SSE/SST = 1 - Var(e)/Var(y).
- For simple linear regression, R^2 value = Correlation Coefficient squared.
- "Essentially, all models are wrong, but some are useful." - George Box
- Levarge is used to calculate the impact a single value has on the best fit line.
- From `broom::augment()` the `.hat` value is the leverage statisic for a point.
-  A point can have high leverage and not be influential.
- A point that combines the influence and leverage is called *Cooks Statistics*.
- This is accessible via `broom::augment()` as `.cooksd`.
- There is very little that can be done about outliers.
- You could remove them but there is a cost:
	1. What is the justification?
	2. How does the scope of inference change?

# Research
- Francis Anscombe (1973)
- Sir Francis Galton (1930s)
- George Box
- Cooks Statistic

# Reference
