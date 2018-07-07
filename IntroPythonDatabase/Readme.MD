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
- You can use arithmetic operators on non-numeric types but they wont be the same.
- You will use the operators inside of the built statements.
- A **Case Statement** is a statement that is used to treat data differently based on a condition.
- The function is called `case()` and is imported as per normal.
```python
stmy = select([
  func.sum(
    case([
      (census.columns.state == 'New York',
       census.columns.pop2008)
    ], else_=0))
])
```
- You can use the **Cast Statement** to alter the data type of the columns.
- Don't forget `'{}:{}.'.format( result1, result2 )` to substitute in values.
- **Relationships** are used to avoid duplicating data.
- They allow us to change data in only one place.
- You can simple pass multiple tables to get joined data:
```python
stmt = select([census.columns.pop2008,
               state_fact.columns.abbrebiation])
```
- If the relation is predefined in the tables, then no join declaration is necessary.
- It should come after the `select()` but before any other manupulations.
- When you do, you'll use the `select_from()` to join with the previous table.
```python
stmt = selct([ func.sum( census.columns.pop2000)])
stmt = stmt.select_from( census.join( state_fact ))
````
- To join without an existing relation, you'd pass a boolean clause.
- **Heirarchical Tables** are tables that contain relationships with themselves.
- To do this, tables are referred to with aliases.
- You use the function `alias()`.
- When you're fetching lots of results, you risk running out of memory or disk space.
- *SQLAlchemy* has the function `fetchmany()` to control returning massive amounts of results.


# Creating and Manipulating your Own Databases
- Creating tables is different depending on the database.
- If the database is supposed to SQLite and it does not exist, then it will be created.
```python
employees = Table('employees', metadata,
  Column('id', Integer()),
  Column('name', String(255)),
  Column('salary', Decimal()),
  Column('active', Boolean())
)

metadata.create_all(engine)
```
- You can then create them using the function `metadata.create_all( engine )`.
- You can tell the database to enforce unique values by passing `unique=True` to the `Column()` argument.
- You can tell the database to allow for *Nullable* values by passing `nullable=True`.
- You can tell the database what the default value will be py passing `default=<value>`.
- You add a table using the function `insert()`; you will need to import it.
- You pass the values as a set of key, value pairs.
```python
stmt = insert(<table>).values( <keys=values>)
```
- You can insert multiple values by starting with an empty `insert(<table>)` and then building multiple sets of key,value dictionaries.
```python
# generate dictionary
insert_values = [
    {},
    {},
    {}
]

# start insert statement
stmt = insert( tablename )

#
results = connection.execute(stmt, values_list)
```
- The update statement works like `insert()` but has a where clause to control what rows to update.
- You will need to import it.
- You use the function `delete()` to remove data from the database.
- You will need to import it.
- You can use the function `drop()` on a table to remove it from the database.
```python
# not a list!
stmt = delete(census)
```
```python
# drop table
table.drop( engine )

# does the table exist anymore?
print(table.exists( engine ))

# Drop all tables
metadata.drop_all( engine )
```

# Putting it All Together

# Research:
- Alembic?


# Reference:
