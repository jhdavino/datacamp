# Nonlinear Modeling in R with GAMs
## Noam Ross

# Introduction to Generalized Additive Models
- Whenever we build a model, we make a trade off between interoperability and flexibility.
- Problems with complex models include:
  1. Need lots of data.
  2. Difficult to interpret.
  3. Rarely make inferences about model.
- There are relationships were linear models don't work but non-linear GAMs will.
- We will be using the function `mgcv::gam()` which looks like the normal `lm()` Function.
- GANs are actually built out of smaller functions called **Basis** Functions.
- There are coefficients which are multiplied by each basis function and then those are all summed together.
- You can use the function `coef()` as per normal to get the *GAMs* coefficients.
```
# Fit the model
gam_mod <- gam(accel ~ s(times), data = mcycle)

# Plot the results
plot(gam_mod, residuals = TRUE, pch = 1)
```
- Since they have so many coefficients, *GAMs* require more data than normal.
- The flexibility of *GAMs** makes it easy to overfit data.
- The model is created from the formula `fit = likelihood - llambda*wiggiliness`.
  * likelihood is how well the GAM captures patterns in the data.
  * wiggiliness is how much the curve changes shape.
- Norally, we let the package do the work of selecting a smoothing factor.
- We can change this using the parameter `sp = <n>` passe to the function `gam()`.
- You can also pass it for a specific term in the formula using `s( attr, sp = <n>)`.
- There is also the option to use **Restrictive Maximum Likelihood** by passing `method = "REML"` to `gam()`.
- Another factor in how *wiggily* the GAM is would be how many *Basis Functions* there are.
- To inform the function how many basis there should be, you pass the `k = <n>` parameter.
```
# Fit a GAM with 3 basis functions
gam_mod_k3 <- gam(accel ~ s(times, k = 3), data = mcycle)
```
- When k is high and s is too low to smooth the model, it ends up overfitting the data.
- To build Multiple Regression Models, you would just treat `gam()` the same way as `lm()` and add them with ` s(<attr1>) + s(<attr2>)`.
- Not all features need to be nonlinear and you can mix and match as necessary.
```
model2 <- gam(hw.mpg ~ s(weight) + length, data = mpg,
              method = "REML")
```
- Linear Terms are very useful when you have categorical features.
- You can use a **Factor Smooth Interaction** by using the parameter `s( <attr1>, by = <attr2>)`.
- If you do this, it is a good idea to include a linear version added as well in case there is a difference in the means.
```
library(mgcv)

# Fit the model
mod_city2 <- gam(city.mpg ~ s(weight) + s(length) + s(price) + fuel + drive + style,
                 data = mpg, method = "REML")

# Plot the model
plot(mod_city2, all.terms = TRUE, pages = 1)
```


# Interpreting and Visualizing GAMs
- You can get a summary of a model using the function `summary()` as per normal.
- The summary does not print the coefficients since there are more than one.
- Instead, it lists *edf* or *Effective Degrees of Freedom*.
- If you cannot draw a line through the 90% confidence interval, then it's considered good.
- Remember that a high *edf* doesn't mean it is significant.
- The plots that are created from mgcv are Partial Effect Plots.
- You can pass the argument `rug = TRUE` to get he values showing at the bottom of the chart.
- You can pass the argument `residuals = TRUE` to get residuals on the plot.
```
library(mgcv)
# Fit the model
mod <- gam(hw.mpg ~ s(weight) + s(rpm) + s(price) + comp.ratio,
           data = mpg, method = "REML")

# Plot the price effect
plot(mod, select = 3)

# Plot all effects
plot(mod, pages = 1, all.terms = TRUE)
```
- There are several pitfalls while working with model fits in GAMs.
- We can check if there are enough basis functions using the function `gam.check()`.
- If the model has not fully convergence then it is not fit.
- For p-values in the test for the count of basis, we actually want it to *not* be significant.
- Increase the number of basis until this is true.
- With GAMs, even if we don't have collinearity then we still have to worry about **Concurvity**.
- This is when one curve is a smooth of another.
- If we have a relationship between two features that is a parabola, then we will get large confidence intervals.
- We can use the function `concurvity(<model>, full = TRUE)` to check for this.
- If any of the worst values are high, then we'll want to use `full = FALSE`.


# Spatial GAMs and Interactions
- We're now going to use Smooths from 2 Dimensions.
- You can mix features by using the function `s(x1, x2)` which is like an interaction effect.
- In mgcv's plot command, interactions are plotted as contour plots.
- A Contour plot is not always the best way to visualize this.
- You cam see the model as a surface by passing `scheme = 1` to the function `plot`.
- You can see it as a heatmap using `scheme = 2`.
- Sometimes you will want to customize the plot and that can be done with the function `vis.gam()`.
- The parameters are as follows:
  * `x` is the model.
  * `view` are the features you want to use.
  * `plot.type` for the type of plot.
    - The two common ones are `persp` for surface and `contour` for heatmap.
  * `too.far` tells it to ignore predictions too far from data.
  * You can include a confidence interval by passing `se = 2`.
```
vis.gam(g, view = c("x1", "x2"), plot.type = "persp", theta = 220) # horizontal
vis.gam(g, view = c("x1", "x2"), plot.type = "persp", phi = 55)    # vertical
vis.gam(g, view = c("x1", "x2"), plot.type = "persp", r = 0.1)     # zoom

# ======

# Rotate the same plot
vis.gam(mod2d,
  view = c('x', 'y'),
  plot.type = 'persp',
  se = 2,
  theta = 135)

```
- There is another kind of categorical continuous interaction called **Factor Smooth**.
- Instead of using the `by` argument, we use the basis type `fs`.
- We don't include a linear term since this accounts for that term by default.
```
```
- Now we're going to discuss **Tensor Smooths**.
- These allow us to model data that is on different scales.
- You can tell `gam()` to use them by passing `te()` instead.
```
gam(y ~ s(x1) + s(x2) + ti(x1, x2), data = data, method = "REML")
```
- Smooths that have only interactions, but have multiple lambda terms or scales, use `ti()`.


# Logistic GAMs for Classification
- We're now going to figure out how to model Classification problems.
- In R, the logistic function is `plogis()`.
- In R, the logit function is `qlogis()`.
- To create logistic GAMs, we add the parameter `family = binomial` in `gam()`.
- Remember that the outputs are on the log-odds scale.
- To interpret them as probabilities, we need to convert them using `plogis( <n> )`.
- When plotting, we can convert our output to probability scales using:
```
plot(binom_mod, pages = 1, trans = plogis)
```
```
# Plot with intercept uncertainty
plot(log_mod2, pages = 1, trans = plogis,
     shift = coef(log_mod2)[1], seWithMean = TRUE)
```
- When using the function `predict()` on the model, it will return results on the *link scale* or the scale of the inputs.
- If you want it to return probabilities instead, then pass `type = 'response'` to the function `predict()`.
- You can also request that it return the Standard Error by also passing `se.fit = TRUE`.
- We can get the impact of each term per individual prediction using the parameter `type = terms` in `predict()`.
```
# Calculate high and low predictions intervals
high_pred <- predictions$fit + 2*predictions$se.fit
low_pred <- predictions$fit - 2*predictions$se.fit

# Convert intervals to probability scale
high_prob <- plogis(high_pred)
low_prob <- plogis(low_pred)
```


# Research:
- termplot?

# Reference:
