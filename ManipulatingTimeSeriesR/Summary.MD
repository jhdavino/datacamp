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
- The most common way to append data is using `cbind()` or `merge()`.
- They just use the time instead of values
- `merge()` takes n sets of data, `fill` controls how to manage missing data, `join` specifies the type of join.
- `merge()` uses the normal recycling rules.
- To add more rows, you use `rbind()`.
- Two conditions need to be met:
	1. all rows must have a time.
	2. the number of columns must match.
- One way to deal with missing time data is last observation carried forward; l.o.c.f.
- This is done using `na.locf()`.
```r
na.locf( zoo_obj,
		 na.rm = TRUE,     # control values for messages that don't get filled.
		 fromLast = FALSE, # reverses the pull: i.e. taking from value after current.
		 maxgap = Inf      # how many spaces will check behind
)
```
- Other functions include:
	1. `na.full()` to replace NAs
	2. `na.trim()` to remove only if top or bottom of data.
	3. `na.omit()` to remove rows with NA.
	4. `na.approx()` to use linear interpolation to guess the missing value.
- **Seasonality** means the pattern is cyclical.
- **Stationarity** means the pattern stays within some bound.
- `lag()` allows you to shift observations forwards or backwards in time.
```r
lag( xts_obj,
	 k = 1,         # number of lags
	 na.pad = TRUE  # controls NA introduction behavior
)
```
- `diff()` is used to control differences in observations.
```r
diff( xts_obj,
	  lag = 1,           # obv.
	  differences = 1,   # Number of calls to diff
	  arithmetic = TRUE  # how to 
	  log = FALSE        # ?
	  na.pad             # known.
)
```

# Apply and Aggregate Time
- There are two approaches to using apply to periods or intervals:
	1. `period.apply()`.
	2. `split()`
- This functions like the Base R apply functions.
- `endpoints()` uses the `on` parameter to define the interval.
- These can be days, years, etc.
- There are also a set of apply.* functions for:
	1. `.monthly()`
	2. `.yearly()`.
	3. etc.
- `split.xts()` splits data in chunks by time.
- `k` is a parameter for repeating.
- `split()` uses the `f` parameter to act the same as `on`.
- `endpoints()` allows you to cyclically sample from data.
- Open, High, Low and Close; **OHLC**
- This is a summary of the period; calculate:
	1. Start.
	2. Maximum.
	3. Minimum.
	4. Ending.
- `to.peroid()` is used to do this.
```r
to.period(x,
		  period = "months", # like on arg.
		  k = 1,             # repetition value
		  indexAt,           # allows for index alignment
		  name = NULL,       # change the summary stat names
		  OHCL = TRUE        # should this stat be calculated?
)

```
- There are quite a few cumulative functions:
	* `cumsum()`
	* `cumprod()`
	* `cummin()`
	* `cummax()`
- `rollapply()` is to be used on conintuous rolling windows; sort of like incrementing spans.
```r
rollapply(data,                      # xts object
		  width,                     # window size
		  FUN,                       # obv.
		  by = 1,                    # 
		  by.column = TRUE,
		  fill = if(na.pad) NA,
		  na.pad = TRUE,
		  partial = TRUE,
		  align = c("right", "center", "left")
)
```

# Extra features of xts

# Research:
- look ahead bias.
- look behind bias.

# Reference:
