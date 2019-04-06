# Writing Efficient Python Code
## Logan Thomas

# Foundations for Efficiencies
- Most of your time should be spent on making meaningful insights.
- We're going to learn:
  * how to write clean, fast and efficient code.
  * How to Profile your code for bottlenecks.
  * How to eliminate bottlenecks and bad design.
- **Efficient** means that code has a fast runtime and allocates minimal resources.
- Python comes with a focus on Readability.
- Code that follows Python best practices is called **Pythonic** code.
```python
# Print the list created by using list comprehension
best_list = [name for name in names if len(name) >= 6]
print(best_list)
```
- Python's built-ins have been optimized to work quickly within python.
- The function `range()` is exclusive; meaning a paramater `11` will give the list `[0, ..., 10]`.
- To create a list of indexed items from a list, use the function `enumerate( <list> )`.
- You can also tell it to skip values and start later using the parameter `start=<n>`.
- You can use a function on all values in a list using the function `map()`.
- **Lambda Functions** are also called **Anonymous Functions**.
```python
# Create a new list of odd numbers from 1 to 11 by unpacking a range object
nums_list2 = [*range(1,12,2)]
print(nums_list2)
```
```python
# Unpack an enumerate object with a starting index of one
indexed_names_unpack = [*enumerate(names, 1)]
print(indexed_names_unpack)
```
- NumPy arrays are memomry efficient versions of Python's lists.
- You can check the type of a numPy array using `<arrrayName>.dtypes`.
- Python lists do not support broadcasts while numPy does.
- NumPy Arrays also support boolean indexing.


# Timing and Profiling Code
- We care about the runtime because that allows us to select the optimal coding performance.
- To compare runtimes, we need to be able to compute the runtime.
- **IPython** comes with some handy magic commands that allow us to do this.
- Magic commands are enhancements on top of normal Python syntax.
- These commands re prefixed with the `%` symbol.
- You can see a list of all of them using `%lsmagic`.
- To time the code, you can simply append `%timeit` in front of the code.
```python
%timeit rand_nums = np.random.rand(1000)
```
- You can also pass parameters to control how many runs and loops there are.
```python
# two runs and 10 loops
%timeit -r2 -n10 rand_nums = np.random.rand(1000)
```
- You can tell it to run the whole block as opposed to just the line using `%%` instead.
- You can also tell it to save the results to a variable using the `-o` parameter passed to `%timeit`.
- Then, you can analyze the results:
```python
times.timings # for all runs.
times.best    # for the best run.
times.worst   # for the worst run.
```
- You can create data structures using **Formal Names** which are actually calling the type's function.
- Or, you can use **Literal Syntax** which allows you to select the structure without calling the function.
  - This is jsut syntactic sugar that calls the *formal name* underneath.
- Using the literal syntax is actually faster than formal declaration.
- The advantage of a **Code Profiler** is that it gives us access to the individual duration of function calls.
- We'll be using the package *line_profiler* for this class.
- You will need to install it separately using `python -m pip install line_profiler`.
- To use it, we'll need to load it into our session using `%load_ext line profiler`.
- Now we can use the function call `%lprun` to collect that information.
- The syntax for this means:
  * `-f` for function.
  * Then the name of the function to profile.
  * Finally, the exact function call.
```python
%lprun -f convert_units convert_units(heroes, hts, wts)
```
- Now we'll move on to how to measure the memory footprint.
- There is a quick and dirty function `sys.getsizeof( <object> )`.
- We will be using the package *memory_profiler* to do this.
- You'll need to import it like before.
- `%mprun` can only be run on functions with physical files.
- Once it's in a file, you can import it and then run it:
```python
%load_ext memory_profiler
%mprun -f convert_units convert_units(heroes, hts, wts)
```


# Gaining Efficiencies

# Basic Pandas Optimizations

# Research:

# Reference:
