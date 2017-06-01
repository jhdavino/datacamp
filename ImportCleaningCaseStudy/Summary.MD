# Importing and Cleaning Data: A Case Study
## Nick Carchedi

### Section 1
- `read.csv()`: obv.
- `dim()`: obv.
- `head()`: obv.
- `names()`: obv.
- `str()`: obv.
- `summary`: obv.
- `dplyr::glimpse`: Smart version of str.

```r
sales4 <- separate(sales3,                      // source this
                   event_date_time,             // parameter to split
                   c('event_dt', 'event_time'), // resulting names
                   sep = " ")                   // delimiter
```

```r
sales6<- unite(sales5,            // source this
               venue_city_state,  // unquoted,     column name to merge to
               venue_city,        // ... unquoted, column name to remove to
               venue_state,       // ... unquoted, column name to remove to
               sep = ', ')        // separator to combine with
```