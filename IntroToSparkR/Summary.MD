# Introduction to Spark in R using sparklyr
## Richie Cotton
## Sumedh Panchadhar
## Tom Jeon

# S1: Light My Fire.
- Daily workflow:
	1. `spark_connect()`
	2. Do Work.
	3. `spark_disconnect()`
- Installing a local version of spark can be intalled using `spark_install()`.
- To list the spark version use `spark_version()`.
- Connecting requires a url or "local" via variable *master* for the computer you are on.
- Make sure if you use a url that you include the port number as well.
- When issues commands, make sure to pass `sc = <connection_object>`.
- **Dplyr** package can allow you to copy data to spark using `copy_to( <spark_conn>, <datatable> )`.
- You can query you instance of Spark for tables using `src_tbls( <spark_conn> )`
- You can use the `tbl( <spark_conn>, <data.frame_name> )` to return a special tibble.
- This tibble is just a container to a connection to Spark.
- You can check the size of an object using `pryr::object_size( <object> )`.
- `print` is quite customizable.
	* `n` for rows
	* `width` to adjust width; number of characters.
- Bracket subsetting is not supported yet in **sparklyr**.
- If not sure if the query will work make sure to wrap in a `tryCatch({..})` call.
- There are a limits of using `filter()` against **sparklyr** right now.
- To request more information use: `?translate_sql()`.

# S2: Tools of the Trade

# S3: Going Native:

# S4: Case Study


# Research:

# Investigate: