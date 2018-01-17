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
- 



# Technical Conditions in Linear Regression

# Building on Inference in Simple Linear Regression

# Research:

# Reference:
