# Introduction to AWS Boto in Python
## Maksim Pecherskiy

# Putting Files in the Cloud!
- Boto3 is a package/server that is owned and developed by AWS.
- You import it using `import boto3`.
- You initalize it using the format:
```python3
s3 = boto3.client(
  's3',
  region_name='us-east-1',
  aws_access_key_id=<AWS_KEY_ID>,
  aws_secret_access_key=<AWS_SECRET>)
```
- The service name can be any of the 100s of AWS services.
- You can then get the buckets using `reponse = s3.list_buckets()`.
- You will create an account at [AWS](AWS.amazon.com).
- We create **IAM Users** to manage access to different services.
![Permissions to Set](images/boto-iam-permissions.png)
- S3 allows us to put images up and make them access to anywhere in the world.
- The main components are **Objects** and **Buckets**.
- *Buckets* are like folders on our desktop.
- *Objects* are like files in those folders.
- They have their own permission policies.
- They can also serve as Website storage for static sites.
- They also generate logs about their own activity.
- Actions we can do with buckets are:
  1. Create them.
  2. List their contents.
  3. Delete them.
- You can create a bucket using:
```python
bucket = s3.create_bucket(Bucket='gid-requests')
```
- Bucket names need to be unique across all of s3.
- You can get the dictionary of buckets using:
```python
buckets = bucket_response['Buckets']
print( buckets )
```
- To delete a bucket you would do:
```python
response = s3.delete_bucket('<bucket-name>')
```
- Iterate over names of buckets:
```python
# Iterate over Buckets from .list_buckets() response
for bucket in response['Buckets']:

  	# Print the Name for each bucket
    print(bucket['Name'])
```
![Compare Buckets vs Objects](images/objects-vs-buckets.png)
- You can upload a file using:
```python
s3.upload_file(
  Filename='<local-file>',
  Bucket='<bucket-name>',
  Key='<filename-in-bucket>'
)
```
- You can get a list of files using:
```python
response = s3.list_objects(
  Bucket='<bucket-name>',
  MaxKeys=<n>, # limit number of responses; max 1000.
  Prefix='<string-match-prefix>'
)
```
- If you want the metadata for a single object, then you can use:
```python
response = s3.head_objects(
  Bucket='<bucket-name>',
  Key='<filename>'
)
```
- To download files, we use the function:
```python
s3.download_file(
  Filename='<file-name-local>',
  Bucket='<bucket-name>',
  Key='<filename-in-cloud>'
)
```
- You can delete an object using:
```python
s3.delete_object(
  Bucket='<bucket-name>',
  Key='<filename-in-cloud>'
)
```
- Examples:
```python
# Upload final_report.csv with key 2019/final_report_01_01.csv
s3.upload_file(Bucket='gid-staging',
               # Set filename and key
               Filename='final_report.csv',
               Key='2019/final_report_01_01.csv')

# Get object metadata and print it
response = s3.head_object(Bucket='gid-staging',
                       Key='2019/final_report_01_01.csv')
```
```python
# List only objects that start with '2018/final_'
response = s3.list_objects(Bucket='gid-staging',
                           Prefix='2018/final_')

# Iterate over the objects
if 'Contents' in response:
  for obj in response['Contents']:
      # Delete the object
      s3.delete_object(Bucket='gid-staging', Key=obj['Key'])

# Print the remaining objects in the bucket
response = s3.list_objects(Bucket='gid-staging')

for obj in response['Contents']:
  	print(obj['Key'])
```


# Sharing Files Securely

# Reporting and Notifying!

# Pattern Rekognition

# Research:

# Reference:
