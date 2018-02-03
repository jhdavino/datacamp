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
dataTable[ mpg > 20,                              // only rows where mpg > 20
            .(AvgHP = mean(hp),                 // return computed column named AvgHp
            	"MinWt(Kg)" = min( wt*453.6)    // return computed column named MinWt(Kg)
            ),
            by = .(cyl, under5Gears = gear < 5) // grouping via cyl and computed Column under5Gears
    ]
```

- "Take DT, subset the rows by i, calculate j and group by by".
- Data.table will automatically recycle if there are not enough values.
- R will cache unique string values in the global cache.
- Subsetting works as per normal.
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


## SQL Like Behavior
- `set( data.table, row, column, value)` to update by reference.
- `setnames()` can be used to update column names by reference.
- `setcolorder()` will reorder the order of columns by reference.

- You can do boolean comparisons inside the i clause.
- Data.table will auto-update the table with an internal index so that when you're submitting again it will be faster.
- Data.table also allows you to manually select the column used for the index to speed up functions and searching.
- Do this using `setkey( DT, column_name)` 
- This also allows the default column to search as the index you specify.
- You can also pass `multi = "first"` or `multi = "last"`
- Lastly, you can also pass multiple search terms when an index is declared.
- If a term is not found, it will return NA; override this behavior using `, nomatch = 0`

- Multiple keys can be selected as indexes.
- Using `roll = TRUE` will cause Data.table to use the value before where the gap in values is.
- Using `roll = 'nearest` will cause Data.table to use the value closest to the gap between two values.
- If you want Data.table to always roll a single direction, then use `roll = +Inf` or `roll = -Inf`.
- You can use `key( DT )` to find what the current key is set to.


## Research
- None.

## Reading List:
- None.