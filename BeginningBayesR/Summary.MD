


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

## Research:
- arm::sim()

## Further Reading:



