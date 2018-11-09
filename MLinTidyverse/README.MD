# Machine Learning in the Tidyverse
## Dmitriy Gorenshteyn

# Foundations of "tidy" Machine Learning
- Tidyverse is centered around the Tibble.
- The model of working in this world is called the **List Column Workflow**.
- The workflow looks like:
  1. nest().
  2. map().
  3. unnest(), map_*()
- First, you have to use the function `group_by()` on the feature you want to focus on.
- Then, you want to use `next()` to create a series of data.frames for the data of each country.
- Remember that the data list can be assessed via normal list subsetting.
- You can then run `unnest()` on it to turn it back into a regular dataframe.
```R
# Prepare the nested dataframe
library(tidyverse)
data_nested <-data %>%
  group_by( column ) %>%
  nest()
```
- Once data is in this nested format, we'll be using the `map()` family of functions to create conclusions.
- These functions accept a function and a list; they always return a list.
- You can use a *forumla* passed in the *.f* or second argument.
- An example would be `~mean(.x)`.
- You can calculate the mean population therefore using `map( .x = nested$data, .f = ~mean( .x$population))`.
- If you know the return type, then you can call a function of that type from the `map()` family.
```
# Calculate the mean population for each country
pop_nested <- gap_nested %>%
  mutate(mean_pop = map(.$data , ~mean(.x$population)))

  # Extract the mean_pop value by using unnest
  pop_mean <- pop_nested %>%
    unnest( mean_pop )

# Build a linear model for each country
gap_models <- gap_nested %>%
    mutate(model = map(.$data, ~lm(formula = life_expectancy~year, data = .x)))
```
- The **Broom Toolkit** is used to inspect the models.
- The function `tidy()` is here for statistical findings.
- The function `glance()` is here for one-row statistical summaries.
- The function `augment()` is here to add prediction columns to the data.
```
# Build the augmented dataframe
algeria_fitted <- augment( algeria_model )

# Compare the predicted values with the actual values of life expectancy
algeria_fitted %>%
  ggplot(aes(x = year)) +
  geom_point(aes(y = life_expectancy )) +
  geom_line(aes(y = .fitted), color = "red")
```


# Multiple Models with broom
- We're going to be using glance and tidy to check the fit of 77 different models.
```
best_augmented <- best_fit %>%
  # Build the augmented dataframe for each country model
  mutate(augmented = map(model, ~augment(.x))) %>%
  # Expand the augmented dataframes
  unnest(augmented)

# View the performance for the four countries with the worst fitting
# four simple models you looked at before
fullmodel_perf %>%
  filter(country %in% worst_fit$country) %>%
  select(country, adj.r.squared)
```


# Build, Tune & Evaluate Regression Models
- The two questions Data Scientists should keep in mind are:
  1. How well does my model fit new data?
  2. Did I select the best model?
- We split data into a train and a test set, which I know.
- We will use the function `rsample::initial_split( <data>, prop = <.x>)`.
- Then, you call function `training()` on the returned object to get the training data.
- You call the function `testing()` on the returned object to get the testing data.
- Do not use the test dataset for training, obv.
- You can also split your train into a train/validate split.
- Taking this to the next step, you can do this many times and it is called Cross Validation.
- You can use the function `rsample::vfold_cv(<train-data>, v = <splits>)`.
- You will use the `mutate()` function to split the CVs into train/validate.
```
cv_data <- cv_split %>%
  mutate(train = map(splits, ~training(.x)),
         validate = map(splits, ~testing(.x)))

#====
cv_data <- cv_split %>%
  mutate(
    # Extract the train dataframe for each split
    train = map(splits, ~training(.x)),
    # Extract the validate dataframe for each split
    validate = map(splits, ~testing(.x))
  )
```
- The lecturer's preferred metric is **Mean Absolute Error**.
- This is defined as the sum of the Absolute Value of the Actual values - the predicted values divided by the number of measurements.
```
cv_prep_lm <- cv_eval_lm %>%
  mutate(validate_actual = map(validate, ~.x$life_expectancy),
         validate_predicted = map2(model, validate, ~predict(.x, .y)))
```
- We will be using the function `Metrics::mae()` to do the caluculation for us.
```
library(Metrics)
cv_eval_lm <- cv_prep_lm %>%
  mutate(validate_mae = map2_dbl(validate_actual, validate_predicted,
                                ~mae(actual = .x, predicted = .y)))
```
- We will ne using the function `ranger::ranger()` to create a Random Forest.
- The arguments are `forumula`, `data` and `seed`.
```
library(ranger)

# Build a random forest model for each fold
cv_models_rf <- cv_data %>%
  mutate(model = map(train, ~ranger(formula = life_expectancy~., data = .x,
                                    num.trees = 100, seed = 42)))

# Generate predictions using the random forest model
cv_prep_rf <- cv_models_rf %>%
  mutate(validate_predicted = map2(.x = model, .y = validate, ~predict(.x, .y)$predictions))
```


# Build, Tune & Evaluate Classification Models
- We're going to be using the function `glm()`.
```
# Build a model using the train data for each fold of the cross validation
cv_models_lr <- cv_data %>%
  mutate(model = map(train, ~glm(formula = Attrition ~ .,
                               data = .x, family = "binomial")))
```
- To make predictions, you will need to pass the argument `type = "response"` to function `predict()`.
- You can calculate the accuracy of prediction using the function `Metrics::accuracy()`
- You can calculate the precision of predictions using the function `Metrics::precision()`.
- You can calculate the recall of predictions using the function `Metrics::recall()`.



```
library(ranger)

# Prepare for tuning your cross validation folds by varying mtry
cv_tune <- cv_data %>%
  crossing(mtry = c(2,4,8,16))

# Build a cross validation model for each fold & mtry combination
cv_models_rf <- cv_tune %>%
  mutate(model = map2(train, mtry, ~ranger(formula = Attrition~.,
                                           data = .x, mtry = .y,
                                           num.trees = 100, seed = 42)))
```


# Research:
- ranger function?
- ranger package?
-


# Reference:
