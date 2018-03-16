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
- The **Dask Dataframe** is a *delayed* version of the Numpy Panda array.
- It is nomenclature to use `import dask.dataframe as dd`.
- There is significant overlap in functionality of *dask* and *numpy*.
- Remember that the real difference is that dask functions are all lazy.
- Therefore, it can reference more data than what fits in memeory.
- Dask read functions accept **Glob Patterns**.
- You can create *generator* that can be used for comparisons.
```python
is_wendy = (transaction['names'] == 'Wendy')
wendy_amounts = transactions.loc[is_wendy, 'amount']
```
- Some features of panda are not available yet: compressed and excel files via version 0.15.
- You can groupby with python using `obj.groupby('<value>')`.
- Two important questions about *Big Data*:
  1. Does your data fit into RAM?
  2. Does your data fit on disk?
- *IPython* has the magic term `%time` to track the runtime of a command.


# Working with Dask Bags for Unstructured Data
- You will import **Dask Bags** using `import dask.bag as db`.
- The function `db.from_sequence( <list> )`. to create a bag.
- It's designed to work with mostly unstructured data.
- The function `db.read_text()` reads a file or more than one file into a *Dask Bag*.
- You can use the function `.take()` to inspect the contents of the bag.
- I'm used to working with *globs*; it's sort of like pythons way of matching regex to files.
- In Python, Functions are **First Class** data; meaning that functions can accept functions.
- This allows us to use functions like:
  * Map.
  * Filter.
  * Reduce/Aggregation.
- `map` uses lazy evaluation so you will need to encapsulate it with `list(<output>)`.
- You can use `.map()` on *Bags*.
```python
# Convert speeches to lower case: lower
lower = speeches.str.lower()

# Filter lower for the presence of 'health care': health
termResults = lower.filter(lambda s:'term' in s)

# Count the number of entries : n_health
termCount = termResults.count()

# Compute and print the value of n_health
print( termCount.compute() )
```
- You can work with json in python using the `import json` package.
- You can read the json object using `json.load( <target> )`.
- Sometimes json files will contain an object per line and you will need to treat each line instead of the full file.
- *Bags* has a function called `.pluck('<key>')` which will search and pull out a select item.
```python
read_globs = db.read_text('folder/files*.json')

loads_json_files = read_globs.map(json.loads)

first_item = loads_json_files.take(1)[0]

# Print the keys of first_bill
print( first_item.keys())
```

# Case Study: Analyzing Flight Delays
- 



# Research:

# Reference:
