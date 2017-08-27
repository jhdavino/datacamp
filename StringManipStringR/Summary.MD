# String Manipulation in R with stringr
## Charlotte Wickham

# String Basics
- stringr was built for manipulating strings.
- We'll be studying Regular Expressions.
- Both single and double quotes will allow us to define a string.
- R prints quotation marks inside a string with a preceding *escape sequence*.
- You can include them in your own definition.
- You can add strings in a vector using `c()`.
- `writeLines()` prints out a vector of strings as if each contains a **newline** character.
- You can change what the separator is using `sep = ""`.
- You can escape \ with another \ to print it in output.
- \U stands for Unicode characters.
- Formatting numbers is better done with `format()` or `formatC()`.
- I know the difference between Fixed and Scientific notations.
- Output Scientific format using `format( x, scientific = TRUE)` or `formatC(x, format = "e")`.
- `format()` pads the front of the input with spaces.
- You can remove the spaces using `trim = TRUE`.
- You can also change the display and add a ',' mark using `big.mark = ','`.
- `formatC()` for C style syntax format.
- There are three formating options:
	1. 'f' for fixed.
	2. 'e' for scientific.
	3. 'g' for fixed, unless scientific is better.
- You can force the display of the sign using `flag = '+'`.
- `paste()` takes input and places them together.
- You can alter what combines them using the `sep` parameter.
- Paste will recycle inputs such that the lengths of all passed arguments are the samee.
- You can also cause `paste()` to collapse all the string vectors into one using `collapse = ', '`
- You can justify text using `justify = "left"`.

# Introduction to stringr
- stringr is powerful but easy
- stringr is built on stringi
- stringr all start with `str_`
- `str_c()` behaves like `paste(.., sep = "")`.
- `str_c ()` converts missing values into actual NAs.
- .. will convert any collapse calls to NA if one is present.
- `str_length()` returns the number of characters per individual string.
- `str_sub()` can be used to extract a subset of characters
- .. also supports negative indexes.
- `str_detect()` returns a boolean value whether the pattern was detected.
- To make the function treat the text literally, then wrap it in `fixed( <string> )`.
- `str_subset()` will do something similar except it returns the actual string values.
- `str_count()` will return the number of times the pattern was observed per string.
- `str_split()` will split a string on a passed pattern.
- .. will split the string into as many pieces as it can.
- You can limit the number of splits by passing `n = <n>`.
- You can request the output be condensed using `simplify = TRUE`.
- `str_replace()` will target and replace string patterns of our choosing.
- .. takes a string, a pattern to select and a replacement.
- Ex: `str_replace( "Tom & Jerry", pattern = "&", replacement = "and")`.
- .. only replaces the first matched pattern.
- There is an *_all version of `str_replace()` however.


# Pattern Matching with Regular Expressions

# More Advanced Matching and Manipulation

# Case Studies


# Research
- Rebus Package?


# Reference