# Unsupervised Learning in R
## Hank Roark

# Unsupervised Learning in R
- Overview:
	1. Unsupervised Learning.
	2. Three major types of Machine Learning.
	3. Execture one type.
- Three type of Machine Learning
	1. Unsupervised Learning; unstructured/unlabled data.
	2. Supervised: Making Predictions.
	3. Reinforcement Learning.
- In unsupervised learrning..:
	* Find homogenous subgroups within larger group.
	* Finding patterns in the data.
	* Preprocessing for Supervised learning.
- There is more unlabeled data than labeled data.
- The first clustering algorithm we'll study is K-Means Clustering.
- To use call `kmeans( **<dataframe>**, centers = **<n>**, nstart = **<n>**)
- `kmeans()` assumes tidy data.
- *Kmeans* could also not solve the problem since it's random.
- **`nstart`** will tell the function how many times to run.
- You can get access to which cluster items belong using **`<model_name>$cluster`**.
- *Kmeans* uses the total within a cluster's sum of squares.
- To garuntee reproducability, make sure to use the `set.seed()` function.
- A *Scree plot* is a set of plots that shows changes to variables being tested.
- You can cap out the number of iterations in `kmeans()` by passing `iter.max = <n>`.

# Heirarchical Clustering


# Dimensionality Reduction: PCA


# Putting it All Together: Case Study

# Research
- kmeans mathematical formula.


# Reference
