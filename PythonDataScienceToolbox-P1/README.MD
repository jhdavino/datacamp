# Python Data Science Toolbox, Part 1
## Hugo-Bowne Anderson

# Writing your Own Functions
- You can define your own functions.
- The parts are the:
  * **Header**: function definition.
  * **Body**:
  * **Parameters**:
- **Docstrings** are used to describe what your function does.
- A **Tuple** is similar to a list but in that you cannot modify values.
- You can access both *list* and *tuple* values using **Zero-indexing**.
- You can unpack a tuple by simply putting the names on the left, and the tuple on the right.
  * The number of values must match.


# Default Arguments, Variable-length Arguments and Scope
- Not all objects are accessible everywhere in a script.
- Scopes:
1. Global: defined in a script.
2. Local: defined inside a function.
3. Built-in: defined in the built-ins module.
- You can set a variable to global using the keyword `global`.
- You can import the `builtins` module.
- If a function is defined inside another function, then it can search the **Enclosing Function**.
- The inner function is called a **Nested Function**.
- You can pass functions around in Python.
- You can use the keyword `nonlocal` to update variables in scopes above it - but not global.
- You can assign a default value to a parameter in the function definition using `parameter=<value>`.
- The notation `*args` is a stand in for all the arguments passed.
- The notation `**kwargs` is a stand if for all key,pair arguments passed.
- Then, you iterate over the keys using:
```python
for key,value in kwargs.items():
  #...
```


# Lambda Functions and Error-Handling
- 


# Research:

# Reference:
