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
- I know all this already.


# Troubleshooting Lists with purrr
- When you have large lists to iterate over, errors can be hard to manage.
- You can use the function `safely()` to deal with those situations.
- You can pass the parameter `otherwise` to the function `safely()` to control how it behaves with those issues.
```
# Map safely over log
a <- list(-10, 1, 10, 0) %>%
      map( safely(log, otherwise = NA_real_)) %>%
    # Transpose the result
      transpose()
```
- You can find the successes in the item `result`.
- You can find the failures in the item `error`.
- You can tell `safely()` to print errors as it finds them by passing the parameter `quiet = FALSE`.
- Once you have diagnosed the issues with `safely()` you can then use the function `possibly()` to only return results.
- One excellent use of the function `walk()` is to assist with cleaner output to look through.
- You can also build a set of figures and print all of them using `walk( plist, print)`.
```
# Load the gap_split data
data(gap_split)

# Map over the first 10 elements of gap_split
plots <- map2(gap_split[1:10],
              names(gap_split[1:10]),
              ~ ggplot(.x, aes(year, lifeExp)) +
                geom_line() +
                labs(title = .y))

# Object name, then function name
walk(plots, print)
```


# Problem Solving with purrr

# Research:

# Reference:
