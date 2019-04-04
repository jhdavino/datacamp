# Manipulating Time Series Data in R: Case Studies
## Lore Dirick

# Flight Data
- xts objects are an index and value columns.
- Peridicity: "Units of Time in your data"
- Normally, you can plot the xts object using `plot.xts()`.
- You only need to pass one column name to get a plot.
- You can check the peridicity using `periodicity()`.
- You can use `plot.zoo()` with the parameter `plot.type = "multiple"` to plot as panels.
- You can use `plot.zoo()` with the parameter `plot.type = "Single"` to plot as panels.
- You can save the data with it's characteristics using `saveRDS( <data>, file = <filename>)`.
- You can read the data using `readRDS(<filename>)`.
- If you need to work with a coworker who doesn't use R, then use `write.zoo( <data>, file = <filename>, sep = "<,>")`.
- `flights2 <- read.zoo("flights_xts.csv", sep = ",", FUN = as.Date, header = TRUE, index.column = 1)`.

# Weather Data
- Merging xts objects will preserve the order in time.
- Even `rbind()` will allow it to work.
- Before merging data, you're going to want to make sure times match up.
- Subset the data using `name_xts["2010/2015"]`.
- Adjust the peridicity using `to.period( name_xts, period = "months")`.
- Once preliminary work is done, then you can use the `merge()` command to join the data.
- After the merger, you should **always** check the data.
- Make sure the objects are xts before merging.

# Economic Data
- One of the most common problems with time data is **missingness**.
- Most common method to solve is **Last Observation Carried Forward (LOCF)**.
- To replace them use `na.locf( <data> )`.
- Another example is **Next Observation Carried Backwards (NOCB)**.
- To use NOCB, use `na.locf( <data>, fromLast = TRUE )`.
- You can also use linear interpolation using `na.approx( <data> )`.
- `lag()` offsets the observations in time for you datase.

# Sports Data
- You can use `endpoints()` to specify the endpoints per interval.
```r
endpoints( .x,
            on)
```
- You can use `peiod.apply()` as if it's an apply function but per period specified.
```r
period.apply( .x,
              INDEX,
              FUN)
```
- A useful trick is to use the `.index(.x)` command to extract the time values in posix time format.
- You can also check which days off the week an observation falls on using `.indexwday()`.
- This is 0 indexed to Sunday.

# Research:

# Reference:
