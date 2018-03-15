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
- You can import **Dask** as `from dask.array import da`.
- The function `da.from_array()` will convert a *numpy* array into a **Dask Array**.
- You can control the chunk size using `chunks=len( a // 4)`.
- The `array.chunks` tells you information about the chunks as a tuple.
- Like before, a call to an action `.sum()` will return a non-evaluated dask object.
- Calling `.compute()` on the object will cause the computation to run.
- Most every summation function used by numpy is available with Dask.
- The function `object.mean()` will get you the mean.
- The function `object.std()` will get you the standard deviation.
- The function `np.loadtxt( '<file>.csv', dtype = int64)` to read a csv file.
- The function `np.reshape( (3,7) )` will convert the data to a 3-row by 7-column dataset.
- The parameter `order= 'F'` will have the filling of values by column instead of by row.
- The parameter `axis` controls whether to compute on rows - `0` - or columns - `1` when passed to `mean()`.
- **HdF5** is a hierarchical file store format for storing and managing data.
- To read them, use the **h5py** package.
- You can include it using `import h5py`.
- The function `5py.File( '<filename>')` will read the data from the file.
- The function `nanmin()` will handle missing values for you.
```python
# Import h5py and dask.array
import h5py
import dask.array as da

# List comprehension to read each file: dsets
dsets = [h5py.File(f)['/tmax'] for f in filenames]

# List comprehension to make dask arrays: monthly
monthly = [da.from_array(d, chunks=(1,444,922)) for d in dsets]

# Stack with the list of dask arrays: by_year
by_year = da.stack( monthly, axis = 0)
```
- When you call `.reshape()` it modifies the object so you don't need to assign it to anything.


# Working with Dask DataFrames
- 


# Working with Dask Bags for Unstructured Data

# Case Study: Analyzing Flight Delays

# Research:

# Reference:
