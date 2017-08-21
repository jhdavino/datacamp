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
- There are also, for lines:
	1. paths
	2. ribbons.
	3. smooths.
	4. model_predictions

#
#
#

# Research
- How was the `:=` operator built?
- 
# Reference