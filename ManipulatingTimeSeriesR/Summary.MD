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

# Mergining and Modifying Time series

# Apply and Aggregate Time

# Extra features of xts

# Research
# Reference