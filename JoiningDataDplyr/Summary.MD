# Joining Data in R with dplyr
## Garrett Grolemund

## Section 1
- Base R comes with the function `merge()` for joining data.
- We're ignoring this function though.
- Dplyr:
	1. Always preserves the row order.
	2. Intuitive to use.
	3. Applicable to DBSM, Spark, etc.
- The job of a join is to find rows that match and make sure they end up together in the resulting data table.
- A **key** is a column, or columns, that you want to join.
- There are two keys:
	1. The Primary Key.
	2. The Foreign Key.
- The most common join is the `left_join( <data1>, <data2>, by = <column_name> )`.
- To use multi-column keys, just pass a vector of multiple values.
- dplyr works with data.frames, tibbles and tbl references: not data.table.
- `right_join(..)` is the same, but in reverse.
- `full_join(..)` includes all data from both tables.
- `inner_join(..)` only includes data that appears in both data sets.

## Section 2
- *Filtering Joins* exist to do the same thing as the filter function from Dplyr.
- They return a copy that has been filtered instead of augmented.
- `semi_join(..)` only collects the results that have confirmed matches in the second dataframe.
- It can be easier and faster to create a semi_join that a chaining set of filter statements.
- *Anti-joins* do the opposite of semi_joins.
- Dplyr supports set operations as well:
	1. union    : unique which exists in either.
	2. intersect: unique which exists in both.
	3. setdiff  : unique which exists in the first, but not the second.
	4. setequal : boolean whether both sets are the same, ignoring order.
- Don't try this with indentical since it checks order.

## Section 3
- dplyr has it's own bind functions:
	1. `bind_rows()`
	2. `bind_cols()`
- `bind_rows()` is similair to `rbind()`
- You can think of `bind_cols` as a lazy join.
- `bind_cols` assumes joining rows are already in order.
- You can mark which datatable the data came from using `bind_rows( datatable1 = <dt_1>, datatable2 = <dt_2>, .id = originalTable )`
- Dplyr also has its own `data.table()` and `as.data.table()` in `data_table()` and `as_data_table()`.
- It avoids the following undesirable behavior:
	1. Wont change string types.
	2. Wont add row names
	3. Wont change column names
	4. Wont recycle vectors greater than 1.
- it also returns a tibble.

## Section 4
- There are four potential problems:
	1. Missing key values.
	2. Duplicate key values.
	3. Missing key columns.
	4. Duplicate key columns

- To remove but retain row names from a dataset use `rownames_to_column( <table>, var = "<col_name>")`
- If column names are different for both datasets then use what is called a **named vector**.
- .. is done via the notation `c("name1" = "name2")`.
- The purrr package contains a function called `reduce()` that allows for recursion.
- dplyr can send commands to an SQL database when passed a connection.

## Section 5
- `$`(dataframe) is a thing; I didn't realize this.
- `distinct(..)` removes all the duplicate rows.
- `count(..)` does the same thing as `tally(..)` but can explicitly group by.
- You can also pass what columns you want to check for uniqueness via `distinct(..)`.
