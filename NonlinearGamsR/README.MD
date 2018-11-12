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

# Spatial GAMs and Interactions

# Logistic GAMs for Classification

# Research:
- termplot?

# Reference:
