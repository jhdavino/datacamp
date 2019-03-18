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
- **Randomization** evenly distributes any variability in outcome due to outside factors across treatment groups.
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
    * Build a model with `lm()` or `gml()`.
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
- We're going to explore the *National Health and Nutrition Examination Survey* - NHANES.
- In this course, we're going to address **Probability Sampling**; where probability is used to select sample size.
- Types of samples:
  1. Simple Random Sample: `sample()`.
  2. Stratified Sampling: `dts %>% group_by() %>% sample_n()`.
  3. Cluster Sampling: `sampling::cluster( dts, cluster_var_name, number_to_select, method = "options")`.
  4. Systemic Sampling.
  5. Multi-stage Sampling.
- You can use the function `simputation::impute_median()` to correct missing values in a dataset.
```R
# Load sampling package and create nhanes_cluster with cluster()
library( sampling )
nhanes_cluster <- cluster(nhanes_final, c('indhhin2'), 6, method = "srswor")
```
- **Randomized Complete Block Designs** - RCBD.
- "Block what you can; randomize what you can't."
- The package `agricolae` package allows you to draw some of the Experimental Designs.
- You can build this using the function `design.rcbd( <treatment-group>, r = <repetitions>, seed = <n>, serie = <n>)`
- The parameter `serie` is for tagging groups in larger experiments.
- You can check the breakdown using `design.rcbd.object$sketch`.
```R
# Build trt and rep
trt <- LETTERS[1:5]
rep <- 4

# Use trt and rep to build my_design_rcbd and view the sketch part of the object
my_design_rcbd <- design.rcbd(trt, r=rep, seed = 42, serie=0)
my_design_rcbd$sketch
```
```R
with(nhanes_final, interaction.plot(riagendr, mcq365d, bmxwt))
```
- When you can't fit each treatment in a block, then you use a **Balanced Incomplete Block Design**.
- When **Lambda**, which is <rep>* ( <k> - 1 / <t> - 1), is not a whole number then a BIBD is not possible.
```R
my_design_bibd_1 <- design.bib(LETTERS[1:3], k = 4, r = 16, serie = 0, seed = 42)
```


# Latin Squares, Graeco-Latin Squares, & Factorial Experiments
- **Latin Squares** have the following attributes:
  * Two blocking factors.
  * All factors must have the same number of levels.
  * Key assumption is the treatment and two blocking factors do *not* interact.
  * Analyze like a RCBD.
- Both the rows and columns of a *Latin Square* are blocking factors.
- Check for missing values using `mice::md.pattern( )`
```r
# Load agricolae
library( agricolae )

# Design a LS with 5 treatments A:E then look at the sketch
my_design_lsd <- design.lsd( LETTERS[1:5], serie = 0, seed = 42)
my_design_lsd$sketch
```
- **Graeco-Latin Squares** are similar to *Latin Squares* except they have three blocking factors.
- The Greek letters are added next to the other letters to indicate the treatment.
```r
# Create trt1 and trt2
trt1 <- LETTERS[1:5]
trt2 <- 1:5

# Create my_graeco_design
my_graeco_design <- design.graeco(trt1, trt2, serie = 0, seed = 42)

# Examine the parameters and sketch
my_graeco_design$parameters
my_graeco_design$sketch
```
- **Factorial Experiments** is an experiment where two or more variables are combined and crossed.
- All possible interactions between levels of factors are considered as effects.
- You use the `*` for interactions in the `lm()` function or the `aov()` function.
- You can test for normality using the function `shapiro.test()`.


# Research:
- Mann-Whitney U?
- Kruskal-Wallis rank sum test?
- Voluntary Response Sampling?
- Convenience Sampling?
- Shapiro.test?
- Fractional Factorial Design?
- Nested Design?
- Split Plot Design?
- Lattice Design?

# Reference:
