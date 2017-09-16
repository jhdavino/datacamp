# Introduction to R for Finance
## Lore Dirick

# The Basics
- Going to learn:
  * Basics of R
  * Data Structures
  * Finance
- Insert Basics about using Website..
- Variables are containers.
- I know how to create variables.
- `%%` for modulo in R.
- *Returns* is the money that you get back from investing.
- I'm aware of data types in R; Numeric, Character, Integers, Logicals
- `class()` tells you what the data type is.

# Vectors and Matrices
- A **Vector** is a collection of data that is all the same type.
- `c()` stands for combine, not concatinate.
- `is.vector()` will return a logical about whether the object is a vector.
- You can add names to a vector using `names()`.
- The heirarchy of vector types is logical < integer < numeric < character.
- I know how the plot function works.
- The names you assign can be used to also look up the index.
- A matrix is a 2D vector.
- `matrix( values, nrow = <n_of_rows>, ncol = <n_of_cols>)`.
- You can alter the fill behavior by passing `byrow = TRUE`; this fills by row first.
- Matrices also only support one type of data.
- I know about `cor()`

# Data Frames
- A **Data frame** is nothing more than a grid of rows and columns containing values.
- The difference between a data frame and a Matrix is that the data frame allows for different types.
- I know how to create a data from.
- You can change the names of the columns using `colnames()`.
- Most ways to acess elements is the same.
- More complicated accessing should use the `subset()` function.
- `subset( dataframe_name, variable == "title")`.
- $100 now is worth more than $100 tomorrow.

# Factors
- **Factors** are classifications of data within a column.
- You can confirm that something is of type factor using `class()`.
- `levels()` will list all the levels from a factor type.
- `cut()` will split a vector up into parts based on `breaks = values`.
- You can order a factor for more control.
- By default, R will order the levels by the alphabet.
- We can allow R to assume that the order present is the correct order and create a factor using `ordered()`.
- To assign the order yourself, pass `ordered = TRUE, levels = c(.., .., ..)` to `factor()`.
- The levels are kept even if you subset the data.
- To ignore them, pass `drop = TRUE` to data frames.

# Lists
- Create a list using `list()`.
- 


# Research:
- How does subset filter so efficiently?
- You can get the first element of a list using `list_name[1]`.
- This returns a list object.
- You can use `[[ ]]` to unlist an object and get its internal representation.
- You can adjust values using `list_name$internal_name <- values`.
- You can remove values using `list_name$internal_name <- NULL`.
- `split()` returns a list object.
- You can keep nesting references in a list by the use of multiple `$` symbols.
- split is useful to deal with a class of problems called **split-apply-combine**.
- You can recombine the list using `unsplit()`.
- You can look at the attributes of an object using `attributes()`.
- You can look at a specific attribute of an object using `attr( object, attr_name)`.

# Reference:

# Research: