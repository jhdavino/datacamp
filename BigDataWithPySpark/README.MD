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

# PySpark SQL & DataFrames

# Machine Learning with PySpark MLlib

# Research:

# Reference:
