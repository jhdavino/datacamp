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
- Constraints are used to fix non-identified models.
- In the Constraint, we set the parameters equal to one another.
- This allows us to calculate one number, instead of serveral.
```r
# Update the model specification by setting two paths to the label a
text.model <- 'text =~ x4 + a*x5 + a*x6'

# Analyze the model
text.fit <- cfa(model = text.model, data = HolzingerSwineford1939)

# Summarize the model
summary(text.fit, standardized = TRUE, fit.measures = TRUE)
```
- Create a multifactor model:
```r
# Create a two-factor model of text and speed variables
twofactor.model <- 'text =~ x4 + x5 + x6
  speed =~ x7 + x8 + x9'
```
- You might think the two models are independent of one another, but both the latent values are correlated with one another.
- We do not want the correlation to get too close to 1 else the model will not run.
- Symbols:
  * `=~`: creates latent variables.
  * `~~`: covariance between variables.
  *  `~`: creates a direct prediction between variables.
```r
# Specify a three-factor model with one correlation set to zero
epi.model <- 'extraversion =~ V1 + V3 + V5 + V8
neuroticism =~ V2 + V4 + V7 + V9
lying =~ V6 + V12 + V18 + V24
extraversion ~~ 0*neuroticism'
```
- To imporve the model, we'll want to check for low latent relations as well as improbable error values.
- When a model goes wrong, the estimated Variance will be very large in comparison to the rest of the data.
- **Modification Indexes** indicate improvements on a model if the suggested estimate is added to the model.
- You can view this information by using the function `modificationindices( <model>, sort = TRUE)`.
- The function `fitmeasures()` will show you lots of other measurements of fit.
- `ecvi` indicates how well you can expect it to replicate.
- If you don't want all of them, then you can pass a vector of the features you want to `fitmeasures()`.
```r
# Analyze the original model
epi.fit <- cfa(model = epi.model, data = epi)

# Analyze the updated model
epi.fit1 <- cfa(model = epi.model1, data = epi)

# Compare those models
anova(epi.fit, epi.fit1)
```


# Troubleshooting Model Errors and Diagrams
- **Heywood Cases** are when the correlations between variables is over the absolute value of One.
- They also occur when negative variances occur for a model.
- Always check for warning and errors after using the function `cfa()`
- The reasons for a negative variance could be:
  * Model might be misspeficied or under identified.
  * Model might have a smaller sample size or sample fluctuations.
  * Manifest variables might have scales that are too different.
  * Skewed or non-normal data.
- The error *model has NOT converged* is for negative variance.
- The parameter `rsquare = TRUE` passed to `summary()` will show you how much variance is accounted for in each manifest variable.
- When correcting problems, always try and stick to one change at a time.
```r
# Summarize the model to view the negative variances
summary(adopt.fit, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)

# View the variance of the problem manifest variable
var(adoptsurvey$wagstail)

# Update the model using 5 decimal places
adopt.model2 <- 'goodstory =~ pictures + background + loveskids
inperson =~ energy + wagstail + playful
wagstail ~~ 23.07446 * wagstail'

# Analyze and summarize the updated model
adopt.fit2 <- cfa(model = adopt.model2, data = adoptsurvey)

# Summarize the model to view the negative variances
summary(adopt.fit2, standardized = TRUE, fit.measures = TRUE, rsquare = TRUE)
```
- We will use a different package to diagram the models that we've been building: **semPlot**.
- You will pass the model fit from function `cfa()` to the function `semPaths( Object = <model.fit>)`.
- The double ended arrows indicate variances.
- The double header arrows between the latent's are covariances.
- The dashed/straight arrows pointing indicate marker variables for the coefficient estimates.
- The parameter `whatLabels` indicates what text labels will end up on the graph.
- The parameter `edge.label.cex = 1` tells it how large the font should be for the labels.
- You can also include the parameter `layout` which can be set to:
  1. circle.
  2. tree : default.
  3. spring
  4. tree2.
  5. circle2
- You can also pass the parameter `rotation = 2` to pivot the graph in case you have a lot of variables.
- The parameter `what = 'std'` will color the arrows based on the strength of the estimates.
- The parameter `edge.colo = "purple"` colors those arrows.
```r
# Load the library
library(semPlot)

# Update the default picture
semPaths(object = adopt.fit,
         layout = "tree",
         rotation = 2,
         whatLabels = "std",
         edge.label.cex = 1,
         what = "std",
         edge.color = "blue")
```


# Full Example and an Extension
- Walkthrough.
- When you had a second level of Latent Variables, there will be no changes in fit.
```r
# Load the library
library(semPlot)

# Update the default picture
semPaths(object = wais.fit3,
         layout = "tree",
         rotation = 1,
         whatLabels = "std",
         edge.label.cex = 1,
         what = "std",
         edge.color = "navy")
```



# Research:
- Comparative Fit Index?
- Tucker Lewis Index?
- Root Mean Square Error of Approximation?
- Standardized Root Mean Square Residual?
- H.B. Heywood?
-

# Reference:
- [Measure Model Fit](http://davidakenny.net/cm/fit.htm).
