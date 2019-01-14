# Foundations of Functional Programming with purrr
## Auriel Fournier

# Simplifying Iteration and Lists With purrr
- Class is about purrr package.
- For loops are powerful but is where lots of typos show up.
- The *purrr* package puts the iteration into a single function.
- The function `map()` takes two arguments:
  1. `.x` which is a list or vector.
  2. `.f` which is the function to apply to.
- Lists require a different grammar than vectors.
- Lists can store different data types.
- When you use the variants of `map` that include the type, then you can get vectors back.
- For example, `map_dbl()` will return a vector of numbers.


# More Complex Iterations
- The `purrr` package works well with pipes `%>%`.
- You can always set names by using the function `names(<list>)`.
- `map()` makes simulating data simple.
```
bird_measurements %>%
   map_df(~ data.frame(weight=.x[["weight"]],
                       wing_length = .x[["wing length"]]))
```
- When we have to check against multiple datasets, then we can use functions `pmap()` or `map2()`.
```
# Map over the master list
list_of_files_pmap <- pmap(pmapinputs,
  function(sites, means, sigma, means2, sigma2)
    data.frame(sites = sites,
        a = rnorm(mean = means, n = 200, sd = sigma),
        b = rnorm(mean = means2, n = 200, sd = sigma2)))
```



# Troubleshooting Lists with purrr

# Problem Solving with purrr

# Research:

# Reference:
