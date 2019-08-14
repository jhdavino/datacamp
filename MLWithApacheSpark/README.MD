# Machine Learning With Apache Spark
## Andrew Collier

# Introduction
- There are two ways ways to approach giving computers:
  1. Give them explicit instructions to follow.
  2. Give them lots of examples and have it write the rules.
- Most Machine Learning problems into Regression and Classification.
- The performance of these models is dependent on Data.
- In general, more data is usually better.
- However, as we get more data we end up having to wait longer due to IO and calculations.
- One solution for this is distributed across a cluster.
- Spark is a general purpose framework for cluster computing.
- Anatomy of a Spark Cluster:
  * One of more **Nodes**.
  * **Node**: is a computer with RAM, CPU and storage.
  * A **Cluster Manager** allocates resources and coordinates activity across the cluster.
  * A **Driver** communicates with the *Cluster Manager* who then allocates out the work.
  * On each *Node*, Spark launches **Executors** which manages tasks.
![Spark Anatomy](images/spark-anatomy.png)
- There are 4 languages for interacting with spark right now:
  1. Java.
  2. Scala.
  3. Python.
  4. R
- Python doesn't natively talk with Spark so we will need to use the package *pyspark*.
- You import it using: `import pyspark`.
- Since the version is constantly changing, you will want to know which version you're using.
- You can check this with `pyspark.__version__`.
- We're going to be using version *2.4.1* for the class.
- There are a few sub modules that assist with different interfaces:
  * `pyspark.sql` for SQL Databases.
  * `pyspark.streaming` for handling streaming Data.
  * `pyspark.ml` for Machine Learning
- The next thing you'll want to do is tell Spark where the Spark cluster is.
- You pass it a spark url to the master node: `spark://<ip-or-DNS-name>:<port>`
- The Clustered environment can get in the way sometimes and you can use a local instead.
- When you do that, you can specify the number of cores to use by passing it like:
``` python
local     # one core.
local[4]  # 4 cores
local[*]  # all cores
```
- You connect to Spark using a **Spark Session**.
```python
from pyspark.sql import SparkSession

spark = SparkSession.builder \           # delete these comments or it will fail
        .master('local[*]') \            # specify number of cores.
        .appName('spark-a-doodle-doo') \ # name the application,task
        .getOrCreate()                   # get a session object or create a new one.

        # What version of Spark?
        print(spark.version)
```
- It is good practice to stop the spark session when you're done: `spark.stop()`.
- Spark interacts with data in the tabular from called DataFrame.
- All columns have names and a specific data type.
- Functions:
  * `.count()` is the number of rows.
  * `.show()` shows a subset of rows.
  * `.printSchema()` shows the types of data of rows, columns.
- The *spark* session object we created has a read.csv function; set as True.
```python
cars = spark.read.csv('<filename>.csv', header=True)
```
- There are other options you can pass:
  * `sep` is the delimiter character; comma by default here.
  * `schema` is the column data types declared.
  * `inferSchema` is whether to guess the data types.
  * `nullValue` is placeholder for missing data.
- The .csv function treats all columns as strings by default.
- If you ask it to infer the data types, then it will be forced to look over all the data a second time.
```python
# Read data from CSV file
flights = spark.read.csv('flights.csv',
                         sep=',',
                         header=True,
                         inferSchema=True,
                         nullValue='NA')

# Get number of records
print("The data contain %d records." % flights.count())

# View the first five records
flights.show(5)

# Check column data types
flights.dtypes
```
- Here is how you define and pass types:
```python
from pyspark.sql.types import StructType, StructField, IntegerType, StringType

# Specify column names and types
schema = StructType([
    StructField("id", IntegerType()),
    StructField("text", StringType()),
    StructField("label", IntegerType())
])

# Load data from a delimited file
sms = spark.read.csv('sms.csv', sep=';', header=False, schema=schema)
```


# Classification
- There are two ways to manage columns you care about: drop unnecessary or select necessary.
```python
data = df.drop('column1', 'column2')

data2 = df.select( 'column1', ...)
```
- You can use the function `.filter()` with a logical predicate to select rows:
```python
data.filter('col IS NULL').count()
```
- Or, you can drop any record with missing values using `df.dropna()`; take care when doing this.
- You can create new columnns using the function `.withColumn()`.
```python
from pyspack.sql.functions import round

data = data.withColumn('new-name', <func> )
```
- To one hot encode a column from string to number using the function `StringIndexer`.
```python
from pyspark.ml.feature import StringIndexer

indexer = StringIndexer(inputCol = '<name1>', outputCol = '<name2>')

# Assign index values to strings
indexer = indexer.fit( cars )

# create column with index values
cars = indexer.transform(cars)
```
- If you want to setup the order independent of frequency, then use the function `stringOrderType`.
- You will need to force the data into a single vector for Spark to compute with.
```python
from pyspark.ml.feature import VectorAssembler

assembler = VectorAssembler( inputCols = ['col1', 'col2'], outputCol = 'features')
assembler.transform(cars)
```
- Example:
```python
# Repeat the process for the other categorical feature
flights_indexed = StringIndexer(inputCol='org', outputCol='org_idx').fit(flights_indexed).transform(flights_indexed)
```
- Our first model is going to be a **Decision Tree** since it's the most intuitive.
- It is created using **Recursive Partitioning**.
- Before training, we'll want to randomly split our data using the function `.randomSplit([.8,.2], seed=<n>)`
```python
data_train, data_test = cars.randomSplit([.8,.2], seed=<n>)
```
- Now we're going to start making the model.
- We're going to need `DecisionTreeClassifier`.
```python
from pyspark.ml.classification import DecisionTreeClassifier

tree = DecisionTreeClassifier()
tree tree.fit(cars_train)
```
- Now you'll be able to make predictions from the test set.
```python
predictions = tree.transform( cars_test)
```
- A good way to confirm the model success is a **Confusion Matrix**.
- You can calculate that with: `prediction.groupBy('label', 'prediction').count().show()`.
- 

# Regression

# Ensembles and Pipelines

# Reference:

# Research:
