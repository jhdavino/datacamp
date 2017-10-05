# Importing and Managing Financial Data in R
## Joshua Ulrich

# Introduction and Downloading Data
- You can use `getSymbols()` to retreive data from the package `quantmod`.
- Returns an xts object.
- Can import data in two ways:
	1. Return data like an ordinary function.
	2. Return data like the `load()` already does.
- You pass two arguments `Symbols` for the reference and `src` for the source location.
```r
data<- getSymbols( Symbols = 'AARP', src='yahoo')
```
- It uses Yahoo as it's default source.
- You can ask that the data be loaded instead using `auto.assign = FALSE` passed to `getSymbols()`.
- `env` can also be passed to control which frame the data ends up in.
- Quandl is a tool for economic data.
- .. can be used with many languages since it's an API.
- The function and package to access the data is called Quandl.
- .. only returns the data so you will need to assign it to an object.
- .. uses a `code` parameter to retreive data.
- It uses the format "SOURCE/INSTRUMENT".
- You can control the type of object returned using the `type` arguement.


# Extracting and Transforming Data
- *Open, High, Low, Close*: OHLC
	* Open and Close the first and last datum in the data.
	* High and Low are the min and max of the datum.
	* Volume is the sum of all contracts traded.
- You can extract the data from a column using:
	* `Op()`.
	* `Hi()`.
	* `Lo()`.
	* `Cl()`.
	* `Vo()`.
	* `Ad()`.
	* `OHLC()`.
- `getprice()` takes three arguements:
	1. `x` which is the data.
	2. `symbol` which is to filter is >1 symbol in data.
	3. `prefer` which is option prefered price.
- In `Quandl()`, the `collapse` parameter allows you to aggregate on a time level.
- .., the `transform` parameter does statistical analysis.
- Always remember that aggregating occurs before transforms.
- Stat `rdiff_from`, which is a type of transform, compares all data to the latest datum.
- I've learned about `do.call()` the hard way.
- `eapply()` is a function for looping over xts objects.

# Managing Data From Multiple Sources
- `getSymbols()` doesn't contain code to import data.
- Code for this exists in a a source method.
- For example, when you call `getSymbols()` for **FRED** then it calls `getSymbols.FRED()`.
- You can use `setDefaults( getSymbols, src="FRED")` to change the default call to use **FRED**.
- Options are saved per session in `options()`; which is global.
- You can control a mapping from symbol > source using `setSymbolLookup()`.
- To remove the mapping, you can simply assign the symbol to `NULL`.
- You can save the lookup table using `saveSymbolLookup( file = "file_name.rda")`.
- You can load a previous lookup table using `loadSymbolLookup()`.
- Names must be syntactially valid.
- Some names in the Stock Market are not valid; like starting with a circumflex.
- To access names with non-valid names, use backticks.
- You can use `make.names()` to assist in fixing invalid names.
- Ex:`setSymbolLookup(ATT = list(name = "T"))`

# Aligning Data with Different Periodicities
- It is preferable to have regular date-time sequences to work with.
- xts also comes with functions `start()` and `last()` to retreive each respectively.
- **Zero-width** xts objects are xts object with no data but an index.
```r
regular_index<- seq( from = start_date, to = end_date, by = "day")
```
- Most economic data is usually only released monthly or quarterly.
- Use `na.locf()` to fill in missing values.
- It accepts parameter `fromLast = TRUE` to use indexed data from previous observations.
- Be careful about differing time zones since `merge()` will not consider them.

# Importing Test Data, and Adjusting for Corportate Actions


# Research:
- Federal Reserve Economic Data
- 

# Reference:
- [Quandl](www.quandl.com)
