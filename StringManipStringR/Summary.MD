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
- Regular Expressions is a language for describing patterns.
- Since `\` has a special meaning in R, then you have to actually use two of them.
- We're going to be using the `rebus` package to build expressions.
- `%R%` is a sort of 'piping' for rebus.
- You should think of it as "then".
- You can include the expression inside of any function that accepts patterns already.
- `str_view()` will open and HTML viewer of the matching strings.
- You can specify beginning or ending using expressions `START` or `END` in rebus.
- Make sure that `END` is actually the last item in the queue.
- `START` maps to `^` in regex; `END` maps to `$` in regex.
- You can match any character using `ANY_CHAT` which maps to `.` in regex.
- `str_extract` returns ONLY the part that matches.
- rebus also has variables for:
	- '.' : `DOT`
	- '^' : `CARET`
	- '$' : `DOLLAR`
- In rebus, you use `or( terms, terms, terms)` for logical or matches.
- Character classes match a set of passed characters.
- You do this using `char_class("asdlkfjasdfklasdjflkj")`.
- You can tell rebus to not match using `negated_char_class("asdlkfjasflkdjlakf")`.
- When dealing with repitition:
	- '?'      : `optional()`
	- '*'      : `zero_or_more()`
	- '+'      : `one_or_more()`
	- '{n}{m}' : `repeated()`
- Adding `match = TRUE` to `str_view()` will display only matches.
- Regex has built in character classes for common classs calls.
- You can specify a range using a '-' inside of a character class.
- Ex: `char_class("ab-op")`.
- The builtin for the digit class in rebus is `DGT`.
- The builtin for word-character is `WRD`.
- The builtin for space is `SPC`.


# More Advanced Matching and Manipulation

# Case Studies


# Research
- Rebus Package?


# Reference