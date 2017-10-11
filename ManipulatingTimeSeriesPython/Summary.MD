# Manipulating Time Series Data in Python
## Stefan Jansen

# Working with Time Series in Pandas
- Data series are comprised of date and time information.
- The data represents points in time or periods in time.
- This objects attributes and methods reflect time-related details.
- Thgese are a sequence of dates and periods.
- You will need the `panda` package and the `datetime` package.
- You can create a timestamp object using `pd.Timestamp("<time_string")`.
- These *timestamp* objects come with many internal details; which you can access.
- An example is `timestamp.year` to get the year of the object.
- You can create a period object using `pd.Period("<time_string>")` which uses the month as the default.
- You can change this using `pd.asfreq("D")` to change the period to days.
- You can convert to and from period and timestamp objects using `to_timestamp()` and `to_period()` respectively.
- You can use arithmetic with period objects.
- Periods are imbedded in Timestamp objects.
- You can create a date range using `pd.date_range( start = "<time>", periods = 15, freq = "M")`.
- A general structure for making these time series is `pd.DataFrame( data = data, index = index)`.
- You can see the internals of an object using `.info()`.
- List of Period aliases:
	- H: Hour.
	- D: Day.
	- W: Week.
	- M: Month.
	- Q: Quarter.
	- A: Annual.
- List of attributes:
	- .second
	- .minute
	- .hour
	- .day
	- .quarter
	- .month
	- .year
	- .weekday
	- .dayofweek
	- .weekofyear
	- .dayofyear
- You can transform basic time series.
- You can convert time strings to *datetime64*.
- Select and slice for specific time periods.
- You can set and change DateTimeIndex frequency.
- You can convert time strings to date time using pd.to_datetime( <object> ).
- After, you can change the date objects into and index using `object.set_index('<field_target')`
- There is another parameter passed called `inplace` which tells the function not to copy the column.
- You can subset the dat by passing the piece that you're after: `google['2017']`.
- You can also create a sequence of those dates and it will give you all data in the range, inclusive.
- There is also a period alias for busines day using `B`.
- You can subset and check for missing values using `.isnull()`.
- 

# Basic Time Series Metrics & Resampling

# Window Functions: Rolling & Expanding Metrics

# Putting it All Together: Building a Value-Weighted Index

# Research:

# Reference: