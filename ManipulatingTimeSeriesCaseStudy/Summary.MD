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

# Sports Data

# Research:

# Reference:
