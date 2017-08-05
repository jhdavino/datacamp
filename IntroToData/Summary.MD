# Introduction to Data
## Mine Cetinkaya-Rundel

# Language of Data
- Data is in thee openintro package.
- Load the data into the parent frame using `data(hsb2)`.
- View the structure of data using `str()`.
- You can also use `dplyr::glimpse()`.
- Types of variables:
	1. Numerical
		- Continuous
		- Discrete 
	2. Categorical/Qualitative
		- Ordinal
- There are multiple categorical types in R.
- Factors are ..
	- Important for statistical modeling.
	- Sometimes undesirable, sometimes essential
- This is commonly used for subgroup analysis.
- You can find this using the `table()`.
- `%>%` is pipe operator.
- `==` is operator for 'is equal to'.
- You can drop unused levels using `droplevels()`.
- If you wrap a code block in parenthesis then R will both save and print.
- Class will use ggplot2 since it doesn't suck.

# Study Types and Cautionary Tales
- *Observational Studies* vs *Experimental Studies.*
- *Observational Studies* collect data in a way that does not interefere with how the data arise.
- Therefore, only correlation can be inferred.
- *Experimental Studies* allow for control of the variables.
- Therefore, a claim of causality is possible.
- *Random Sampling* is a selection of subjects from the population.
- *Simpson's Paradox* is when a confounding variable reverses the relationship between the studied variables.

# Sampling Strategies and Experimental Design
- Why do a sample instead of a Census?
	1. Census are resource intensive.
	2. Certain individuals are near impossible to reach.
	3. Populations are constantly changing.
- Different kinds of sampling:
	1. Simple Random Sample
	2. Stratified Sampling.
	3. Cluster Sampling.
	4. Multistage Sampling.
- There is a function in `dplyr` explicitely for sampling - called `sample_n()`.
- You can control the size of the sample using the parameter `size` in `sample_n()`.
- Principles of Experimental Design
	1. *Control*: compare treament of interest to a control group.
	2. *Randomize*: randomly assign the subjects to treatments
	3. *Replicate*: collect a sufficiently large sample within a study, or replicate the entire study.
	4. *Block*: account for the potential effect of confounding variables.

# Case Study
- NULL.

# Research

# Reference