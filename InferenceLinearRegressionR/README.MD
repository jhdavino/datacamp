# Inference for Linear Regression
## Jo Hardin

# Inferential Ideas
- Focused on Inferential claims about models.
- We will use the least squares estimation.
- Create confidence intervals for the slope.
- You can use the function `tidy(<model>)` to create a "pretty printed" version of the output.
- You can sample from a dataset using `sample_n(<data>, <n>)`\
- You can sample multiple sets from a data set using `oiolabs::rep_sample-n(<data>, size = <n>, reps = <samples_n>)`.
- You can insert a function to run in a `do()` call within the pipe structure:
```r
results <- <data> %>%
  group_by( <replicate> ) %>%
  do( lm(response ~ explanatory, data = .) %>% tidy) %>%
  filter( term == "explanatory")
```
- Always decide on a research question *before** collection data.
- The **Standard Error** represents how much the line varies from the data.
- The **t-Statistic** a standardized estimate.
- It measures the number of standard errors that the estimate is above 0.
- The default p-value is two sided.
- Keep in mind that R does not know what your research question is.


# Simulation-based Inference for the Slope Parameter
- There is a translated `lm()` version to a piped version below:
```r
twins %>%                                     # data
  specify(Foster ~ Biological) %>%            # select model variables
  hypothesize(null = "independence") %>%      # test for
  generate(reps = 10, type = "permute") %>%   # sampleing.
  calculate( stat = "slope")                  # which statistic are we after
```
- These functions come from the package `infer`.
- You can use `pull()` to return an explicate column of data from the piping.
- A **Null Sampling Distribution** is used as a benchmark to compare the data against.
- The difference between a **Permuted Dataset** and a **Bootstrapped** one is that the permuted on is centered at "no relationship".
- To generate a *Bootstrapped Sample* pass parameter `type="bootstrap"` to `generate()`.
```r
<data> %>%
  specify( <model> )
  generate( reps = <b>, type = "bootstrap") %>%
  calculate( stat = 'slope')
```

# t-Based Inference for the Slope Parameter
- You can calculate a statistical function using `stat_function( fun = <dt>, color = 'red', args = list(df = nrow(starbucks) - 2))`
- You can test if a p-value is significant using the function `pt(<p.value>, df = <nrow - 2>)`.
- The t-statistic is calculated using the formula `estimate - 1 / standard_error`
- If you want `tidy()` to pass along the confindence intervals as well, then add the parameters `conf.int = TRUE, conf.level=1-<alpha>`.
- You can also use bootstrapping to create a sample of the *Confidence interval*.
- The function `augment()` is sort of like the `predict()` function in that it returns what our model would predict.
```r
lm(Foster ~ Biological, data = twins) %>%
  augment(newdata = <newdata>) %>%
  mutate(lowMean = .fitted - crit_val*.se.fit,
         upMean = .fitted + crit_val*.se.fit)
```
- You can use `broom::glance()` on a model to generate and add many of the reliability statistics.

# Technical Conditions in Linear Regression
- We can only use a linear assumption when:
  1. It's actually a linear model.
  2. The observations are independent.
  3. Points are normally distributed around the line.
  4. Equal variability around teh line for all values of X.
- The function `broom::augment()` calculates the residual for every point in the dataset.
- If the assumption is justifiable, then a plot of `.fitted vs .resid` should not display any apparent patterns.
- A few outliers have an out of step impact on conclusions.
- You can transform the values of x without changing the residuals.
- Using the log transform on the response is an excellent idea when the variance is unequal.

# Building on Inference in Simple Linear Regression
- If we transform a non-linear into a linear then the change in X is with respect to the non-linear original function.
- If both are being transformed via natural log, then we say that "percent change in Y for each 1% change in X".
- **Multicollinearity** is when some variables are correlated with one another.
- When features are related it will be much harder to interpret data.

# Research:

# Reference:
