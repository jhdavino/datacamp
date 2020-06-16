# Big Data Fundamentals with PySpark
## Upendra Kumar Devisetty

# Introduction to Big Data Analysis with Spark
- According to Wikipedia, **Big Data** is defined as the study and applications of ddata sets what are too complex for traditional data-processing software.
- The three V's of Big Data are:
  1. Volume.
  2. Variety
  3. Velocity.
- Terminology:
  * **Clustered Computing** is the collection of resources of multiple machines.
  * **Parallel Computing** is the simultaneous computation of data.
  * **Distributed Computating** is the involvement of multiple nodes or computers in a job collection.
  * **Batch Processing** is the breaking of jobs into smaller pieces and running on individual machines.
  * **Real-time Processing** is the immediate processing of data as it arrives.
- While Spark is not the only project for this, we'll be learning it.
![Spark Components](images/spark-components.png)
- There are two modes for running Spark:
  1. Local Mode.
  2. Cluster Mode.
- Apache Spark is written in Scala.
- Spark comes with Interactive Shells which assist in analysis.
- Python's version is called *PySpark* - which we'll be using.
- To interact with Spark, you will need the entry point called the **Spark Context**.
- When you're inside the *spark context*, you will have access to it using the variable `sc`.
- You can get version information using `sc.version` and `sc.pythonVer`.
- You can find who the master is using `sc.master`.
- You can load data into Spark using `parallelize()`:
```python
rdd = sc.parallelize([1,2,3,4,5,6])
```
- ... or you could load a text file using `textFile()`
```python
rdd2 = sc.textFile("test.txt")
```
- **Anonymous Functions** - or **Lambda Function** - are functions which are not bound to a name at runtime.
- It is very common to see them used with the `filter()` and `map()` functions.
- The syntax is shown here:
```python
lambda arguments: expression
```
- The lambda function has no return statement and always contains an expression.
- The `map()` function takes a function and a list and returns a new list with the function applied to each item.
- The syntax for `map()` is:
```python
map(function, list)
```
- The `filter()` function takes a function and a list and returns values which are evaluated to true.


# Programming in PySpark RDD’s
- The fundamental unit of data in Spark is the **Resliient Distributed Dataset(RDD)**.
- The name captures three important properties:
  1. *Resilient*: Ability to withstand failures.
  2. *Distributed*: Spanning across multiple nodes.
  3. *Dataset*: Collection of Partitioned data.
- There are three methods - and the last one to know is creating them from existing RDDs.
- Understanding partitioning in PySpark helps control parallelism.
- A **Partition** is a logical division of a large dataset distributed to multiple locations.
- You can control this by setting the minimum number of partitions using `minPartitions` passed to the creation functions.
- You can find out how many partitions exist uing the function `.getNumPartitions()`.
- Spark Operations are broken into **Transformations** and **Actions**.
- *Transformations* create new RDDs and *Actions* perform computations on the RDDs.
- Transformations follow **Lazy Evaluation** which is when the transformations are graphed but not executed:
![A Spark Graph](images/example-spark-graph.png)
- You can join multiple RDDs together using the `.union()` function:
![Union Transformation](images/example-union-rdd.png)
- **Actions** are what return values and execute on the graph.
- The actions we're going to learn about are `collect()`, `take()`, `first()` and `count()`.
  * `collect()` returns all the elements.
  * `take()` returns `<n>` values from the RDD.
  * `first()` returns a single element from the RDD.
  * `count()` returns the number of elements.
- Plenty of real world data sets are key,value pairs.
- To manage this data, PySpark uses a special data structure called a **Paired RDD**.
- With these, the *key* is the identifier and the *value* is the data.
- The two most common ways to create these is from a key,value tuplue or a regular RDD.
- Here is an example using tuples:
```python
my_tuple = [('Sam', 23), ("Mary", 34), ("Peter", 25)]
pairRDD_tuple = sc.parallelize(my_tuple)
```
- ... or from a regular RDD:
```python
my_list = ['Sam 23', "Mary 34", "Peter 25"]
regularRDD = sc.parallelize(my_list)
pairRDD_RDD = regularRDD.map(lambda s: (s.split(' ')[0], s.split(' ')[1]))
```
- Make sure when calling functions, that they expect key,value pairs.
- The most common is `.reduceByKey()` which combines values with the same key.
- Note that this is not an action but is a transformation.
- The next common is `.sortByKey()` which orders pair RDD's by Key.
- Note that the keys must be sortable.
- Another is `.groupByKey()` which is useful to group all values with the same key.
- The `.join()` function will join two RDD values together by the shared keys.
![Example of Join](images/example-join-rdds.png)
```python
# Create PairRDD Rdd with key value pairs
Rdd = sc.parallelize([(1,2), (3,4), (3,6), (4,5)])

# Apply reduceByKey() operation on Rdd
Rdd_Reduced = Rdd.reduceByKey(lambda x, y: x + y)

# Iterate over the result and print the output
for num in Rdd_Reduced.collect():
  print("Key {} has {} Counts".format(num[0], num[1]))
```
```python
# Sort the reduced RDD with the key by descending order
Rdd_Reduced_Sort = Rdd_Reduced.sortByKey(ascending=False)

# Iterate over the result and print the output
for num in Rdd_Reduced_Sort.collect():
  print("Key {} has {} Counts".format(num[0], num[1]))
```
- The `.reduce()` action is used to aggregate the elements of a RDD.
- This function should be commutative and associative.
- The `.saveAsTextFile()` action saves a RDD into a text file inside a directory with each partition as a separate file.
- However, you can force it into a single file using the `.coalesce()` function.
- Now we'll check out `.countByKey()` which is only available for RDDs with a key,value relationship.
- It will count the number of keys per dataset.
- You should not call this function unless the data is small enough to fit in memory.
- The function `.collectAsMap()` return the key-value pairs in the RDD as a dictionary.
```python
# Transform the rdd with countByKey()
total = Rdd.countByKey()

# What is the type of total?
print("The type of total is", type(total))

# Iterate over the total and print the output
for k, v in total.items():
  print("key", k, "has", v, "counts")
```
```python
# Create a baseRDD from the file path
baseRDD = sc.textFile(file_path)

# Split the lines of baseRDD into words
splitRDD = baseRDD.flatMap(lambda x: x.split())

# Count the total number of words
print("Total number of words in splitRDD:", splitRDD.count())
```
```python
# Convert the words in lower case and remove stop words from stop_words
splitRDD_no_stop = splitRDD.filter(lambda x: x.lower() not in stop_words)

# Create a tuple of the word and 1
splitRDD_no_stop_words = splitRDD_no_stop.map(lambda w: (w, 1))

# Count of the number of occurences of each word
resultRDD = splitRDD_no_stop_words.reduceByKey(lambda x, y: x + y)
```
```python
# Display the first 10 words and their frequencies
for word in resultRDD.take(10):
	print(word)

# Swap the keys and values
resultRDD_swap = resultRDD.map(lambda x: (x[1], x[0]))

# Sort the keys in descending order
resultRDD_swap_sort = resultRDD_swap.sortByKey(ascending=False)

# Show the top 10 most frequent words and their frequencies
for word in resultRDD_swap_sort.take(10):
	print("{} has {} counts". format(word[1], word[0]))
```


# PySpark SQL & DataFrames
- PySpark SQL is a Spark library for structured data.
- PySpark DataFrame is an immutable distributed collection of data with named Columns.
- They support SQL queries or expressions.
- Spark Session provides a single point of entry to Spark DataFrames.
- This is exposed as `spark` in a Pyspark shell.
- There are two main ways to create these:
  1. From an existing RDD.
  2. From data sources using a `.read()` method.
![Create DataFrame from RDD](images/create-dataFrame-from-rdd.png)
- To create a DataFrame from a CSV file use:
```python
df_csv = spark.read.csv("people.csv",   header=True, inferSchema=True)
df_csv = spark.read.json("people.json", header=True, inferSchema=True)
df_csv = spark.read.txt("people.txt",   header=True, inferSchema=True)
```
- DataFrames of course also support Transformations and Actions.
- `.show()` is an action and will get values.
- Operations that are also support:
  * `.groupBy()`
  * `.filter()`
  * `.orderBy()`
  * `.dropDuplicates()`
- You can rename a column and return a new dataFrame using `.withColumnRenamed()`:
```python
test_df_sex = test_df.withColumnRenamed('Gender', 'Sex')
test_df_sex.show(3)
```
- You can print the schema of the data frame using `.printSchema()`.
- You can print just the column names using `.columns`
- You can calculate and print the summary statistics using `.describe()`.
- In PySpark you can interact with SparkSQL through the dataFrame API and SQL Queries.
- The API provides a programmatic domain-specific language for data.
- The spark session has a method for this called `.sql()`.
- You will need to create a temporary table for this to work:
```python
df.createOrReplaceTempView('table1')
df2 = spark.sql("SELECT field1, field2 FROM table1")
df2.collect()
```
- Data visualization is fundamental to solving problems.
- While there are plenty of tools to visualize data, none of the common ones can be used directly with Spark.
- There are at least three though:
  1. pyspark_dist_explore library
  2. `.toPandas()`
  3. HandySpark
- We'll start with pyspark_dist_explore first.
- It supports the functions `.hist()`, `.distplot()` and `pandas_histogram()`.
- For a histogram, you would select the column you wanted and then call the function:
```python
test_df_age = test_df.select('Age')
hist(test_df_age, bins=20, color = 'red')
```
- It it really easy to create charts in pandas Data Frames.
- See the other courses.
- The package *Handy Spark* is designed to improve the PySpark User Experience.
- Once the data is loaded, you would create a Handy Data Frame.
```python
hdf = test_df.toHandy()
hdf.cols['Age'].hist()
```


# Machine Learning with PySpark MLlib

# Research:

# Reference:
