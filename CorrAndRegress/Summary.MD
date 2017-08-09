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
- There is no hard and fast rule for what constitues and outlier.
- To combat **point stacking** one should use:
	1. Transparency.
	2. `position = 'jitter'


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

# Research
- Francis Anscombe (1973)
- Sir Francis Galton (1930s)

# Reference
