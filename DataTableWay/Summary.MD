# Data Analysis in R, the data.table Way
- Matt Howlle created the package in 2008.
- It's focus is reduce programming time first, then reduce compute time second.
- Can do order joins - i.e. SQL like merging of tables.

- Three parts to a data.table command:
	1. The Row
	2. The Column
	3. The Group.

- You can filter directly inside of a data.table command.
```
dataTab[ mpg > 20,                           // only rows where mpg > 20
            .(AvgHP = mean(hp),                 // return computed column named AvgHp
            	"MinWt(Kg)" = min( wt*453.6)    // return computed column named MinWt(Kg)
            ),
            by = .(cyl, under5Gears = gear < 5) // grouping via cyl and computed Column under5Gears
    ]
```

- "Take DT, subset the rows by i, calculate j and group by by"
- Data.table will automatically recycle if there are not enough values.
- R will cache unique string values in the global cache.
- Subsetting works are per normal
- If you don't include a comma when requesting rows, then it will assume you want rows.
- Data.table has classes `data.table` and `data.frame`.
-`.N` will give you the number of rows in that column.
- Returning duplicate rows no longer works.

- You can **chain** data.table calls by including `[ extra_requests ]`

- Data.table has a stand-in for columns called .SD ( Subset of Data ).
- By default, .SD stands in for all columns.
- .SD will not include what is specified in the by clause.
- .SD is only usable in j section.
- SDcols can be used to subset the target columns to apply the function calls to.
- You can create new columns in the by clause when wrapped in `.( )`.

- `:=` is used to add or update columns in a data.table.
- `:=` updates columns by reference.
- Full notation: `DT[, c('x', 'z') := .(rev(x), 10:6) ]`
- Short hand notation: `DT[, x := rev(x) ]
- Removing colums using `:=` and assigned them to `NULL`.
- Data.table treats symbols passed as literals.
- Therefore, to pass a vector of targets to delete you must wrap the symbol in parenthesis.

- `set( data.table, row, column, value)` to update by reference.
- `setnames()` can be used to update column names by reference.
- `setcolorder()` will reorder the order of columns by reference.

- 






## Research

## Further Reading.