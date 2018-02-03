# Beginning Bayes in R
## Jim Albert

- *Bayes Rule*: Named after Thomas Bayes (1702-1761)
- Paper called "Essays Towards Solving a Problem in the Doctrine of Chances" (1763)
- Approach:
	1. Identify model and collect **prior probabilites**.
	2. Collect Data.
	3. Use *Bayes Rule* to find **posterior probabilities**.
- If probabilities all the same, then you have a **uniform prior**.
- Meat of the rule: "Posterior Probability (=) is proportional to [Prior Prob.] x [Likelihood]"
- "Turn the bayesian crank."
- `bayesian_crank( bayes_data_frame )`; turn crank
- The posterier becomes your prior when 'cranking' the Bayesian 'crank'.
- Likelihood: (20 , 12) * p^12(1-p)^8
- Or, (n ,r) * 
- bayes_df$likelihood <- dbinom(12, size = 20, prob = bayes_df$P)
- *Beta Curve*: Prior = p^(a-1)(1-p)^(b-1)
- `TeachBayes::beta_area(value1, value2, c(beta_a, beta_b))` to calculate area under curve.
- Can accept a single value as well for one sided.

- A *Quantile* is a value of p s.t. area to its left is a given number.
- Values **a** and **b** are difficult to guess.
- *P50* stands for the quantile for **p** s.t. p is equally likely.
- P50 same as the median.
- *P90* is stands for the quantile for **p** s.t. p is unlikely.

```
p50 <- list( x = .55, p = 0.5)
p90 <- list( x = .80, p = 0.9)
TeachBayes::beta.select( p50, p90)
```

- `TeachBayes::beta_draw()` will draw a sample graph using your values calculated from `beta.select()`.
- `TeachBayes::beta_interval(probability, c( beta_select_1, beta_select_2 ))`

- The *Poesterior Probability* is proportional to the **beta prior** x **binomial likelihood**.
- The product of this is still a beta curve.

- *Bayesian Inference* is based upon summarizing posterior beta curve.
- Summary will depend on the type of inference.
- `TeachBayes::beta_interval( p, shape_params )` computes the interval between the tails.
- *Confidence Intervals* are different in Bayesian.
- *Non-informative Prior*: `g(M, S) = 1 / S`; s.t. M= Mean, S = Standard Deviation.

Steps:
	1. Collect data vector.
	2. Fit a lm model.
	3. Request arm::sim() on the model n times.
	4. Pull out Mean and Std. via coef(), sigma.hat().
	5. Plot scatterplot of cross over.

## Bayesian Regression
Steps:
	1. Build normal regression modal via lm()
	2. Request arm::sim() on the model n times.
	3. Pull out the beta and std. via coef(), sigma.hat().
	4. Plot beta_sim values.

- `rbeta( samples, c(beta1, beta2) )` to sample from the distribution

- Assume uniform prior spread across reasonable estimates
- `normal.select()` will return the mean,std to map bayes to normal.
- .. takes two lists with x=value, p = probability.
- Postier Normal is normal, too.
- *Precision*: 1 / Std^2
- Posterior precision: sum of Prior & Data
- Posterior Std.: 1/ sqrt(Posterior Precision)
- Posterior mean: weighted mean = `weighted.mean( x = c(Prior_mean, Data_mean), w = c(Prior_precision, Data_precision))`
- `TeachBayes::normal_update()` will do that for you.
- To test hypothesis in Bayes, simply check the p value generated via `pnorm`.
- *Predictive Density* is the distribution of times-to-serve in the future.


## Research:
- Agresti and Coull?
- `curve()`?
- arm::sim()


## Reading:
* "Essays Towards Solving a Problem in the Doctrine of Chances" - Thomas Bayes (1763)