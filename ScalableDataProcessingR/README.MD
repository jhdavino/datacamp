# Scalable Data Processing in R
## Michael Kane
## Simon Urbanek

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
- If you want to use something more akin to a dataframe or split it across machines, then use *iotools*.
- It does this by processing data chunk by chunk.
- There are two ways to process chunks:
  1. Sequential.
  2. Independently.
- Some things simply don't fall into this model of **Split-Compute-Combine**.
- Chunk-Wise Processing:
  1. Load the data.
  2. Convert to native objects.
  3. Perform Computation.
  4. Store Results.
- It often takes more time to load data than it does to process it.
- There are two methods to read data in *iotools*:
  1. `readAsRaw()` will import into vector.
  2. `read.chunk()` will need an `<n>` to chunk on.
- The function `msstrplit()` converts raw data into a matrix.
- The function `dstrsplit()` converts raw data into a data frame.
- The function `file("<filename>", "rb")` will open a connection to the file in question on disk.
- The function `readLines(<conn>, n = <lines>)` will read the `n` number of lines from the file.
- The function `close(<conn>)` will close a connection object.
- The package *iotools* is the basis of the package *hmr* which allows processing on Hadoop.
- The function `chunk.apply()` is meant to iterate over a file and make computations via chunks.
- An example format:
```r
chunk.apply(
  '<file>',
  function( chunk ){}, # must be chunk!
  CH.MAX.SIZE = 1e5, # maximum size of the chunks in bytes
  parallel = 2 # optional: how many processors will do work?
)
```
- Increasing the number of processing does not grant linear gains in performance.
- The parameter `parallel` doesn't work on Windows.

# Case Study: A Preliminary Analysis of the Housing Data
- Example of iotools:
```r
race_table_chunks <- chunks.apply(
  "<filename>",
  function( chunk ){
    x <- msstrplit(chunk, sep = ',', type = 'interger')
    colnames( x ) <- mort_names
    table(x[, 'borrower_race'])
  },
  CH.MAX.SIZE = 1e5
)
```
- Missing Data falls into three categories, in general:
  1. Missing Completely at Random.
  2. Missing at Random.
  3. Missing Not at Random.
- To check for Missing at Random:
  1. Recode a column if data is missing or not: 1 vs 0.
  2. Regress other varaibles onto it using logistic regression.
  3. If p-value significant, then indicates MAR.

# Research:
* Intel's Math Kernel Library?

# Reference:
