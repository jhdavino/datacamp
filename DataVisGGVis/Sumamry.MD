# Data Visualization in GGvis
## Garret Grolemund

# The Grammer of Graphics
- GGVis is built by Hadley Wickham and David Chang.
- It is based on the same Grammer of Graphics that GGplot2 is based on.
- It's very flexible and builds HTML objects.
- The syntax to create is simple: `**<data>** %>% ggvis( ~<xvar>, ~<yvar>, fill := <color>) %>% layer_<type>()`.
- You can build layers by simply piping output into another layout.
- Graph = data + Coordinate System + Mark + Properties/Fill + ...
- The nomenclature for the type of plot is `layer_<types>`; don't forget the s!
- The magrittr or pipe is by Stefan Bache.
- The **fill** property tells GGvis what to color based on.
- The **size** property tells GGvis what to scale based on.

# Lines and Syntax
- The `=` tells GGvis that the data is in the dataset.
- The `:=` tells GGvis that you want to use a value in the visual space.
- Other properties are:
	1. opacity
	2. stroke
	3. fill
	4. fillOpacity
	5. shape
	6. strokeDash
- There are also for lines:
	1. paths
	2. ribbons.
	3. smooths.
	4. model_predictions

#  Transformations
- GGvis actually uses and internal computed dataset instead of the actual dataset with predictions.
- Layers can also accept parameters, such as width.

# Interactivity and Layers
- In fact, GGVis uses a `compute_*()` function passed to an internal `layer_*()` function.
- GGvis allows for interactive designs.
- You can pipe the output into a new layer call to create more than one type of visual information.
-

# Customizing Axes, Legends
- You also have fine level control of other details of the plot.
- Some examples are:
	1. `add_axis( '[y,x]', title = "Your text here", orient = "[top, left, bottom, right]")`
	2. `add_legend('<property to give information on>', title='obv', values='obv')`.
	3. `scale_nominal("fill", range = c('red', 'blue', 'purple'))`
- GGVis uses what are called scales to map a data value to the visual space.
- The `scale_*()` functions are representative of the Statistical values: numeric, nominal, ordinal, categorical.
- This can also be done on other parameters; such as opacity.
- You adjust them by passing a `range = ` or `domain = ` depending on which you wish to condition on.
-

# Research
- How was the `:=` operator built?

# Reference
