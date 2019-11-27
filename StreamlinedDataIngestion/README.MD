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
- Spreadsheets are sometimes called Excel files.
- These are also arranged in tabluar fashion.
- Pandas will not import Spreadsheet formatting.
- Reading them is the same as csvs but with a different function: `pd.read_excel()`.
- While reading them can be easy, formatting intended for human will complicate the process.
- They arguments from `pd.read_csv()` are mostly the same but can behave differently.
```python
# Create string of lettered columns to load
col_string = "AD,AW:BA"

# Load data with skiprows and usecols set
survey_responses = pd.read_excel("fcc_survey_headers.xlsx",
                        skiprows = 2,
                        usecols = col_string)

# View the names of the columns selected
print(survey_responses.columns)
```
- It is fairly common for spreadsheets to contain multiple worksheets.
- By default, it will only pull data from the 1st worksheet.
- This can be changed with `sheet_name` parameter.
- You can pass a name, a number or a list of either kind.
- All arguments, are applied to all worksheets.
- If you want to read all the worksheets, then just pass `sheet_name=None`.
```python
# Create df from second worksheet by referencing its position
responses_2017 = pd.read_excel("fcc_survey.xlsx",
                               sheet_name = '2017')

# Graph where people would like to get a developer job
job_prefs = responses_2017.groupby("JobPref").JobPref.count()
job_prefs.plot.barh()
plt.show()
```
```python
# Create an empty data frame
all_responses = pd.DataFrame()

# Set up for loop to iterate through values in responses
for df in responses.values():
  # Print the number of rows being added
  print("Adding {} rows".format(df.shape[0]))
  # Append df to all_responses, assign result
  all_responses = all_responses.append(df)

# Graph employment statuses in sample
counts = all_responses.groupby("EmploymentStatus").EmploymentStatus.count()
counts.plot.barh()
plt.show()
```
- Boolean values only have two possible values: True or False.
- You can conform the true or false values found using `true_values` and `false_values`.
- Each will accept a list of possible values.
- For NAs, you'll need to make a judgment call based on the data itself.
```python
# Load file with Yes as a True value and No as a False value
survey_subset = pd.read_excel("fcc_survey_yn_data.xlsx",
                              dtype={"HasDebt": bool,
                              "AttendedBootCampYesNo": bool},
                              false_values = ['No'],
                              true_values = ['Yes'])

# View the data
print(survey_subset.head())
```
- Datetimes will can be translated into many string representations.
- By default, pandas loads datetime as objects.
- We use the parameter `parse_dates` to specify the columns with dates in them.
- This will only work for formats that pandas understands.
- If this happens, then use `pd.to_datetime()` afterwords to correct it.
```python
# Load file, with Part1StartTime parsed as datetime data
survey_data = pd.read_excel("fcc_survey.xlsx",
                            parse_dates = ['Part1StartTime'])

# Print first few values of Part1StartTime
print(survey_data.Part1StartTime.head())
```
```python
# Create dict of columns to combine into new datetime column
datetime_cols = {"Part2Start": ['Part2StartDate', 'Part2StartTime']}


# Load file, supplying the dict to parse_dates
survey_data = pd.read_excel("fcc_survey_dts.xlsx",
                            parse_dates = datetime_cols)

# View summary statistics about Part2Start
print(survey_data.Part2Start.describe())
```
```python
# Parse datetimes and assign result back to Part2EndTime
survey_data["Part2EndTime"] = pd.to_datetime(survey_data["Part2EndTime"],
                                             format="%m%d%Y %H:%M:%S")

# Print first few values of Part2EndTime
print(survey_data.Part2EndTime.head())
```


# Importing Data from Databases

# Importing JSON Data and Working with APIs

# Research:

# Reference:
- Reference to time strings: [strftime.org](strftime.org)
