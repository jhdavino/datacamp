# Experimental Design in R
## Kaelen Medeiros

# Introduction to Experimental Design
- Starts with a Question in mind.
- Steps of an Experiment:
  1. Planning
  2. Design
  3. Analysis
- For planning, you have a dependent variable - what you are trying to measure - and independent variables - what explains the outcome.
- To keep bias low, you need to:
 * Randomize.
 * Replication.
 * Blocking.
- **Randomizatoin** evenly distributes any variability in outcome due to outside factors across treatment groups.
- **Replication** must repeat an experiment to fully access variability.
- To run a two sided T-Test use `t.test(x = ToothGrowth$len, alternative = "two.sided" , mu = 18)`.
- Generate and Analysis of Variance using the function `aov(<formula>, <data>)`.
```
 aov() creates a linear regression model by calling lm() and examining results with anova() all in one function call.
```
- There are two elements to a Hypthosis: the **Null Hypothesis** and the **Alternative Hypothesis**.
- The **Null Hypthosis** means that there was no change; or, that there is no difference.
- **Power** is the probability that the test is correct in rejecting the Null hypothesis when the test is true.
- The guideline is the have *80%* power in experiments.
- The **Effect Size** is the standardized measure of the the difference you're trying to detect.
- **Sample Size** is how many units there are in your experiment.
- In general, the larger your sample size, the larger your *Power* is.
- You can use the package *pwr* to calculate power for different statistical methods.
- You can calculate the power of an anova test using `pwr::pwr.anovea.test( )`.
- One of the inputs into this function must be *NULL* so that it can be calculated.
- The inputs are:
  * `k`: The number of groups.
  * `n`: The number of units in the sample size per group.
  * `f`: The effect size.
  * `sig.level`: The level of significance expected.
  * `power`: The power attribute.
- It can also be used for other tests.


# Basic Experiments
- If we have more than one group to compare, then we use an **Analysis of Variance** test - *ANOVA*.
- We wont know which group's mean is different without extra testing.
- There are two ways to do this in R:
  1. Build One:
    * Build a model with `lm()` or `glm()`.
    * Pass that model into `anova()`.
  2. Build Two:
    * Call `aov()` directly.
- A **Single Factor Experiment** is where there is two variables; the dependent and independent variables.
- Should also have a random sample design.
- A **Multiple Factor Experiment** is where there is a single outcome variable and more than one dependent variable.
- You can use the function `recode()` to update, condense, or expand categorical variables in a dataset.
```R
purpose_recode_model <- lm(funded_amnt ~ purpose_recode, data = lendingclub )

# Look at results of purpose_recode_model
summary( purpose_recode_model )

# Get anova results and save as purpose_recode_anova
 purpose_recode_anova<- anova( purpose_recode_model )

# Look at the class of purpose_recode_anova
class( purpose_recode_anova )
```
- You can use the function `TukeyHSD( <model> )` to compare the model's features variable-by-variable.
```R
# Use aov() to build purpose_recode_aov
purpose_recode_aov <- aov(funded_amnt ~ purpose_recode, data = lendingclub )

# Conduct Tukey's HSD test to create tukey_output
tukey_output<- TukeyHSD( purpose_recode_aov )

# Tidy tukey_output to make sense of the results
tukey_output %>% tidy()
```
- Before modeling, you should do some Exploratory Data Analysis.
- Then, you can do the modeling.
- Finally, you should do post model verification too.
- Make sure to try non-parametric alternatives to ANOVA.
- You can test the **Homogeneity of Variance** using the function `bartlett.test( <int_rate ~ grade>, data = <lendingclub> )`.
```R
# Conduct the Kruskal-Wallis rank sum test
kruskal.test(int_rate ~ grade ,
             data = lendingclub )
```
- An **A/B Test** is a controlled experiment with only two variants of something.
- *Power* and *Sample Size* in *A/B Testing* are crucial.


# Randomized Complete (& Balanced Incomplete) Block Designs

# Latin Squares, Graeco-Latin Squares, & Factorial Experiments

# Research:
- Mann-Whitney U?
- Kruskal-Wallis rank sum test

# Reference:
