# Python Fundamentals
## Bo Milanovich

# Introduction
- Learning basics:
	1. Data Types
	2. Functions
	3. Classes
- I already know these but review never hurts.
- You can use Python for basically anything.
- Python is simple to read and write.
- PEPs or *Python Enhancement Proposals* are similar to RFCs.
- Use Python 3 for eventual replacement.
- Check version using `python3 --version`; which is BSD notation.
- I'm not going to use PyCharm though; I'll be working with Atom instead.
- And, I might start working in Sublimetext as well.


# Types, Statements, and Other Goodies
- We're going to be studying:
	* Data types
	* Flow Control
	* Loops
	* Dictionaries
	* Exceptions
	* Other Data Types
- Python is not a Declarative Typed language.
- .. does not have as many types as other languages.
- .. is also called a Dynamically Typed language.
- .. does have something called **type hinting**.
- This looks like `def my_function(a: int, b: int) -> int:`
- This was added in Python 3.5
- This will not stop the language from running the code.
- One way to deal with this is with lots of unit testing.
- **Integers** are numbers; **floats** are decimal numbers.
- Python 3 also includes complex numbers.
- To explicitely declare the type use `type( variable )`.
- Strings are text representations.
- Python3 uses Unicode string by default.
- They can be declared using `'a' == "a" == """a"""`.
- `'x'.capitalize()` will capitalize the first letter of a string.
- `'x'.replace( "x", "y")` will replace a letter in a string.
- `'x'.isalpha()` will check if actually characters.
- `'x'.isdigit()` will check if actually numbers.
- `'x.y'.split(".")` will split on the specified character and return a list.
- You can substitute values into a string using `"this is a {0}, this is a {1}".format( name, shame)`.
- `format()` can be *VERY* advanced.
- Boolean indicates a true or a false value: True or False.
- `None` is synoymous with `NULL` for other languages.
- If Statements:
```python
number = 5
if number == 5:
	print( "Number is 5")
else:
	print("Number is Not 5")
```
- Python has a concept called *truthy* and *falsy*.
- This means that a number is not None; a string is not an empty string.
- This allows you to do something akin to `if number:`
- `!=` or `if not` for checking is something is not true.
- Python uses actual words `and` or `or` for logical statements.
- .. does contain Ternary statements; ` 'bigger' if a > b else 'smaller'`.
- Lists in Python can be defined using `empty_list = []`.
- You can also just include the elements inside of the list.
- Lists use 0-based indexing.
- Lists also allow for negative indexing.
- Assignments in Lists is just as easy.
- You can append values using `list_name.append( 'value')`.
- You can also check if an element exists in a list using `item in list_items == TRUE`.
- You can check the length of a list using `len( list_name )`.
- Python allows you to remove an item from a list using `del list_items[0]`.
- You can iterate through a list using `for item in list:`.
- Python has a `range()` function to create a list to iterate over.
- Python supports `break` and `continue` inside loops.
- Python also supports `while`.
- If you want to attach multiple details to a single result, then use a Dictionary.
```python
student = {
	"name": 'phlip',
	"student_id": 36151,
	"feeedback": None
}
```
- You can nest dictionaries.
- Exceptions are events that occur during your programs execution that normally cause your program to stop executing.
- To catch these events, you use a `try:` and `except errorType:`.
- A few of the types of errors are :
	* KeyError
	* TypeError
	* Exception
- If you handle these errors correctly, then your program will not crash.
- You can pass the error as a string using `TypeError as error`.
- Some alternative types are:
	1. long, which is deleted.
	2. bytes, or bytesarray
	3. tuples.
	4. sets.

# Functions, Files, Yields and Lambda
- We're going to build our PyStudentManager now.
- A **Function** is a block of code that is reusable and used to perform a certain action.
- The **def** keyword is used to define a function.
- The format looks like `def funct_name( var1, var2):`
- Variables declared in a function must be passed to the function.
- You can pass default arguments; `( default = True)`.
- You can pass a catch-all with `*args`.
- There is also a structured catch-alls using keyword args: `**kwargs`.
- This is actually a dictionary.
- Python supports closures.
- When opening a file with `open()` you should pass one of the following arguments:
	1. 'w' for write.
	2. 'wb' for write binary.
	3. 'a' for append to end.
	4. 'r' for reading a file.
	5. 'wr' for reading binary.
- You write data using `f.write()`.
- You need to close the file to save the changes using `f.close()`.
- You use the **yield** keyword to build a generator - which are kind of like a list.
- **Lambda functions** are just anonymous functions.
- Python does actaully allow for hgher order functions - which I didn't know.
- The lambda format is `double = lambda x: x * 2`.

# Object Oriented Programming - Classes and Why Do We Need Them


- `pass` just tells Python to do nothing.
- To create a new instance of a class just use `variable_name = InitCall()`
- This reference points to an object in memory.
- You can include functions inside objects.
- For functions inside a class, you *must* pass reference to self.
- Constructors in Python use the `__init__(self, ..)`.
- You can also control what is printed on a print call using `__str__(self, ..)`.
- Modify variables inside an object using `self.variable.mods()`.
- You can inherit from another class using `class lower_class( upper_class ):`.
- You can call a function from the parent using `super().function()`.
- To import another function from another file using `import file_name_ignore_py`.
- Comments start with a pound sign.


# Putting it All Together - Let's Make it a Web App.
- 
- Django is the top pick; we're going to use Flask.
- Flask is very minimalistic.
- There is a lot of overlap between your local application and the Web App version.
- 

# Python Tips and Tricks.
- A **Virtual Environment** allows you to set up different versions of Python to work in.
- Install using `pip install vertualenv`.
- To start a new environment just use `virtualenv <name_of_envir>`.
- You can set which version of python to use using `--python=<path_to_python>`.
- To activate the environment use `source <path_to_envir/bin/activate`.
- All pip calls will only install in the local virtual environment.
- A **break point** in code is a line that, when reached, will halt execution.
- **Pyinstaller** is a package that converts your Python code to an executable.
- It is cross platform too.
- After installing, type `pyinstaller <file.py>`.
- If you want everything contained in a single executable, then use `--onefile` flag.

- To create the familiar intallation process for your application, use **Inno Setup**.
- You will need to download it from the internet.

# Research:

# Reference:
