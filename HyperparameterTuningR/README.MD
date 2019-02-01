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
- We're going to be exploring another Machine Learning Framework in R called **mlr**.
- The workflow follows three steps:
  1. Define the Task.
  2. Define the Learner.
  3. Fit the Model.
```
knowledge_data %>%
  count(UNS)
```
- There are a few tasks:
  * Regression: `RegrTask()`.
  * Binary/Multi-class Classification: `ClassifTask()`.
  * Multi-Label Classification: `MultilabelTask()`.
  * General Cost Sensitive Classification: `ConstSensTask()`.
- You will define the task with the format:
```
task <- makeClassifTask(data = knowledge_train_data,
                        target = "UNS")
```
- You can find out what learners are available by calling the function `listLearners()`.
- This is the format for a learner:
```
# Define learner
lrn <- makeLearner("classif.h2o.deeplearning",
                   fix.factors.prediction = TRUE,
                   predict.type = "prob")
```
- This is the format you would use to train:
```
# Fit model
model <- train(lrn,
               task)
```
- To declare *hyperparameters*, you need three more steps:
  1. Define the Search Space.
  2. Define the Tuning Method; Grid vs Random.
  3. Define the Resampling method.
- To define the *Search Space*, we will need the function `makeParamSet()`.
- There are lots of options for the type here.
- You can get the parameters for a learner using the function `getParamSet('<learner-name>')`.
- Once you have them, you will define the ranges that you're looking for in `makeParamSet()`.
```
param_set <- makeParamSet(
  makeDiscreteParam("hidden", values = list(one = 10, two = c(10, 5, 10))),
  makeDiscreteParam("activation", values = c("Rectifier", "Tanh")),
  makeNumericParam("l1", lower = 0.0001, upper = 1),
  makeNumericParam("l2", lower = 0.0001, upper = 1)
)
```
- The tuning method still only has two options: Grid vs Random.
- You select them with a function name:
  * `makeTuneControlRandom()`
  * `makeTuneControlGrid()`
- There is a limitation on Grid in that it can *only* deal with discrete parameter sets.
- Lastly, you define the resample strategy using function `makeResampleDesc()`.
```
cross_val <- makeResampleDesc("RepCV",
                              predict = "both",
                              folds = 5 * 3)
```
- You glue everything together with the function `tuneParams()`.
```
lrn_tune <- tuneParams(lrn,
                       task,
                       resampling = cross_val,
                       control = ctrl_grid,
                       par.set = param_set)
```
- Generally, we want to evaluate how different hyperparameters affect the performance.
- You can collect the Hyperparameter values using the function `generateHyperParsEffectData( <lrn_tune>, partial.dep = TRUE)`.
- You can then plot that data using the function `plotHyperParseEffect( <hyperpar_effects>, partial.dep.learn = "regr.randomForest", x = "l1", y = "mmce.test.mean", z = "hidden", plot.type = "line")`.
```
# Create holdout sampling
holdout <- makeResampleDesc("Holdout")
```
```
# Plot hyperparameter effects
plotHyperParsEffect(hyperpar_effects,
    partial.dep.learn = "regr.glm",
    x = "minsplit", y = "mmce.test.mean", z = "maxdepth",
    plot.type = "line")
```
- There are other more advanced tuning controls.
  * makeTuneControlCMAES: CMA Evolution Strategy
  * makeTuneControlDesign: Predefined data frame of hyperparameters
  * makeTuneControlGenSA: Generalized simulated annealing
  * makeTuneControlIrace: Tuning with iterated F-Racing
  * makeTuneControlMBO: Model-based / Bayesian optimization
- You can pass more than one metric for tuning the hyperparameters.
- This parameter gets passed to the function `tuneParams( ..., measures = list( acc, mmce ))`
- You can use the function `makeMeasure()` to create your own custom measurement functions.


# Hyperparameter Turning with H20

# Research:
- What is package `tictoc`?
- " AdaBoost optimization algorithm from Freund and Shapire (1997)"
- Bradley-Terry?



# Reference:
- [mlr package](https://mlr-org.github.io/mlr)
