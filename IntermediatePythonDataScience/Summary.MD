# Intermediate to Python for Data Science

```
import matplotlib.pyplot as plt
year = [1950, 1970, 1990, 2010]
pop =  [2.519, 3.692, 5.263, 6.972]

# call plot  (x, y)
plot.plot(year, pop)
plt.show()
```

- You can replace `plot` with `scatter` to plot a scatter plot instead.
- `plt.xscale('log')` to adjust the scale of x; probably yscale to adjust y.
- I know what a histogram is.
- `plt.hist()` for histograms.
- `plt.clf()` to clear the visual buffer.

## Plot Building
- Repeat: `plt.{x,y}label( label_name )`
- Labels are not added by default.
- `plt.title( title_name )` to add a label.
- `plt.{x,y}ticks( array_of_values, array_of_tick_labels )` to set ticks on the graph.
- Setting `s = array_of_values` in `plt.scatter()` will scale the point to the values.
- matplotlib reminds me of the base plot in R a lot.
- `col = dict_of_values` can be added to `plt.scatter()` to add color.
- `alpha = [0,1]` can be added to `plt.scatter()` to add opacity.
- `plt.grid(True)` to add gridlines to a plot.



## Pandas
- Data is usually in tabular format.
- High level data manipulation tool.
- Has dataframes.
- Can be created from a Dictionary.
```

```
- Create one using `pd.DataFrame( dictionary_object)`.
- 0 Indexing; not 1.
- Read a csv using `pd.read_csv( path_to_file )`.
- To tell panda headers exist, use `index_col = 0`.
- Change the row labels using `cars.index = list_of_values`.
