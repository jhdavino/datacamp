# Introduction to Hyperparameters
## Shirin Glander

# Introduction to Hyperparameters
- **Model Parameters** are the result of modeling fitting or training.
- **Hyperparameters** are defined before training.
- We can check those using the function `formals()`.
- The function `lm` has a *hyperparameter* of `weights`.
- Draw a line based on the slope and intercept in ggplot:
```
geom_abline(slope = linear_model$coefficients[2],
                intercept = linear_model$coefficients[1])
```
- Machine Learning review:
  * Using package `caret`.
  * Split into training/test sets.
```
index <- createDataPartition(breast_cancer_data$diagnosis, p = .70,
                             list = FALSE)
```
  * Make sure your experiment has enough **Power**.
  * Make sure it is a representative test set.
  * Setup Cross Validation.
```
# Repeated CV.
fitControl <- trainControl(method = "repeatedcv",
                           number = 3,
                           repeats = 5)
```
  * Then, you train the model of your choosing.
  * The functions `tic()` and `toc()` will return the runtimes.
- You can also pass a *grid* of parameters to try using:
```
hyperparams <- expand.grid(degree = 4,
                           scale = 1,
                           C = 1)
```
- You will then pass `tuneGrid = hyperparams` to function `train()`.
- You can specify the number of hyperparameter values using the argument `tuneLength = <n>`.
```
hyperparams <- expand.grid(n.trees = 200,          # number of trees.
                           interaction.depth = 1,  # tree complexity
                           shrinkage = 0.1,        # learning rate
                           n.minobsinnode = 10)    # number of observations to allow splits.
```

# Hyperparameter Tuning in Caret

# Hyperparameter Tuning in mlr

# Hyperparameter Turning with H20

# Research:
- What is package `tictoc`?
- " AdaBoost optimization algorithm from Freund and Shapire (1997)"
-


# Reference:
