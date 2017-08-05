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
# Simple Linear Regression
# Interpreting Regression Models
# Model Fit

# Research

# Reference
