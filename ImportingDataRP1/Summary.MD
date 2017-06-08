# Importing Data in R, Part 1
## Filip Schouwenaars

- Focus on Five types of data
	1. Flat Files
	2. Excel
	3. Databases
	4. Web
	5. Statistical Software.
- Use `file.path(...)` to generate Os independant paths.
- Normally, you should turn of `stringsAsFactors` unless you want them to be factors.
- If you need further customizability, then use `read.table()`
- `read.csv()` and `read.delim()` are just wrapper calls around `read.table()`
- `read.delim2` is for dealing with international formats of files using ; and ,

- Hadley wrote a package called readr.
- Nomenclature is similar to utils package: `read.csv` vs `read_csv`.
- You can pass a character string to denote what type read_delim should parse a column as: `col_types`.
	1. c: character
	2. d: double
	3. i: integer
	4. l: logical
	5. _: skip
- You can also skip rows using `skip = n`.
- You can also specify a max number of rows to read using `n_max`.

- data.table comes with its own reading function: `fread()`.
- It's *REALLY* fast.

- Hadley also wrote the package readxl to read excel sheets.
- Two primary functions:
	1. `excel_sheets()` to list all sheets
	2. `read_excel()` to collec the data.
- You can specify which sheet to read using either `sheet = n` or `sheet = "title"`
- `read_excel()` can also accept skip, col_types and col_names variables.
- Types are:
	1. text
	2. numeric
	3. date
	4. blank
- gdata is a general purpose package for managing data.
- " uses Perl; which is cool.

- XLConnect package allows one to do the work in R and communicate with Excel.
