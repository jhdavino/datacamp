# Introduction to Data Engineering
## Vincent Vankrunkelsven

# Introduction to Data Engineering
- It is the **Data Engineer's Job** to make the data analysis job easier.
- They are focused on tasks such as:
  * Gathering data from different sources.
  * Optimized databases for Analyses.
  * Remove corrupted data.
- A more formal definition is someone who develops, constructs, tests and maintains architectures such as databases and large scale processing systems.
![Data Scientist vs Data Engineer](images/engineer-vs-scientist.png)
- Data engineers are expert users of databases.
- A **Database** holds large amounts of data.
- Processing data includes:
  * Cleaning data.
  * Aggregating data.
  * Join data.
- It is also the Data Engineer's job to plan jobs with specific intervals.
- Sometimes jobs must be done in a particular order so you will need to resolve dependency requirements of jobs.
- There are lots of different tools for these jobs:
![Existing Tools](images/existing-tools-1.png)
- Data Engineers are heavy users of the cloud.
- This is because maintaining in-house infrastructure is expensive and hard to maximize.
- There are three big players in the Cloud:
  1. AWS.
  2. Azure.
  3. Google Cloud
- While there are a lot of services they provide, the three most relevant to a Data Engineer are:
  1. Storage.
  2. Computation.
  3. Databases.


# Data Engineering Toolbox
- A **Database** is usually a large collection of data storage organized especially for rapid search and retrieval.
- The main difference between Databases and file systems is the level of organization.
- There are two primary kinds of databases: **Structured vs Unstructured**.
![Structured vs Unstructured](images/structured-vs-unstructured.png)
- We also talk about them in the terms SQL vs NoSQL databases.
![SQL vs NoSQL](images/sql-vs-nosql.png)
- In Datawarehouses, it is common to see a **Star Schema**.
- This is defined as consisting of one or more fact tables referencing any number of dimension tables.
```sql
# Complete the SELECT statement
data = pd.read_sql("""
SELECT * FROM "Customer"
INNER JOIN "Order"
ON "Order"."customer_id"="Customer"."id"
""", db_engine)

# Show the id column of data
print(data.id)
```
- Parallel computing is the basis of almost all modern data processing tools.
- The reason for this is processing power and memory: mostly memory.
- The processing tools split tasks into sub tasks and distribute them across multiple computers.
![Analogy for Multiple Processes](images/split-task-analogy.png)
- There are some risks, of course:
  1. There is overhead due to the need for communication.
  2. Tasks do not increase linearly as you throw more compute at something: **Parallel Slowdown**.
- Here is an example of paralleliz-ing in Python:
```python
from multiprocessing import Pool

def take_mean_age(year_and_group):
  year, group = year_and_group
  return pd.DataFrame({"Age": group['Age'].mean()}, index = [year])

with Pool(4) as p:
  results = p.map(take_mean_age, athlete_events.groupby("Year"))

results_df = pd.concat(results)
```
- There are packages that assist with allowing one to not have to write such low level code.
- One such package is *dask*.
```python
import dask.dataframe as dd

# Partition dataframe into 4 parts:
athlete_events_dask = dd.from_pandas(athlete_events, npartitions = 4)

# Run parallel computations on each partition:
result_df = athlete_events_dask.groupby('Year').Age.mean().compute()
```
- Example of timing with different pool sizes:
```python
# Function to apply a function over multiple cores
@print_timing
def parallel_apply(apply_func, groups, nb_cores):
    with Pool(nb_cores) as p:
        results = p.map(apply_func, groups)
    return pd.concat(results)

# Parallel apply using 1 core
parallel_apply(take_mean_age, athlete_events.groupby('Year'), 1)

# Parallel apply using 2 cores
parallel_apply(take_mean_age, athlete_events.groupby('Year'), 2)

# Parallel apply using 4 cores
parallel_apply(take_mean_age, athlete_events.groupby('Year'), 4)
```
- If you've done any looking, then you've heard of Hadoop.
- There are two projects we'll be talking about: MapReduce and HDFS.
- Firstly, **HDFS** is a distributed file system.
- **MapReduce** is similar to what was talked about with splitting the tasks up.
- A flaw was that it was hard to write the jobs to run.
- One solution to that problem was **HIVE**.
- It runs on *Hadoop* and uses a Structured Query Language.
- **Apache Spark** is a distributed compute project which tries to keep as much in memory as possible.
- *Spark* relies on what are called **Resilient Distributed Datasets (RDD)**.
- You can think of them as lists of tuples.
- You can use two operations on these:
  1. Transformations.
  2. Actions.
- When working with *Spark*, people use a programming language API like PySpark.
```python
from pyspark.sql import SparkSession


if __name__ == "__main__":
    spark = SparkSession.builder.getOrCreate()
    athlete_events_spark = (spark
        .read
        .csv("/home/repl/datasets/athlete_events.csv",
             header=True,
             inferSchema=True,
             escape='"'))

    athlete_events_spark = (athlete_events_spark
        .withColumn("Height",
                    athlete_events_spark.Height.cast("integer")))

    print(athlete_events_spark
        .groupBy('Year')
        .mean('Height')
        .orderBy('Year')
        .show())
```
- Now we'll discuss the workflow scheduling frameworks.
- You could run the job daily, manually but that's not efficient.
- You could maybe use cron in linux but this will not take into account dependencies in jobs.
- To help visualize this we can use a **Directed Acyclical Graph (DAG)**.
- These have the attributes:
  * Set of nodes.
  * Directed Edges.
  * No cycles.
- While some companies use `cron`, you could also use Spotifies Luigi.
- For the remainder of the video, we'll be talking about Apache Airflow.
```python
# Create the DAG object
dag = DAG(dag_id="car_factory_simulation",
          default_args={"owner": "airflow","start_date": airflow.utils.dates.days_ago(2)},
          schedule_interval="0 * * * *")

          # Task definitions
          assemble_frame = BashOperator(task_id="assemble_frame", bash_command='echo "Assembling frame"', dag=dag)
          place_tires = BashOperator(task_id="place_tires", bash_command='echo "Placing tires"', dag=dag)
          assemble_body = BashOperator(task_id="assemble_body", bash_command='echo "Assembling body"', dag=dag)
          apply_paint = BashOperator(task_id="apply_paint", bash_command='echo "Applying paint"', dag=dag)

          # Complete the downstream flow
          assemble_frame.set_downstream(place_tires)
          assemble_frame.set_downstream(assemble_body)
          assemble_body.set_downstream(apply_paint)
```


# Extract, Transform, Load ( ETL )
- Extracting data means taking data from persistent storage into memory for processsing.
- There are lots of different formats where data is stored:
  1. Unstructured; plain text.
  2. Flat Files; .tsv, .csv
  3. Javascript Object Notation (JSON)
  4. APIs
  5. Databases.
```python
import requests

# Fetch the Hackernews post
resp = requests.get("https://hacker-news.firebaseio.com/v0/item/16222426.json")

# Print the response parsed as JSON
print(resp.json())

# Assign the score of the test to post_score
post_score = resp.json()["score"]
print(post_score)
```
```python
# Function to extract table to a pandas DataFrame
def extract_table_to_pandas(tablename, db_engine):
    query = "SELECT * FROM {}".format(tablename)
    return pd.read_sql(query, db_engine)

# Connect to the database using the connection URI
connection_uri = "postgresql://repl:password@localhost:5432/pagila"
db_engine = sqlalchemy.create_engine(connection_uri)

# Extract the film table into a pandas DataFrame
extract_table_to_pandas("film", db_engine)

# Extract the customer table into a pandas DataFrame
extract_table_to_pandas("customer", db_engine)
```
- Now we'll talk about what kind of transformations you can expect to do to data.
- You can select attributes from the data.
- You can translate values in the data ( 'New York' => 'NY').
- Validate that the data makes sense.
- While you can use pandas to do this, we're going to be using pyspark.
- You can connect spark to a sql database using:
```python
import pyspark.sql

spark = pyspark.sql.SparkSession.builder.getoOrCreate()
spark.read.jdbc("jdbc:<db-type>://<connection-address>:<port>/<database>",
  "<table-name>",
  properties = {"user": "<username>", "password":"password"})
````
- An example of joining:
```python
# Get the rental rate column as a string
rental_rate_str = film_df.rental_rate.astype("str")

# Split up and expand the column
rental_rate_expanded = rental_rate_str.str.split(".", expand=True)

# Assign the columns to film_df
film_df = film_df.assign(
    rental_rate_dollar=rental_rate_expanded[0],
    rental_rate_cents=rental_rate_expanded[1],
)
```
```python
# Use groupBy and mean to aggregate the column
ratings_per_film_df = rating_df.groupBy('film_id').mean('rating')

# Join the tables using the film_id column
film_df_with_ratings = film_df.join(
    ratings_per_film_df,
    film_df.film_id==ratings_per_film_df.film_id
)

# Show the 5 first results
print(film_df_with_ratings.show(5))
```
- The last step would be to load the data into an Analytics Database or Application.
![Column vs Row](images/column-vs-row.png)
- Most often the data will be pushed into a **Massively Parallel Processing Database**.
- There are multiple tools for this:
  1. Amazon Redshift.
  2. Azure SQL Data Warehouse
  3. Google BigQuery.
- Sometimes you'll want to convert the data to a Columnar format using `pandas.to_parquet()`
- Sometimems you'll want to push the computation results into a SQL database:
```python
results = transform_for_results( data_df)

# load into PostgreSQL database:
results.to_sql(
  "<table>",
  db_engine,
  schema="store",
  if_exists = "replace"
)
```
```python
# Write the pandas DataFrame to parquet
film_pdf.to_parquet("films_pdf.parquet")

# Write the PySpark DataFrame to parquet
film_sdf.write.parquet("films_sdf.parquet")
```
```python
# Finish the connection URI
connection_uri = "postgresql://repl:password@localhost:5432/dwh"
db_engine_dwh = sqlalchemy.create_engine(connection_uri)

# Transformation step, join with recommendations data
film_pdf_joined = film_pdf.join(recommendations)

# Finish the .to_sql() call to write to store.film
film_pdf_joined.to_sql("film", db_engine_dwh, schema="store", if_exists="replace")

# Run the query to fetch the data
pd.read_sql("SELECT film_id, recommended_film_ids FROM store.film", db_engine_dwh)
```
- Now here is our example ETL job:
![Example ETL Job Flow](images/example-etl.png)
- First, we'll create a DAG in Apache Airflow.
- The normal format to specify the job runtime is a cron format:
![Cron Specification](images/cron-format.png)
- While setting up the job, since this is using python then it makes sense to use Airflow's PythonOperator.
```python
from airflow.models import DAG
from airflow.operators.python_operator imoprt PythonOperator

dag = DAG(dag_id="etl_pipeline",
  schedule_interval="0 0 * * *"
)

etl_task = PythonOperator(
  task_id='etl_task',
  python_callable=etl,
  dag
)
```
- Once this is done, you can write the files in `~/airflow/dags/` folder for them to just work.


# Case Study: Datacamp
- We're going to use Datacamp's Course Ratings in a real example.
```python
# Complete the transformation function
def transform_avg_rating(rating_data):
  # Group by course_id and extract average rating per course
  avg_rating = rating_data.groupby('course_id').rating.mean()
  # Return sorted average ratings per course
  sort_rating = avg_rating.sort_values(ascending=False).reset_index()
  return sort_rating

# Extract the rating data into a DataFrame    
rating_data = extract_rating_data(db_engines)

# Use transform_avg_rating on the extracted data and print results
avg_rating_data = transform_avg_rating(rating_data)
print(avg_rating_data)
```
- Making recommendations is usually about Matrix Factorization - which, in detail, is beyond the scope of the course.
```python
# Complete the transformation function
def transform_recommendations(avg_course_ratings, courses_to_recommend):
    # Merge both DataFrames
    merged = courses_to_recommend.merge(avg_course_ratings)
    # Sort values by rating and group by user_id
    grouped = merged.sort_values("rating", ascending = False).groupby('user_id')
    # Produce the top 3 values and sort by user_id
    recommendations = grouped.head(3).sort_values("user_id").reset_index()
    final_recommendations = recommendations[["user_id", "course_id","rating"]]
    # Return final recommendations
    return final_recommendations

# Use the function with the predefined DataFrame objects
recommendations = transform_recommendations(avg_course_ratings, courses_to_recommend)
```


# Research:
- `@print_timing`?


# Reference
