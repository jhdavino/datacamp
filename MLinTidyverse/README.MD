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
- 


# Build, Tune & Evaluate Regression Models

# Build, Tune & Evaluate Classification Models

# Research:

# Reference:
