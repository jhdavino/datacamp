# Introduction to Databases in Python
## Jason Myers

# Basics of Relational Databases
- Relational Databases are comprised of tables.
- Tables consist of *columns* and *rows*.
- We'll be using the package *SQLAlchemy* to build and run queries.
- There are two parts:
  1. Core.
  2. ORM.
- There are many different SQL databases and they all have slight quirks.
- To connect to a database:
  1. Import dependency.
  2. Declare engine.
  3. Initialize the connection.
```python
from sqlalchemy import create_engine
engine = create_engine('sqlite:///<path>/<to>/<database>')
connection = engine.connect()
```
- The connection is lazy loaded and will not actually reach out until a request is issued.
- You can get the list of tables using `engine.table_names()`.
- The function `Metadata()` is used to hold information about the database so we don't have to keep looking them up.
- You can save a table information using `Table()`.

```python
from sqlalchemy import MetaData, Table
metadata = MetaData()
census = Table( 'census', metadata, autoload = True, autoload_with = engine)
```
- You can print the columns using `census.columns.keys()`; showing that the structure is a dictionary.
- You can see all Tables using `print(repr(metadata.tables['census']))`.
- SQL statements can be used to Select, Insert, Update, Delete data.
- The general syntax of a select statement:
```sql
SELECT column_name FROM table_name
```
- You then submit the query using `connection.execute( stmt )`.
- You can then retrieve the results using `.fetchall()`.
- A **Result Proxy** is when we've asked for a query but not the data.
- A **Result Set** is when we've asked for the data itself.
- We can print the rows using the indexes: `results[0]`.
- We can access the columns using `results.keys()`.
- Build queries using *SQLAlchemy* is mostly similar but differs when building the query.
- You instead use functions such as `select([census])`.


# Applying Filtering, Ordering and Grouping to Queries
- You can submit a where statement using:
```python
stmt = select([census])
stmt = stmt.where( census.columns.state == 'California')
```
- **Where Clauses** return a query based on a boolean condition.
- You can use most comparison operators that you would normally use in Math.
- There are a few additional expressions:
  * `in_()` to check in something exists inside.
  * `like()` to check for something similar in text.
  * `between()` to check whether the column value is between the two supplied values.
- You can actually substitute the execute statement as the expression in a for loop.
- There are also conjunction functions:
  * `and_()`
  * `not_()`
  * `or_()`
```python
stmt = stmt.where(
  or_(census.columns.state == 'California',
      census.columns.state == 'New York')
  )
)
```
```python
# reference
engine = create_engine('postgresql+psycopg2://<username>:<password>@<address>:<port>/<table>')
```
- You can order the results using `order_by()`; defaults to lowest to highest.
- You can reverse this using `desc()` to reverse the order from highest to lowest.
- You can find the normal accumulator functions in `func` from *sqlalchemy*.
- The returned name from the calculation is `<aggregate_<n>>` and you can use the function `label()` when querying to rename it.
- Function `func.count()`.
- Function `.distinct()`.
- The function `.scalar()` can be used to return a result that is only a single row,column combination.
- You can pass the results from a query directly into pandas.
```python
import pandas as pd
df = pd.DataFrame( results )
df.columns = results[0].keys()
```


# Advanced SQLAlchemy Queries

# Creating and Manipulating your Own Databases

# Putting it All Together

# Research:

# Reference:
