# Scalable Data Processing in R
## Michael Kane
##

# Working with Increasingly Large Datasets.
- Expectations:
  * Work with data too large for your own computer.
  * Write Scalable code.
  * Import and process data in chunks.
- All objects are stored in RAM in R.
- "R is not well-suited for working with data that exceeds 10-20% of working RAM."
- **Swapping** will slow down the computer - and thus the calculations.
- We will use the package *microbenchmark* to benchmark running code.
- You call the function by passing code to test in sequential order:
```r
microbenchmark( rnorm( 1000), rnorm( 100000 ))
```
- The package *bigmemory* is used to store, manipulate, and process big matrices that may be larger than RAM.
- **out-Of-Core** computing is when you only move data to RAM when you're going to use it.
- A *big.<item>* keeps the data on disk and only moves it to RAM when needed.
- Since it's implicit, users don't have to worry about running functions to access it.
- When read, it breaks the file into:
  1. Backing File: Binary version of data.
  2. Descriptor File: how to load the data.
- If you want to see the actual data, then you'll need to use the format `x[,]` otherwise you'll get metadata.
- You can read a file into it using `read.big.matrix()` with the format below:
```r
read.big.matrix( "<filename>",
                 type = "<char|integer|double|short>",
                 backingfile = 'name.bin',
                 descriptorfile = 'name.desc')
```
- Once the conversion is done, you can simply link the bin,desc files and you're up again.
- You import it using `attach.big.matrix( "<desciptor_file>")`.
- Otherwise, they function exactly like R matrices.
- There are packages, such as *biganalytics*, designed around using big.matrix.
- Big.matrix use shallow copies and if you want a deep copy then you need to use `deepcopy()`.

# Processing and Analyzing Data with bigmemory
- Lots of packages incoming:
  * *biganalytics* for summaries.
  * *bigtabulate* for tabulating.
  * *bigalgebra* for linear algebra.
  * *bigpca* for principle components.
  * *bigfastLM* for linear models.
  * *biglasso* for lasso and loss functions.
  * *bigrf* for random forest.
- You can create a table using `bigtable(<data>, <column>)`.
- You can also pass more than one name to to columns.
- Abstract model: *Split-Apply-Combine* or in his words *Split-Compute-Combine*.
- You use `split()` to randomly divide or divide on a categorical column.
- We'll be iterating using `Map()`.
```r
missing_by_year <- Map(
    function(x) col_missing_count( df[x, ]),
    year_splits )
```
- We then combine them using `Reduce( f, <df>)`.
- The package *ff* is better suited to data like a dataframe whereas *bigmemory* is better for matrices.
- If you're going to extend, create rows or columns then you can't really use *big.matrix* without some external considerations.

# Working with iotools

# Case Study: A Preliminary Analysis of the Housing Data

# Research:
* Intels Math Kernel Library

# Reference:
