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
- The guidline is the have *80%* power in experiments.
- The **Effect Size** is the standardized measure of the the difference you're trying to detect.
- **Sample Size** is how many units there are in your experiment.
- In general, the larger your sample size, the larger your *Power* is.
- You can use the package *pwr* to calculate power for different statistical methods.
- You can calculate the power of an anove test using `pwr::pwr.anovea.test( )`.
- One of the inputs into this function must be *NULL* so that it can be calculated.
- The inputs are:
  * `k`: The number of groups.
  * `n`: The number of units in the sample size per group.
  * `f`: The effect size.
  * `sig.level`: The level of significance expected.
  * `power`: The power attribute.
- It can also be used for other tests.


# Basic Experiments

# Randomized Complete (& Balanced Incomplete) Block Designs

# Latin Squares, Graeco-Latin Squares, & Factorial Experiments

# Research:

# Reference:
