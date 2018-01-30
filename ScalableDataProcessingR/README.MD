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

# Working with iotools

# Case Study: A Preliminary Analysis of the Housing Data

# Research:

# Reference:
