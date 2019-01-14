# Differential Expression Analysis in R with limma
## John Blischak

# Differential Expression Analysis
- **Differential Expressions** are statistical comparisons of different measured groups - generally genetics or cells.
- A higher expression level is called **Upregulated**.
- A lower expression level is called **Downregulated**.
- `The overall goal is to identify genes that are associated with a phenotype of interest.`.
- Why *Differential Expression*?:
  1. Novelty: Are there additional genes of interest.
  2. Context: Is the given measurement for the gene unique or common?
  3. Systems: Which biological pathways are important?
- Steps of an experiment:
![Steps to an Experiment](./images/Experimanetal-Steps.png)
- **Caveats**:
  * Measurements are relative, not absolute.
  * Statistical methods cannot rescue from a poorly design study.
```
# Create a boxplot of the first gene in the expression matrix
boxplot(x[1,] ~ p[, 'Disease'], main = f[1,'symbol'])
```
- To limit typos, we will be using *Objects* from the **Bioconductor** packages to manage data.
- A **Class** defines a structure to hold complex data.
- An **Object** is a specific instance of a class.
- A **Method** are functions that work on a specific class.
- To install *Bioconductor*, please do this:
```
source("https://bioconductor.org/biocLite.R")
biocLite("Biobase")
```
- We will use the package `Biobase` after it is installed.
```
# Create ExpressionSet object
eset <- ExpressionSet(assayData = x,
                      phenoData = AnnotatedDataFrame(p),
                      featureData = AnnotatedDataFrame(f))
```
- This object can include other pertinent information such as who did the experiment, but we wont be using it.
- You can get access to the different parts of the object using the functions:
  1. `exprs()` for the *Expression Matrix*.
  2. `fData()` for the *Feature Data*.
  3. `pData()` for the *Phenotype data*.
- Now we're going to learn about the package `limma`.
- Advantages of `limma`:
  * Testing thousands of genes would require a lot of boilerplate code.
  * Functions run on the data is ran on all the genes in the dataset.
  * It uses Empirical Bayes.
  * It has lots of functions for pre and post processing.
- Install it using:
```
source("https://bioconductor.org/biocLite.R")
biocLite("limma")
```
- Here is what the *linear Model* looks like:
![Differential Expression Linear Model](./images/Differential-Model.png)
- You use the function `model.matrix( ~<forumula>, data = <data-frame>)`.
- Running a `colSum` on the model to compare the number of positive samples is a good sanity check.
- You fit a model using the function `lmFit(<data>, <model>)`.
- You can calculate the t-statistic using the function `eBayes( <model> )`.
```
# Summarize results
results <- decideTests(fit[, "er"])
summary(results)
```
- **R automatically chooses the base condition by alphabetical order**.
```
# Create design matrix for leukemia study
design <- model.matrix(~Disease, data = pData(eset))

# Count the number of samples modeled by each coefficient
colSums(design)
```
- **Note that this coefficient name was created by concatenating the column name and the value of the variable that is modeled by that coefficient**.
```
# Load package
library(limma)

# Fit the model
fit <- lmFit(eset, design)

# Calculate the t-statistics
fit <- eBayes(fit)

# Summarize results
results <- decideTests(fit[, "Diseasestable"])
summary(results)
```


# Flexible Models for Common Study Designs

# Pre- and post-processing

# Case Study: Effect of Doxorubicin Treatment

# Research:

# Reference:
