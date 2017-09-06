# Intro to Python for Data Science
## Filip Schouwenaars
## Vincent Vankrunkelsven
## Patrick Varilly


# Python Basics
- What you will learn.
	1. Python.
	2. Data Science.
	3. Store Data.
	4. Tools for Analysis.

- Created by Guido Van Rossum
- General Purpose Language
- Course is focused on v3.x
- To install, visit [this link](https://www.python.org/downloads).
- Ipython shell is used.
- Python can be used as a calculator: 'cause meh.
- Python files end with .py.
- I know how the interface works.
- I've coded before; a lot of this class is below my skill level.
- Python will tell you the type of something using `type()`.
- Types behave differently based on its type.

## Python Lists
- .. is of the form [x, y, z]
- .. are not type limited.
- Python has normal list indexing.
- .. also has negative indexing.
- .. is index-ending exclusive behavior.
- You can leave out the 0 index if you want begin:index.
- Not including a end index overrides the exclusive behavior and you get the full list.
- Index assignments are normal; also supports multi-value replacement.
- Delete single items from a list using `del()`.
- `=` with lists is copy by reference by default; further updating will change both.
- To do a deep copy, use `y = list(x)` or `y = x[:]`.
- You can add `;` to lines to run multiple commands on the same line.

# Functions and Packages
- .. a piece of reusable code solving a particular task.
- Call them instead of your own code.
- There are lots of builtin functions.
- "Black Box"
- `max()`.
- `round()`
- `help()`
- `len()`
- The Internet is not your friend; it wants your soul.
- Methods are functions that belong to objects.
- `object.index()`
- Packages are a directory of python scripts.
- .., Numpy, Matplotlib, scikit-learn
- Python has it's own package manager called PIP.
- You can download pip [here]( http://pip.readthedocs.org/en/stable/installing/ )
- use `python3` and `pip3` to use the version 3's of python.
- You import package using `import`.
- You can also import and rename the reference using `import numpy as np`
- You can also import a single function using `from numpy import array`

## NumPy
- Allows calculations across all values; like R vectors.
- Create array using `np.array( VALUES )`
- It assumes that arrays are of multiple types.
- array will type coerce the input into a single type if they differ.
- Numpy is just a package to emulate functional and scalable functions for data types.
- You can subset using booleans and comparisons - like in R.
- 

- 2D Numpy arrays:
- .. supports N-dimensional arrays // want to call everything vectors.
- .. supports [,] subsetting format.
- `array.shape` gives an output as well as the dimensions; which are subsettable // `array.shape[:]`

- Numpy supports basic statistics.
- `np.mean()`
- `np.median()`
- `np.corrcoef(...)` // Correlation implementation
- `sum()`, `sort()`
- Single type sorting is much faster.
- Numpy has has random dist sampling using `np.random.normal( mean, std, count )`.

## Research:

## Reading:
