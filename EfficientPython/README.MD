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

# Gaining Efficiencies

# Basic Pandas Optimizations

# Research:

# Reference:
