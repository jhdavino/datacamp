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

# Aligning Data with Different Periodicities

# Importing Test Data, and Adjusting for Corportate Actions

# Research:
- Federal Reserve Economic Data
- 

# Reference:
- [Quandl](www.quandl.com)
