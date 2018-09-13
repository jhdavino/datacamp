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
- The essensce of *Baysian Inference* is conditioning on data, in order to learn about parameter values.
- The fourth piece will be the **Computatinoal Method** so you can scale the analysis.

# Why use Bayesian Inference
- It is a very flexible way to analyze data and models.
- You can include information sources in addition to the data.
- You can make any comparisons between groups or data sets.
- You can use the result of a Bayesian analysis to do Decision Analysis.
- You can change the underlying statistical model.
- The Beta Distribution is a useful distribution for our purposes.
- You can generate one using the function `rbeta( <n>, <shape1>, <shape2>)`.
-






- A **Credible Intervel** is an interval that contains the parameter which a certain probability.
- A **Decisian Analysis** is using the Probability to decide on what you really care about.
- If you have a single event and you would like to calculate the expected probability then you use the Poisson Distribution.
- You can use the function `rpois( <n>, <lambda/observed-events>)` to generate it.
-  Always remember that you're model is still a model.
- Another advantage is that there is a separation between model and computation.

# Bayesian Inference Using Bayes Theorem

# More Data, More Parameters, and More Bayes

# Research:

# Reference:
