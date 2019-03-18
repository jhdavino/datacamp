# Pandas Foundations
## Hugo Bowne-Anderson

# Data Ingestion & Inspection
- Pandas is a tool for data Analysis
- The *power tool* of Pandas is the **Data Frame**.
- It is a tabular data structure with labeled rows and columns.
- Rows are ordered using what is called an **Index**.
- There are some accessible values:
  * `.shape` tells you the dimensions of the dataframe.
  * `.columns` tells you the column names.
  * `.index` are the actual row indexes.
- You can slice the values by specifying the rows, columns and stride of the data.
```python
# rows 0:4; all columns
df[:5,:]
```
- You can tell it to only collect every `n` rows using: `.iloc[::<n>,]`.
- You can use the function `.head()` to return just the top rows of the dataframe.
- If you don't pass it a number, it will return 5 rows.
- You can use the function `.tail()` to return the last 5 rows of the dataframe.
- You can use the function `.info()` to return information about all the columns.
- You can broadcast values.
- The columns themselves are their own kind of datastructure called a **Series**.
- You can get the values of a *series* using the `.values` accessor.
- You can convert a dictionary into a Dataframe using the function `pd.DataFrame()`.
- It is useful to be able to create data frames from lists since they're so common in python.
- You can create a new column and **Broadcast** the default value to all values:
```python
# this will add a new column called fees and assign the value 0 to them:
users['fees'] = 0
```
- Broadcasting is not limited to only numbers.
- You can rename the columns of a Dataframe by simple assignment.
- You can tell Pandas that there are no headers using the parameter `header=None`.
- You can label the names by passing a list of names to `names = <list.` in the function `pd.read_csv()`.
- You can replace known missing values with `NaN` by passing `na_values = '<term>'`.
- You can also pass a dictionary with the `column:values` pair since different columns can use different values to mean missing.
- You can explicitly tell Pandas which columns are dates using the parameter `parse_dates=[]`.
- You can use the function `.to_csv(<data>)` to write the data to disk.
- You can save to xlsx using the function `.to_xlsx(<data>)`.
- Plotting is done with the *matplotlib* library.
- There is a `.plot()` that is associated with a numpy Series object.
- You will still need to call `plt.show()` to have it shown.
- You can modify the plot style using:
  * `color` for the color.
  * `style` for what kind of line.
  * `legend` for whether to show them or not.
- You can control the graph's axis using the `.axis()` function.
- You can save the file image to disk using the function `.savefig('name.jpg')`.
- It will also infer the type you want from the name you have told it to save as.
```python
# Plot just the Dew Point data
column_list1 = ['Dew Point (deg F)']
df[column_list1].plot()
plt.show()

# Plot the Dew Point and Temperature data, but not the Pressure data
column_list2 = ['Temperature (deg F)','Dew Point (deg F)']
df[ column_list2 ].plot()
plt.show()
```


# Exploratory Data Analysis

# Time Series in Pandas

# Case Study: Sunlight in Austin

# Research:

# Reference:
