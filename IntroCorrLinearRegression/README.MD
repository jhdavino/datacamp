# Intro to Statistics with R: Correlation and Linear Regression
## Andrew Conway

# An Introduction to Correlation Coefficients
- We'll be learning about two ways to calculate r:
  1. Raw score formula.
  2. Z score formula.
- r is the degree to which X and Y vary together and relative to the degree that they vary independently.
- Formula: r = ( Covariance of X,Y )/ Variance( X, Y).
- **Correlation** is just a statistical procedure used to measure and describe the relationship between two variables.
- They can range between -1 and 1.
- The function `describe` will tell you the summary statistics for the data frame.
- You can use the function `cor()` to generate the pairwise Correlation Matrix.
- The function `cor.test()` can be used to test if the relationship between two variables is significant or not.
- **CORRELATION DOES IMPLY CAUSATION**.
- The magnitude of the correlation depends on a lot of factors.
  * Sampling.
  * Measurement of the variables.
- **Tenuation of Correlation Due to Restriction of Range**.
- The restriction of variance disallows one to find a meaningful covariance.


# An introduction to Linear Regression
- **Regression**: a statistical analysis used to predict score on an outcome variable based on one or more predictor variables.
- You can use the `corrplot::corrplot()` to create a simple graph of correlations across multiple variables.
- You can improve the models using better variables or more variables.
-  You can check the extracted prediction values using the function `fitted()`.
- The mantra of Linear Regression is **Minimize the Residuals**.
- The standardization of the x,y variables allows us to simplify the formula and then we don't have to worry about the scaling of the variables.
- This is only true in simple regression though.
- You can use the function `scale()` to normalize the values in input.
- You can use the expression `rSquared <- summary( <model> )$r.square` to extract the *R-Squared* values.
- There are assumptions necessary to accept the results:
  1. Normal distribution of Y.
  2. Linear Relationship between Y and X.
  3. Homoscedasicity.
- **Anscombe's Quartet**.
- You can use the function `resid()` to collect the *residuals* from a model.

# Research:

# Reference:
