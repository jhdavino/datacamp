# Cleaning Data in Python
## Daniel Chen

# Exploring Your Data
- **Cleaning Data** is the process of preparing your data for analysis.
- There are some common data problems:
  - Inconsistent Column Names.
  - Missing Data.
  - Outliers.
  - Duplicate Rows.
  - Untidy.
  - Column Types Signal unexpected data values.
- Always import the Pandas library via normal nomenclature.
```python3
import pandas as pd
```
- You read in the data using the function `pd.read_csv()`.
- You can visually inspect the first and last 10 entries using `df.head()` and `df.tail()`.
- You can see the columns using `df.columns`.
- You can see the dimensions using `df.shape`.
- You can get generic information about the object using `df.info()`.
- You can get the frequency of items in a column using: `df.<column>.value_counts(dropna=False)`.
- This will also work with bracket notation.
- Another thing to check is Summary Statistics about the values in numeric Columns.
- Bar plots are for discrete data; Histograms for continuous data.
- You can plot the data using `df.<column>.plot('hist')`.
- You will need to have matplotlib imported using `import matplotlib.pyplot as plt`.
- You can filter as well:
```python3
df[df.population > 1000000000 ]
```
- Boxplots can visualize basic summary statistics for us to use.
- This is created using `df.boxplot(column ='population', by='continent')`.
- Always remember to call `plt.show()` to draw the plot.
- Scatterplots are relationships between 2 numeric variables.


# Tidying Data for Anaylsis

# Combining Data for Analysis

# Cleaning Data for Analysis

# Case Study

# Research:

# Reference:
