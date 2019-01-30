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
- Keep in mind that when you're using **Grid Search** to tune hyperparameters that it will take longer to train.
- You can plot a graph of the hyperparameters using `plot(<trained-model>)`.
```
# Plot Kappa level-plot
plot(svm_model_voters_grid, metric = "Kappa", plotType = "level")
```
- If we don't want to set the values but instead want to search a range?
- Just insert a `seq(from = <n1>, to = <n2>, by = <n3>)` for the values in each hyperparameter.
- This is called a **Cartesian Grid**.
- You can also send the model object to `ggplot( <model> )` and it can print it at well.
- You can also pass the parameter `search = "random"` to the function `trainControl()` and it will do Random Search instead.
- You can also assign it `grid` for *Cartesian Grid Search*.
- The parameter `tuneLength` in `train()` accepts an integer of how many random values to select.
- In *Caret*, random search cannot be combined with grid search.
```
# Train neural net
tic()
set.seed(42)
nn_model_voters_big_grid <- train(turnout16_2016 ~ .,
                   data = voters_train_data,
                   method = "nnet",
                   trControl = fitControl,
                   verbose = FALSE,
                   tuneGrid = big_grid)
toc()
```
- Both of those methods are slow compared to **Adaptive Resampling**.
- What happens is that the hyperparameter combinations are resampled with values that performed well.
- In the function `trainControl` we will set `method = "adaptive_cv"` and set `search = random`.
- There are hyperparameters for *Adaptive Resampling*:
  * **min**: minimum number of resamples per hyperparameter.
  * **alpha**: confidence level for removing hyperparameters.
  * **method**: 'gls' for linear model; 'BT' for Bradley-Terry
  * **complete**: generates a full resampling set.
```
# Define trainControl function
fitControl <- trainControl(method = "adaptive_cv",
                           number = 3, repeats = 3,
                           adaptive = list(min = 3, alpha = 0.05, method = "BT", complete = FALSE),
                           search = "random")
```

# Hyperparameter Tuning in mlr

# Hyperparameter Turning with H20

# Research:
- What is package `tictoc`?
- " AdaBoost optimization algorithm from Freund and Shapire (1997)"
- Bradley-Terry?
-


# Reference:
