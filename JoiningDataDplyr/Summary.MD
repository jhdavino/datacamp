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
- `semi_join(..)` only collects the the results that have confirmed matches in the second dataframe.
- It can be easier and faster to create a semi_join that a chaining set of filter statements.
- *Anti-joins* do the opposite of semi_joins.
- Dplyr supports set operations as well:
	1. union    : unique which exists in either.
	2. intersect: unique which exists in both.
	3. setdiff  : unique which exists in the first, but not the second.
	4. setequal : boolean whether both sets are the same, ignoring order.
- Don't try this with indentical since it checks order.