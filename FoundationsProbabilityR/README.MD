# Foundations of Probability in R
## David Robinson

# The Binomial Distribution
- **Probability** is the study of turning models into data.
- One simulated event is called a draw.
- To simulate a binomial draw, you can use the `rbinom()` function, where
  * n = number of draws.
  * m = number of coins flipped per draw.
  * p = Probability of a heads.
- We're going to interpret 1 as heads and 0 as tails.
- *Binomial Distribution* is a mathematical description of the potential outcomes.
- You can calculate the exact Probabilistic Density using `dbinom()`.
  * n = density.
  * m = # of coins.
  * p = Probability of a heads.
- The **Cumulative Density** is the probability equal to or less than the event.
- The function `pbinom()` will calculate the *Cumulative Probability* of a binomial distribution.
```
# Calculate the probability that at least five coins are heads
1 - pbinom(4, 10, .3)

# Confirm your answer with a simulation of 10,000 trials
mean( rbinom(10000, 10, .3) >= 5)
```
- Two fundametally important Statistics of a distribution are:
  1. The middle of the distribution.
  2. The spread of the distribution.
- The **Expected Value** is what we expect the middle value to be.
- You can get this the size times the probability.
- **Variance** is the average square distance from the mean of the sample.
- The function `var()` will calculate the *Variance*.
- The *Binomial Variance* follows the rule size times probability of the event times 1 - p.

# Laws of Probability
- The probability of a coin flip is just an event.
- This event can be anything and is not limited to coin flips.
- The Probability of two coin flips is written: Pr(A and B) = Pr( A ) * Pr( B ).
- R has the `&` operator for logical And.
- The Probability of two coin flips is written: Pr(A or B) = Pr( A ) + Pr( B ) - Pr( A and B ).
- R has the `|` operator for logical Or.

# Bayesian Statistics
- We use the sample data to help us predict what the real probability is.
- Pr( Biased | 14 Heads) = (# biased w 14 heads)/(# total with 14 heads).
- The **Prior Probability** is what you believe before you start accepting data.
- The **Posterior Probability** is what you believe after accepting data.
- You will use the function `dbinom()` to predict the density of the Binomial data.
  * Passing parameters `number of positive events, number of observations, expected probability`.
  * This will be multiplied by your Prior Probability.
- **Conditional Probability**: Pr( Biased | 14 heads) = Pr( 14 heads and biased) / ( Pr( 14 heads and biased) + Pr( 14 heads and fair)).

# Related Distributions
- Now we're going to explore three other distributions:
  1. The Normal ( Guassian ) Distribution
  2. The Poisson Distribution.
  3. The Geometric Distribution.
- The Normal Distribution is famous because many observable phenomenon take this shape.
- It is defined via the Mean and the Standard Deviation.
- They are signified using the greek letters mew and sigma respectively.
- The **Standard Deviatoin** is the square root of the variance.
- You simulate the **Normal Distribution** using the function `rnorm()`.
  * Parameters are `n draws, mean, standard deviarion`.
- The function `pnorm()` will calculate the **Cumulative Probability** of the *Normal Distribution*.
  * n heads you're flipping.
  * mew mean of the distribution.
  * std the standard deviation of the distribution.
- The **Poisson Distribution** is meant to determine how often a rare event should be expected.
- This doesn't look like a Bell curve nor does it look symmetrical at all.
- The *Poisson Distribution* is described by only a single parameter: the mean.
  * Called Lambda.
- The function `rpois()` to simulate a *Poisson Distribution*.
  * n observations.
  * m/1000 for the event probability.
- The variance is equal to the mean.
- The mean can be any number as long as it's positive.
- The function `dpois()` will give you the probability of the Poisson value showing up.
  * v the value you expect.
  * lambda the mean of the distribution.
- You can ask R to repeat code using the function `replicate()`.
  * n times to run.
  * f code to run.
- You can use the function `rgeom()` to simulate draws from a **Geometric Distribution**.
  * n draws.
  * p probability of event.

# Research:
- Poisson Distribution?
- Geometric Distribution

# Reference:
