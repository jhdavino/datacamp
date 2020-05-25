# Introduction to Airflow in Python
## Mike Metzger

# Intro to Airflow
- **Data Engineering** is taking any action involving data and turning it into a reliable, repeatable and maintainanble process.
- A **Workflow** is a set of steps to accomplish a given data engineering task.
- Apache Airflow is a platform to program workflows in general.
- They are implemented as **Directed Acyclical Graphs**.
There are other tools as well:
  * Luigi
  * SSIS
  * Bash Scripting.
- An example of a simple dag is:
```python
etl_dag = DAG(
  dag_id = 'etl_pipeline',
  default_args = {'start_date': "2020-01-08"}
)
```
- There are multiple ways to run dags but the easiest is via the command line:
```bash
airflow run <dag_id> <task_id> <start_date>
# airflow run example-etl download-file 2020-01-10
```
- DAGs have the attributes:
  1. It is directed; meaning there is an inherent flow.
  2. It does not loop or repeat.
  3. Graph is the representation of the compenents.
![Example DAG Definition](images/example-dag.png)
- You can get the list of subcommands at the command line using `airflow -h`.
- You can see all recognized dags using `airflow list_dags`.
- Example Dag:
```python
# Import the DAG object
from airflow.models import DAG

# Define the default_args dictionary
default_args = {
  'owner': 'dsmith',
  'start_date': datetime(2020, 1, 14),
  'retries': 2
}

# Instantiate the DAG object
etl_dag = DAG(dag_id='example_etl', default_args=default_args)
```
- You'll spend most of your time on the **Dags Page**.
- The **Dag Detial View** gives us specific details about the dag task.


# Implementing Airflow DAGs
- **Airflow Operators** represent a single task in a workflow.
- The `BashOperator` requires three arguments:
  1. `task_id`; the name in the UI
  2. `bash_command`; the raw command or script
  3. `dag`; the actual DAG it's attached to.
- Try not to use Environmental variables since they're not going to be defined.
- Can be tricky to run tasks with elevated privileges.
```python
# Import the BashOperator
from airflow.operators.bash_operator import BashOperator

# Define the BashOperator
cleanup = BashOperator(
    task_id='cleanup_task',
    # Define the bash_command
    bash_command='cleanup.sh',
    # Add the task to the dag
    dag=analytics_dag
)
```

# Maintaining and monitoring Airflow workflows

# Building production pipelines in Airflow

# Review:

# Reference:
