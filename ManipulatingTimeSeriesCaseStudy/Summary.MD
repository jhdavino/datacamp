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

# Economic Data

# Sports Data

# Research:

# Reference:
