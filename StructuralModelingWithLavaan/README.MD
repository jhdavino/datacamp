# Structural Equation Modeling with lavaan in R
## Erin Buchanan

# One Factor Models
- Structural Equation Modeling is appreviated as **SEM**.
- It's purpose is to explore the relationship between variables.
- To confirm the structure of a developed model.
- There are two kinds of Variables:
  1. **Manifest Variables**:
    * Real numbers in your dataset.
    * Represented by Squares.
  2. **Latent Variables**:
    * Phenomenon measured by manifest variables.
    * Represented by Circles.
- Load the library with `libray( lavaan )`.
- We're going to be using the dataset *HolzingerSwineford1939*.
- The formula is a bit different for these models; it uses a `=~` to indicate the direction.
```r
# Define your model specification
text.model <- "textspeed =~ x4 + x5 + x6 + x7 + x8 + x9"
```
- **Degrees of Freedom** is the number of manifest variables and estimated values.
  - `df = Possible Values - Estimated Values`
  - `Possible-Variables = Manifest-Variables * ( Manifest-Variables + 1) / 2`
- The model must:
  1. Inlclude at least three manifest variables.
  2. Create models with df > 0.
  3. Use Scaling and constrains to control df.
- The function `cfa()` runs a confirmatory Factor Analysis.
```r
visual.fit <- cfa( model = <model>,
                    data = <data>)
```
- You can see a summary of the model with the function `summary()`.
- **Loadings** is the strength of the relationship of the manifest variables to the latent variable - and it tends to be easier to interpret.
- You can get standardized z-scores by passing `standardized = TRUE` to the function `summary()`.
- The accepted value for a loading is .3; for some reason.
- Then, we can use **Comparative Fit Index** or **Tucker Lewis Index** to measure the *Goodness of Fit* the model.
- Then, we can use the **Root Mean Square Error of Approximation** or **Standardized Root Mean Square Residual** to measure the **Badness of Fit** of the model.
- To see the most common measures of fit by passing the parameter `fit.measures = TRUE` to the function `summary()`.


# Multi-Factor Models

# Troubleshooting Model Errors and Diagrams

# Full Example and an Extension

# Research:
- Comparative Fit Index?
- Tucker Lewis Index?
- Root Mean Square Error of Approximation?
- Standardized Root Mean Square Residual?

# Reference:
- [Measure Model Fit](http://davidakenny.net/cm/fit.htm).
