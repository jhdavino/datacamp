# Importing Data in R, Part 1
## Filip Schouwenaars

- There are different packages for different DBMS:
	1. MySQL           -> RMySQL
	2. PostgresSQL     -> RPostgresSQL
	3. Oracle Database -> ROrcale
	4. DBI for general purpose.

```
con<- dbConnect(RMySQL::MySQL,   // driver
		  dbname = "company",    // database name
		  host = "host.name",    // hostname/website
		  port = <n>             // host port
		  user = "<usr>",        // username 
		  password = "<obv>")    // password
```
- You can find the list of tables via `dbListTables( <con> )`
- You can read table information via `dbReadTables( <con>, "<table>" )`.
- It is best practice to disconnect from a database using `dbDisconnect(..)`.

- You can query data from the database using `dbGetQuery( <conn>, "<query>")`
- You can also make logical queries to SQL.
- The process of dbGetQuery follows:
	1. Call `dbSendQuery( <conn>, "<query>")`
	2. Fetch the actual data using `dbFetch( <dbSQ_object> )`.
	3. Clear results using `dbClearResult( <dbSQ_object> )`.

- HTTP stands for HyperText Transfer Protocol
- `read.csv()` accepts URLs as input.
- `read_csv()` accepts URLs as input.
- The excel versions cannot do the same.
- You can download a file from the web using `download.file( <url>, <dest_file> )`.
- `read.xls` can actually download files from the web.
- `GET( url )` will download a response object from a website.
- Convert to raw Hex via `content( <response_obj>, as = "raw")`.
- Convert to text via `content( <response_obj>, as = "text")`.

- You can use the package jsonlite to process JSON objects.
- You can convert json to a list using `fromJSON( <url> | <object> )`.
- JSON object is comprised of:
	1. name: value
	2. Values can be:
		1. string
		2. number
		3. boolean
		4. JSON Object
		5. JSON array
- JSON Objects convert to Dataframes.
- JSON Arrays convert to vectors/lists
- `toJSON(..)` will convert an R object to JSON.
- `prettify(..)` will output a clean verson of JSON.

- There are two packages for importing different data types:
	1. *haven* by Hadley Wickham
	2. *foreign* by R Core Team
- From haven:
	+ Read sas files using `read_sas(..)`.
	+ Read STATA files using `read_stata(..)` or `read_dta(..)`.
	+ Read SPSS files using `read_spss(..)`.
- foreign has many more types of files it can import, but nomenclature is not consistent.

## Research
- httr package.