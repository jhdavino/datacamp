# Streamlined Data Ingestion with pandas
## Amany Mahfouz

# Importing Data from Flat Files
- Pandas was original developed by Wes McKiney in 2008.
- Pandas are two dimensional data; meaning they have columns and rows.
- **Flat Files** are simple and easy to use which makes them popular.
- Data is stored in them as plain text.
- Each line represents a row.
- The Delimiiter is usually a comma: therefore named **CSV** files.
- A single function will read these called `.read_csv()`
```python
import pandas as pd

tax_data = pd.read_csv('<name of the file>')
tax_data.head(4)
```
- If it uses a different delimiter, you can specify it using `sep = '\t'`.
- Now we'll approach how to get only the data that you need from the imported data.
- You can choose the columns by passing the argument `usecols = <list-of-names>`.
- It can even accept a function to filter the column names by.
- You can also limit the number of rows imported using `nrows = <n>`.
- You can also pass along `skiprows` which will tell it what rows to skip while reading.
- This can be:
  1. A number: for number of rows to skip.
  2. A list of numbers: for which rows you want to have skipped.
  3. A Function.
- Pandas uses the first row imported as the header but you can exclude that using `header=None`.
- When imported, there wont be any column names.
- To fix this, assign names using `names = <list-of-names>`.
```python
# Create list of columns to use
cols = ['zipcode', 'agi_stub', 'mars1', 'MARS2', 'NUMDEP']

# Create data frame from csv using only selected columns
data = pd.read_csv("vt_tax_data_2016.csv", usecols = cols)

# View counts of dependents and tax returns by income level
print(data.groupby("agi_stub").sum())
```
```python
# Create data frame of next 500 rows with labeled columns
vt_data_next500 = pd.read_csv("vt_tax_data_2016.csv",
                       		  nrows=500,
                       		  skiprows=500,
                       		  header=None,
                       		  names = list(vt_data_first500))

# View the Vermont data frames to confirm they're different
print(vt_data_first500.head())
print(vt_data_next500.head())
```
- If the data is not clean, then we'll need to worry about it and fix this.
- When importing data, pandas infers the datatype and sometimes guesses wrong.
- We can set the datatype using `dtype` which is a dictionary of column name, type pairs.
- Pandas can automatically interpret and replace some missing values but you can also specify them.
- You can specify those with `na_values`.
- Those can be passed as a single value, a list or a dictionary of columns,value pairs.
- However, sometimes there is just something wrong with the line itself and wont be able to be read.
- You can override this behavior using `error_bad_lines` and `warn_bad_lines`
- When you set `error_bad_lines=False` then it will skip lines that cannot be parsed.
- When you set `warn_bad_lines=True` then it will print warnings when it skips those lines.
```python
# Create dict specifying data types for agi_stub and zipcode
data_types = {"agi_stub":'category',
			  'zipcode':'str'}

# Load csv using dtype to set correct data types
data = pd.read_csv("vt_tax_data_2016.csv", dtype = data_types)

# Print data types of resulting frame
print(data.dtypes.head())
```
```python
# Create dict specifying that 0s in zipcode are NA values
null_values = {'zipcode':0}

# Load csv using na_values keyword argument
data = pd.read_csv("vt_tax_data_2016.csv",
                   na_values=null_values)

# View rows with NA ZIP codes
print(data[data.zipcode.isna()])
```
```python
try:
  # Set warn_bad_lines to issue warnings about bad records
  data = pd.read_csv("vt_tax_data_2016_corrupt.csv",
                     error_bad_lines=False,
                     warn_bad_lines=True)

  # View first 5 records
  print(data.head())

except pd.io.common.CParserError:
    print("Your data contained rows that could not be parsed.")
```


# Importing Data From Excel Files

# Importing Data from Databases

# Importing JSON Data and Working with APIs

# Research:

# Reference:
