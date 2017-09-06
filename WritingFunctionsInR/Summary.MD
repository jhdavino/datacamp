# Writing Functions in R
## Hadley Wickham
## Charlotte Wickham

# A Quick Refresher
- Parts of functions:
  1. function declaration
  2. arguments to function
  3. Body of the function
  4. name of function
- You can delcare a default argument using `y = 1`
- pass by name, pass by position.
- three components of a function:
  1. the format arguments
  2. the body
  3. the environment
- `formals()` to seee formal arguments to function
- `body()` to see body of function
- `environment()` to display running environment for function
- The last evaluated expression is returned.
- Calling return will stop function; used for efficiency.
- Can create functions without a name; called anonymous functions.
- These are defined by simply not assigning them to a varianble.
- Functions are normal R objects
- Scoping describes how R looks up values by name
- Calling a funtion creates a new environment for variables
- If it does not exist in current envir, then look up one environment
- Scoping describes where, not when
- Never write functions that depend on global variables; more complicated than that.
- Lookup by name works in functions.
```r
	c = 2
	c(c = c)
```
- c is used as function, name, and variable here.
- Each time function is called, it gets new envir
- `exists()` accepts a string and returns whether true.
- There are two types of Data Structures:
  1. Atomic Vectors:
  	1. Logical.
  	2. Integer.
  	3. Double.
  	4. Character.
  	5. Complex.
  	6. Raw.
  2. Lists: which are recursive.
- Every vector has two key properties: type [ `typeof()` ] and length[ `length()` ]
- R represents missing values differently whether inside a vector or a missing vector itself.
- NULL is used for missing vector; has length 0.
- NA is used for missing valeus in a vector; has length 1; type logical.
- Missing values are contagious; ie. they overrride all operators.
- Lists can contain heterogeneous objects
- Created with `list()`
- Subset using [, [[, or $.
- [ extracts sublist
- [[, $ extract elements.
- For loops are used for iteration, Obv.
- Three parts common to all For Loops
  1. Sequance.
  2. Body.
  3. Output.
- Double brackets work on dataframes since they're just lists in reality.
-`seq_along()` to create vector from 1 to ncol( df )

# When and How You Should Write a Function
- Algorithm of creating function.
  1. Identify problem.
  2. Get data.
  3. Create working snippet of solution.
  4. Rewrite the snippet using temporary variables.
  5. Analyize to simplify.
  6. FUNCTUN SUCES!
- Functions should be correct and readable.
- Use consistent naming conventions
- Avoid using reserved words and base function names.
- `my_awesome_function()` is best name // sarcasm.
- Data arguments should always come first, by convention.
```
  for (i in seq_along(df)) {            
    output[[i]]<- median( df[[i]])
  }
```
- output will auto-return itself at the end.
- Functions can be passed to functions as well.

# Functional Programming
- purrr Package is awesome.
- map functions take .x vector, .f for functions.
- There is one map function for each atomic vector `map_*()`.
- Passing dataframe to map will ierate over the columns of dataframe.
- Passing list to map will iterate over each element in the list.
- Passing vector to map will iterate over each element in the vector.
- You can pass arguments after .x and .f
- .f Can be an anonymous function.
- `~sum( is.na( . ))` is a formula where '.' is used to replace .x
- Using `"a"` will subset out ONLY 'a' when passed to map_*()`.
- `split(.x, .fa)` takes a class of factors and splits the data into lists conditional on .fa.
- You can use formulas in place of functions.
```r
map( cyl, ~ lm(.$mpg ~ .$wt, data = .$df) )` keeping for reference.
```

# Advanced Inputs and Outputs
- Wrapping function in `safely()` will ensure that function returns both results and errors
- `safely()` always returns a list split into two parts: result and error.
- `possibly()` will be similar to `safely()` but can be passed a default value.
- `quietly()` will collect all output from function.
- `map2()` allows one to use .x AND .y to iterate over; uses position of args.
- `pmap()` can iterate over any n lists;
- `pmap()` should contain .l, which is the list of lists
- `invoke_map()` can iterate over both variable args AND variable functions
- .f should come first in `invoke_map`
- `walk()` allows you to make computations without returning a value.

# Robust Functions
- R is for both interactive analysis and Programming.
- This results in a tension between the two uses.
- Three main problems
  1. Type unstable outputs.
  2. Non-Standard Evaluation of input.
  3. Global Options impact commands.
- `stopifnot()` is what you want to clean exits of improper inputs.
- `stop( 'information to pass', call. = FALSE)` will do something similar.
- `.call` specifies if the function call should be returned as well. 
- A function that has no side effects is called pure.
- The apply functions are not type-secure.
- Non-Standard Evaluation are functions that don't use the normal lookup rules.
- You CAN use non-standard evaluatig functions, but be careful not to pass globals into them.
- Pure functions have two aspects:
  1. Output only depends on input.
  2. They don't affect anything outside of themselves.
- Hidden arguments are those that affect what the function does, but you didn't insert them: ie. default args.
- The worst kind are hidden inputs dependant on global options.
- You can find global options by calling `options()`
- You can get an option using getOption( [string ])
- Set options using `options( arg = value )`

## Research
- Raw vectors?
- substitute()?
- Metaprogramming?  

## Further Reading.
