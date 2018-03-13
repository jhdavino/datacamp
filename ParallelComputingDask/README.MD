#  Parallel Computing With Dask
## Dhavide Aruliah
## Matthew Rocklin

# Working with Big Data
- **Big Data** is more data than a single machine can handle.
- I remember about Computer hardware.
- The relative procesing time when data jumps from RAM to HDD is massive and slow.
- We'll be using packages `psutil`, `os`.
- To get the memory used by the process use the expression `psutil.Proces( os.getpid()).memory_info.rss`
- You can get the memory usage of the dataframe with `.memory_usage()`.
- You can get the dimensions of a chunk using `chunk.shape`.
- The function `chunk.info()` will tell you basic information about the object.
```
# Create empty list: dfs
dfs = []

# Loop over 'data.csv'
for chunk in pd.read_csv('data.csv', chunksize = 1000):
    # Create the first Series
    is_index = chunk['Column_Name']== Condition

    # Create the filtered chunk: filtered
    filtered = chunk.loc[ is_index ]

    # Append the filtered chunk to the list dfs
    dfs.append( filtered )
```
- Breaking data into chunks can help alleviate problems caused by large datasets.
- **Generators** are similar to list comprehensions but use lazy evaluation.
- You can build a *generator* a similar notation to list comprehensions:
- `( filter_long_trip( chunk ) for chunk in pd.read_csv( filename, chunksize=1000) )`.
- No reading or working is done until a function is called on the generator.
- The built generator is deleted after the iteration is run.
- We can delay a function's running using `delayed()`.
- You load this using `from dask import delayed`.
- You will need the declaration to be `y = delayed(z)(x)` since it is a decorator.
- it delays the function until `.compute()` is called.
- The function `.visualize()` will display a task graph - or DAG - of the running function.
- If you remove the `(x)` from the `delayed()` declaration, then it will be forever of return type `dask.delayed.Delayed`.
- You can also declare it using the `@delayed` syntax.


# Working with Dask Arrays

# Working with Dask DataFrames

# Working with Dask Bags for Unstructured Data

# Case Study: Analyzing Flight Delays

# Research:

# Reference:
