# Fundamentals of Bayesian Data Analysis in R
## Rasmus Bååth

# What is Bayesian Data Analysis.
- A method for figuring out unobservable quantities given known facts that uses probability to describe the uncertainty over what the values of the unknown quantities could be.
- **Bayesian Data Analysis** is the the use of *Bayes Inference* to learn from data.
- It can be used for most anything that we're already familiar with in Statisticl Modeling.
- Allows you to crate problem specific models.
- A **Probability Distribution** is a set of mutually exclusive potential results.
- The role of *probability distributinos* is to represent uncertainty.
- The role of Bayesian Inference is to update those uncertanties.
- Without data, Bayesian Inference assumes that all outcomes are equally likely.
- A **Prior Probability Distribution** is the uncertainty distribution prior to data.
- The **Posterior Distribution** is what was updated to after including data.
- A **Point Estimate** is used to summarize what is known about a parameter of interest.

# How Does Bayesian Inference Work
- To do **Bayesian Inference**, you will need:
  1. Data.
  2. Generative Model.
  3. Priors.
- A **Generative Model** is anything that you can feed fixed parameters into to generate a model.
  * Computer Program.
  * Mathematical Expression.
  * Set of Rules.
- The parameters of our play model is:
  * Probability of Success.
  * Number of Zombies for the trial.
- Then we need data.
- We want to go the other direction when we have data.
- To include our uncertainty, we will use a uniform distribution from 0,.2 .
- A **Bayesian Model** is the when you have a *Generative Model* and *Priors*.
- The data frame with both `proportion_clicks` as well as `n_visitors` is called the prior.
- The essence of *Baysian Inference* is conditioning on data, in order to learn about parameter values.
- The fourth piece will be the **Computational Method** so you can scale the analysis.

# Why use Bayesian Inference
- It is a very flexible way to analyze data and models.
- You can include information sources in addition to the data.
- You can make any comparisons between groups or data sets.
- You can use the result of a Bayesian analysis to do Decision Analysis.
- You can change the underlying statistical model.
- The Beta Distribution is a useful distribution for our purposes.
- You can generate one using the function `rbeta( <n>, <shape1>, <shape2>)`.
- A **Credible Intervel** is an interval that contains the parameter which a certain probability.
- A **Decisian Analysis** is using the Probability to decide on what you really care about.
- If you have a single event and you would like to calculate the expected probability then you use the Poisson Distribution.
- You can use the function `rpois( <n>, <lambda/observed-events>)` to generate it.
-  Always remember that you're model is still a model.
- Another advantage is that there is a separation between model and computation.
```
# Change this model so that it uses a Poisson distribution instead
n_draws <- 100000
mean_clicks <- runif(n_draws, min = 0.0, max = 80.0)
n_visitors <- rpois(n_draws, mean_clicks)

prior <- data.frame(mean_clicks, n_visitors)
posterior <- prior[prior$n_visitors == 19, ]
hist( prior$mean_clicks )
hist( posterior$mean_clicks)
```

# Bayesian Inference Using Bayes Theorem
- The bad news is that this computation method does not scale.
- The good news is that lots of people are trying to solve this problem.
- The results will be the same but it'll be faster.
- Probability must be between 0 and 1.
- Notation: `P( n_visitors = 13)` means the probability of visitors being 13.
- If you leave off the number, then it stands for the distribution.
- Notation: `P( n_visitors = 13 | prop_clicks = 10%)` means the probability of visitors being 13, given 10% click.
- **Sum Rule**: If two events are mutually exclusive then we can simply add them together to find their probability of outcome.
- **Multiplication Rule**: If two probabilities are unrelated unrelated or independent then we can multiply them together.
- One of the ways that Bayes is sped up is using directly calculated distributions vs simulated ones.
- To do this, you would use the `dbinom()` or `dpois()` functions.
- The **Probability Density** can be thought of as a relative probability.
- The *d* in `dunif()` stands for *density*.
```
# Rewrite this code so that it uses dbinom instead of rbinom
n_ads_shown <- 100
proportion_clicks <- 0.1
prob_13_visitors <- dbinom(13,
    size = n_ads_shown, prob = proportion_clicks)
prob_13_visitors
```
```
n_ads_shown <- 100
proportion_clicks <- seq(0, 1, by = 0.01)
n_visitors <- seq(0, 100, by = 1)
pars <- expand.grid(proportion_clicks = proportion_clicks,
                    n_visitors = n_visitors)
pars$prior <- dunif(pars$proportion_clicks, min = 0, max = 0.2)
pars$likelihood <- dbinom(pars$n_visitors,
    size = n_ads_shown, prob = pars$proportion_clicks)


# Add the column pars$probability and normalize it
pars$probability <- pars$prior * pars$likelihood
pars$probability <- pars$probability / sum( pars$probability )
```
```
# Simplify the code below by directly conditioning on the data
n_ads_shown <- 100
proportion_clicks <- seq(0, 1, by = 0.01)
n_visitors <- 6
pars <- expand.grid(proportion_clicks = proportion_clicks)
pars$prior <- dunif(pars$proportion_clicks, min = 0, max = 0.2)
pars$likelihood <- dbinom(n_visitors,
    size = n_ads_shown, prob = pars$proportion_clicks)
pars$probability <- pars$likelihood * pars$prior
pars$probability <- pars$probability / sum(pars$probability)
plot(pars$proportion_clicks, pars$probability, type = "h")
```
- **Bayes Theorem** is [Prob( Params | Data)] = ( [Prob( Data | Params)] * [Prob( Params )] ) / [Sum of Prob( Data | Params) * Prob( params )]


# More Data, More Parameters, and More Bayes
- There is a function that takes the product of all numbers called `prod()`.
- Now that we know how it works, we'll be using the package *BEST* by John Kruschke.
- It assumes that the data is from a T-Distribution.
- It is similar but includes the third parameter called the *Degrees of Freedom*.
- It also uses a **Markov Chain Monte Carlo** method for predictions.
- You take your vector of inputs and pases it to the function `BESTmcmc( <data> )`.


# Research:

# Reference:
