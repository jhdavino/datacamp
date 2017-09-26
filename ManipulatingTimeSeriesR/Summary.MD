#  Manipulating Time Series Data in R with xts & zoo
## Jeffrey Ryan

# Introduction to Extensible Time Series 
- **xts** stands for extensible time series
- The heart of xts is a zoo object.
- zoo objects are comprised of an index + a matrix.
- Which is equal to an observation in time.
- The date index is named **idx** and must actually be a date type object.
- You can use just about any time class for this.
- You create an xts object using `xts( matrix_data, order.by = dates)`
```r
xts( x = NULL,                   # data
	 order.by = index( x ),      # dates
	 frequency = NULL,           # unsure
	 unique = NULL,              # forces date values to be unique
	 tzone = Sys.getenv( 'TZ' )  # get or set the timezone info.
)
```
- Special behavior:
	1. is a matrix with associated times.
	2. subsets preserve matrix structure.
	3. attributes are preserved.
	4. xts is a subclass of zoo.
- `coredata( xts_object )` to get the raw matrix back.
- `index( xts_object )` gives you the dates back.
- Most of the time, using `as.xts()` will convert an object into an xts object.
- You can read a file in as xts using `read.zoo()`.
- You can write the zoo object to file using `write.zoo()`.
- .. `saveRDS()`.
- `tempfile()` will return a random file name to use for misc data.

# First Order of Business
- Supports ISO8601:2004 format.
- This means the left most digit is the most significant.
- Format: "YYYY-MM-DDTHH:MM:SS"
- Supports two sided intervals
- .. truncated representation: "201402/03"
- You can load data from a package using `data(data_name, package = data_package )`
- xts allows you to speficy ranges using `/`.
- Ex: `x["2016/2016-03-22"]`
- `Ta/Tb` allos you to select all days but just the times between the hours of a and b.
- Make sure to include the leading zero in times like *08:00*.
- `which.i` will tell you which rows match instead of returning the values.
- xts uses `drop = FALSE` by default, so hanging labels don't exist.
- Order is always preserved.
- Usually faster than Base R.
- Index and attributes of an xts object are always preserved.
- When using an ISO time range format, make sure to always include the trailing slash; even if you're selecting all values of a date.
- `first()` and `last()` are xts's version of `head()` and `tail()` that support arbitrary time lengths; such as 6 weeks.
- You simply pass "6 weeks" into the `j` field.
- You can next first and last to splice out a very specific time frame.
- `first()`/`last()` also support negative arbitrary time intervals by affixing a - before the expression: `"-2 weeks"`.
- For mathematical operations - or ops - remember that xts is a matrix.
- The operations are **ALWAYS** done on the intersection of two datasets.
- To add time series data on the union, you need a different tool.
- Use `merge(second_xts, index(first_xts), fill = 0)` to prepare the second object for the addition operation.


# Mergining and Modifying Time series

# Apply and Aggregate Time

# Extra features of xts

# Research:
- look ahead bias.
- look behind bias.

# Reference:
