# Intermediate R for Finance
## Lore Dirick

# Dates
- What will you learn:
	1. If Statements
	2. Loops
	3. Functions
	4. Finance Examples
- `Sys.Date()` will tell you what the current date is.
- There are two versions of Dates in R:
	1. Date class
	2. POSIX class
- You use `as.Date()` to convert a character type into a date type.
- The default date format is ISO8601 or year-month-day
- `as.Date()` has a `format` parameter that will extend the readable formats.
- `weekdays()` will tell you what day of the week the dates are on.
- `difftime()` to tell difference between two dates.
- `months()` to extract the month from dates.
- `quarters()` to figure out which Quarter the date belongs to.
- `weekdays()` to figure out what weekday a date belongs to.

# If Statements and Operators
- Relational operators are what allow to make decisions.
- I know about relational operators.
- You can also compare against vectors.
- Sometimes you will need Logical Operators - which are `&, |, !`.
- `subset()` can be used to subset data based on conditions.
- I know about if statements.
- `runif()` can be used to generate random numbers.
- I know about if-else statements
- `ifelse()` is awesome - and I use it a lot.

# Loops
- `repeat{}` is a thing I didn't rememmber.
- `break` stops loops.
- `while()` is a thing.
- Make sure you condition is eventually exits the loop.
- I know about the for loop.
- `next` just behaves like `continue` in other languages.

# Functions
- .. are lines of code designed to a limited, but repeatable, set of actions.
- The compontents are:
	1. **Arguments**.
	2. **Body**
	3. **Return**
- You can see the documentation usign `?func_name`.
- There are two kinds of arguments: required and optional.
- Function structure; `func_name <- function( args ){ body }`.
- By defualt, then last line gets returned.
- *Arithmatic Returns*: St - St-1 / St-1
- CRAN has lots of packages.
- You install packages using `install.packages( package_name )`.
- You load the package using `library( package_name )`.

# Apply

# Research
# Reference
- tiddyquant