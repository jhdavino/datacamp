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
- `kmeans()` assumes tidy data format.
- *Kmeans* could also not solve the problem since it's random.
- **`nstart`** will tell the function how many times to run.
- You can get access to which cluster items belong to using **`<model_name>$cluster`**.
- *Kmeans* uses the total within a cluster's sum of squares.
- To garuntee reproducability, make sure to use the `set.seed()` function.
- A *Scree plot* is a set of plots that shows changes to variables being tested.
- You can cap out the number of iterations in `kmeans()` by passing `iter.max = <n>`.

# Heirarchical Clustering
- You can use the `dist()` function to calculate the Euclidean distance between all points in a matrix.
- You can create a *Heriarchical Cluster Model* using the `hclust()` function.
- The normal plot for a heirarchical clustering is not very useful; instead, use a Dendogram.
- The `plot()` function will do this on its own without modification.
- You can tag each point into distinct clusters using `cutree()`.
- This function can accept:
	* `h = <n>` for height limit of tree.
	* `k = <n>` for number of clusters.
- There are four ways to link point into clusters
	1. Pairwise: all observations, largest similarities.
	2. Single: all observations, smallest of similarities.
	3. Average: all observations, average similarities.
	4. Centroid: calculate centriods, and then compare.
- Complete and average are the most commonly used.
- Single tends to produce unbalanced trees.
- Fast initial joins, but flattens out.
- To select method, pass parameter `method = "<type>"` to hclust.
- One should scale all points to prevent outlier like issues.
- R has a function to scale inputs called `scale()`.
- `colMeans()` will take a matrix and calculate the mean value per column.

# Dimensionality Reduction: PCA
- The point of Dimensionality Reduction is..
	* To find structure in features.
	* To Aid in visualization
- We're going to be using *Principle Component Analysis* (PCA).
- Three goals:
	1. Find the linear combination of original features.
	2. Will maintain as much variance as possible.
	3. New features are orthoganal to each other.
- To do this in R, use the `prcomp()` function.
- Some parameters you can pass are:
	* `scale` the data by the standard deviation.
	* `center` the data by normalizing around the mean.
- There are two kinds of plots to be built from PCA:
	1. `biplot()` which shows the direction of the PCAs.
	2. Scree plot which requires:
		* square the <model>$sdev and save as variance.
		* normalize by <var>/sum( <var> )
- There are three issues to watch out for:
	1. Scaling of data?
	2. What to do with missing values?
	3. How to handle features that are not numerical?

# Putting it All Together: Case Study
- NULL

# Research
- kmeans mathematical formula.

# Reference
