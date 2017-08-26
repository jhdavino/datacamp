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
- You can also cause `paste()` to collapse all the string vectors into one using `collapse = ', '`.
- 

# Introduction to stringr

# Pattern Matching with Regular Expressions

# More Advanced Matching and Manipulation

# Case Studies


# Research
- Rebus Package?


# Reference