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
- 


# Related Distributions

# Research:

# Reference:
