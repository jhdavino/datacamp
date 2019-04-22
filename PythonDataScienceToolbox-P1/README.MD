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
- A **Lambda** function is a function without a name.
- We define one using:
```python
lambda x, y: <what-it-does>
```
- You can do something like:
```python
map( <func>, <target>)
echo_word = (lambda word1,echo: word1 * echo)
```
```python
# Use filter() to apply a lambda function over fellowship: result
result = filter(lambda member: len(member)>6, fellowship)
```
- If your program runs into a problem, then it should throw an error.
- Unlike Web Design, programs should not fail silently.
- We should also write errors that are interpret-able to users.
- Python uses a *try-except* clause for errors.
- In circumstances where we would like to intentionally use the error structure of Python, we can:
```python
if x < 0:
  raise ValueError('x must be non-negative')
```
```python
# Select retweets from the Twitter DataFrame: result
result = filter(lambda x: x[0:2] == 'RT', tweets_df['text'])

# Create list from filter object result: res_list
res_list = list( result )

# Print all retweets in res_list
for tweet in res_list:
    print(tweet)
```


# Research:

# Reference:
