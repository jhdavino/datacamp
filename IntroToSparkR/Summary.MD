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
- Dplyr has helper functions; see the other classes I've done.
- Use `contains()` for simple character string matching in columns.
- Use `matches()` inside of a `select` call for simple application of regex.
- You can't use `table()` since it does not return a tibble: use `count()` instead.
- There is a `head()` function as well: `top_n()`.
- To get data out of Spark and into R use `collect()`
- To store a intermediate calculated table in Spark, use `compute( <name> )`
- You can also build custom SQL queries and submit them since Spark functions like a database.
- You can do this using `dbGetQuery( <spark_conn_obj>, <query_string>)`


# S3: Going Native
- Now for the good stuff.
- ft_ stands for "feature transform"; since parameters are sometimes called features.
- ml_ stands for "machine learning".
- sdf_ stands for "Spark DataFrame".
- **sparkly** takes care of conversions to DoubleType; you must worry about logical,int -> numeric.
- Converting to binary input can be done using `binarizer( <spark_tibble>, <input_string>, <output_sting>)`
- Spark will return the result as **DoubleType** so you will need to explicitely convert it to logical.
- Use `mutate( <var_name> = as.logical( <var_name> ))`.
- To convert a continuous variable to factors use `ft_bucketizer()`.
- To create a quantile in sparklyr then use ft_quantile_discretizer()`.
- `ft_tokenizer()` will convert text input to lower case and tokenize by default.
- You can use the AFINN scores by calling `get_sentiments('afinn')`.
- You can also do more advanced tokenizers using `ft_regex_tokenizer()`.
- Calling `sdf_schema(<spark_conn>)` to get a list of col_name, data_type pairs.
- You can sample the dataset using `sdf_sample()`.
- You can partition the data using sdf_partition( training = <.n>, testing = <.(1-n)>)`.
- You could also pass a set of name, decimal pairs to label the partitions.
- Those names allow you to subscript access them.


# S4: Case Study
- Parquet files are used since they're much faster to access than csv files.
- Spark can read them using the command `spark_read_parquet(<spark_conn>, <dataset_name>, <path> )` from R.
- You can make predictions using predict() function as per normal.
- You will need to collect the results locally though.
- You can request a graidient boosted tree using `ml_gradient_boosted_trees()`
- You can request a random forest using `ml_random_forest()`


# Research:


# Investigate:
- package microbenchmark