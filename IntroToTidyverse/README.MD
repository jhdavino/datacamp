# Introduction to the Tidyverse
## David Robinson

# Data Wrangling
- This class is about introducing us to the Tidyverse.
- It's a general approach to solving data problems.
- You use the function `filter()` when you only want to check out a subset of your data.
- You use the function `%>%` to pipe the left hand side into the right hand side.
- The function `arrange()` sorts a table based on a variable.
- You can chain verbs together to build up to a result.
- The function `mutate()` will use other variables in the dataset to create a new column or update an existing one.

# Data visualization
- There are three parts to a ggplot2 graph:
  1. Data.
  2. Mapping of Aesthetics to Variables.
  3. Type of graph.
- When the scaling of your points is not linear, sometimes it's a better idea to use a logarithmic scale.
- To adjust the scales, you just include the function `scale_x_log10()` to you graph.
- Categorical features are well represented with colors.
- To do this, you simply pass `color = <feature>` inside the `aes()` call.
- You can also use the size of points to make this information clear too.
- Faceting is where you generate separate graphs conditioned on a feature.
- You can use the function `facet_wrap()`.


# Grouping and Summarizing
- The function `summarize()` can be used to return information about columns.
- This is usually the question you are after and should return a minimal set of rows or columns.
- You don't have to return only a single column but can include more.
- You can use the function `group_by()` to condition the calculation on a feature.
- You can use the function `expand_limits()` you can adjust the starting points of the x,y axis.

# Types of visualizations

# Research:

# Reference:
