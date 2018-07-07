# Exporatory Data Science
## Andrew Bray

# Exploring Categorical Data
- Factors are the prefered way to deal with Categorical Variables.
- You can figure out the distinct values of a variable's factors using `levels()`.
- Please note that NAs are ignored by `levels()`.
- Take the ggplot course.
- You can get the probabilities of `table()` output by passing the results to `prop.table()`.
- You can include conditionality by passing 1 for rows and 2 for columns in `prop.table()`.
- DO NOT USE PIECHARTS.


# Exploring Numerical Data
- You can see the structure using `str()`.
- This displays the type and examples on a row per feature.
- Dotplots are useful because there is no information lost via "on-plotting".
- Histograms can be used to make the distribution apparent.
- Density plot is used to represent the histogram but as a single smoothed line.
- You can rotate the graph using `coord_flip()` with a plot.
- You perception of the distribution will change based on the bin width.
- You can override ggplots internal binwidth using `binwidth = *<n>*`.
- You can do the same with the bandwith of a density plot: `bw = *<n>*`.
- Boxplot is based on the 1st, 2nd, and 3rd quartiles.
- `facet_grid()` can help us understand 3 variables.
- There can be an issue with labels when you use `facet_grid()`.
- To solve this, use `labeller = label_both`.

# Numerical Summaries
- Measures of Center:
	1. Mean.
	2. Median.
	3. Mode.
- The mean is sensitive to outliers.
- The median is resistant to outliers.
- The mode is the hightest set of counted values.
- Meausure of Variablility:
	1. Variance.
	2. Standard Deviation.
	3. Interquartile Range.
- The shape of a distribution can be described by the modality and the skew.
- Transformations can help hightlight underlying patterns missed due to the large values.
- The last feature is outliers.

# Case Study
- "Zero Inflation" is a common feature in data analysis.
- Strategies:
	1. Analysis the groups separately.
	2. Treating zero vs non-zero as categorical.

# Research

# Reference