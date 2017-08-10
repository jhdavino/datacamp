# Machine Learning Toolbox
## Zachary Deane-Mayer
## Max Kuhn

# Regression Models
- *Caret Package* is used for predictive modeling.
- Two types of predictive models:
	1. Classification
	2. Regression.
- Once a model exists, you can evaluate it using metrics.
- We'll focus on *Residual Mean Square Error (RMSE)*.
- Calculating the RMSE on the same model data is built with overestimates accuracy.
- Features of a great model:
	1. Don't overfit and generalize well.
	2. Perform well on new data.
- *Don't overfit!*
- You can use `sample()` if you don't have access to `caret` at the time.
- It is good practice to create a train/test split in the dataset before predictions.
- Superior to this, is called *Cross Validation* where there are lots of test sets.
- Rows are randomly assigned to each subset to try and avoid bias.
- You then fit the data against the full dataset.
- `Caret` accepts a function called `trainControl` to adjust parameters to training.
- Some of the parameters passed are:
	1. `method = 'cv'`.
	2. `number = <n>`.
	3. `verboseIter = TRUE`  // Shows output for each step in the testing.
- Example Call:
```r
train(                        # function call
  price ~ .,                  # formula of model
  diamonds,                   # dataset
  method = "lm",              # type of model
  trControl = trainControl(   # pass train settings.
    method = "cv",            # train method
    number = 10,              # obv.
    repeats = 5,              # obv.
    verboseIter = TRUE        # display progression output.
  )
)
```
- 

# Classification Models
- For predicting categorical variables.
- As a dataset gets smaller, then you should increase the size of the training split.
- You can build a logistic regression model using `glm()`.
- You're need to pass the parameter `family = "binomial"` when it is called.
- To make predictions, you must pass parameter `type = "response"`.
- A *Confusion matrix* is a matrix of the predicted outcomes vs. the actual outcomes.
- This can be done for you using `caret::ConfusionMatrix()`.
- This function takes the model created as well as the vector from the test dataset which is the response.
- Selecting a threshold is about balancing specificity vs sensitivity.
- Doing this the manual way is not particularily scientific and is actually hueristic based.
- *Receiver Operator Characteristic Curve* (ROC) is a brute force way of calculating all possible thresholds.
- Create an ROC curve using `caTools::colAUC()`.
- This function accepts parameters:
  1. The vector of predicted classes.
  2. The test dataset actual values.
  3. `plotROC = TRUE` to plot the results.
- A way to think about the ROC curve is actually as *Area Under the Curve*.
- A perfect classifier is just the whole graph.
- A random classifier splits the box in half.
- This metric is [0,1]
  * .5 is random.
  * 1 is perfect accuracy.
  * 0 is all wrong.
- Caret can calculate the AUC for us (yay!).
- This is done through the `trainControl()` function passed in `caret`.
- The parameters to pass are:
```r
  summaryFunction = twoClassSummary,
  classProbs = TRUE
```

# Tuning Model Parameters
- Random Forests usually yield very accurate non-linear models.
- They're resistant to overfiting.
- However, they do have *Hyperparameters*.
- *Hyperparameters cannot be estimated from the data, but must be selected manually.
- Random forests start with a simple decision tree, but then do this multiple times.
- Each model is done with a different subset of the dataset.
- This is called *Bootstrap Aggregation* - or *Bagging*.
- To use this in `caret` pass the `method = "ranger"` parameter.
- Random Forests require tuning.
- The most important of which is mtry: which is the number of randomly selected variables at each split.
- Lower mtry = more random; higher mtry = less random.
- `caret` can automate this.
- This is called *grid search* and is passed via parameter `tuneLength = <n>`.
- Ranger is faster than the `random forest` package.
- You can customize the grids passed using parameter `tuneGrid` as a dataframe.
- There is a package that adds some extra features called `glmnet`.
- The advantages are:
  1. Helps with *collinearity*.
  2. And deals with small sample sizes well.
- Threre are two kinds of forms:
  1. Lasso regression: which penalizes non-zero coefficients.
  2. Ridge Regression: which penalizes the absolute magnitude of coefficients.
- A glm model attempts to find a **parsimonious** model.
- The model mixing term is called **alpha** and falls in interval [0,1]; s.t.
  * 0 = lasso
  * 1 = ridge regression.
- The model penalty term is called **lambda** and ranges from [0, INF).
- The ROC statistics are stored in `model[["results"]]` inside the object.
- To pass values to tuneGrid, use `expand.grid()` containing the parameters to change.

# Preprocessing your Data

# Selecting Models: Case Study

# Research

# Reference
