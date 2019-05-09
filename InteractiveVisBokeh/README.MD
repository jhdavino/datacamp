# Interactive Data Visualization with Bokeh.
## Team Anaconda

# Basic Plotting with Bokeh.
- Creator is named Bryan Van De Ven.
- **Glyphs** are the shapes that are drawn on a plot.
- Properties are attached to data.
- There are some standard usage:
```python
# imports
from bokeh.io import output_file, show
from bokeh.plotting import figure

# create plot
plot = figure( plot_width=<n>, tools='pan,box_zoom')
plot.circle( <list1>, <list2>)
```
- We call the function `output_file(<filename>)`
- We can show the plot using the function `show( plot )`
- We can control the sizes and the axis using the parameters:
  * `x=`
  * `y=`
  * `size=`
```python
# Create the figure: p
p = figure(x_axis_label='fertility', y_axis_label='female_literacy (% population)')

# Add a circle glyph to the figure p
p.circle( x = fertility_latinamerica, y = female_literacy_latinamerica)

# Add an x glyph to the figure p
p.x(x = fertility_africa, y=female_literacy_africa)
```
```python
# Add a blue circle glyph to the figure p
p.circle(fertility_latinamerica, female_literacy_latinamerica, size=10, alpha=.8, color='blue')
```
- If you want to added another set of circles, then you can call `p.circle()` again.
- You create a line plot using `plot.line()` instead.
- Geographical information is done using what are called **Patches**.
- The *patch* data is a list of lists.
- There are a lot of other glyphs:
![Other Glyphs](images\Other-Glyphs.png)
- You can control the formatting as well:
```python
# Create a figure with x_axis_type="datetime": p
p = figure(x_axis_type='datetime', x_axis_label='Date', y_axis_label='US Dollars')
```
- Patches are kind of nifty:
```python
# Create a list of az_lons, co_lons, nm_lons and ut_lons: x
x = [az_lons, co_lons, nm_lons, ut_lons]

# Create a list of az_lats, co_lats, nm_lats and ut_lats: y
y = [az_lats, co_lats, nm_lats, ut_lats]

# Add patches to figure p with line_color=white for x and y
p.patches( x, y, line_color='white')
```
- Bokeh understands numpy arrays as well as Pandas.
- A Foundational data structure is the **Column Data Source**.
- They are often created for you manually.
- Can be shared between glyphs to link seletions.
- You can add extra columns for features like tool tips.
- To use them, we will need to import them:
```python
from bokeh.plotting import ColumnDataSource

source = ColumnDataSource( data= {
  'x': [...],
  'y': [...]
})
```
- It is very easy to create *Column Data Structures* from data frames:
```python
source = ColumnDataSource( df )
```
- Ragged (different length) columns are not permitted within a single ColumnDataSource.
```python
# Create a ColumnDataSource: source
source = ColumnDataSource(df)

# Add circle glyphs to the figure p
p.circle(x='Year', y='Time', color='color', size=8, source=source)
```
- Bokeh has several different tools to enable users to interact with points and plots.
- In this example, we use the tools `box_select,lasso_select`.
- By default, Bokeh draws the non-selected points with a very low transparency.
- Selected features for this are prepended with either `selection_` or `nonselection_`.
- You will need to:
```python
from bokeh.models import HoverTool
hover = HoverTool(tooltips=None, mode='hline')

# add for detection.
plot = figure(tools=[hover, 'crosshair'])
```
- Then, we specify the hover policy in the same way that selections are done: `hover_color='red'`
- If we want to color data differently, then we can do a color mapping to a column in the data.
- We do this using:
```python
from bokeh.models import CategoricalColorMapper
mapper = CategoricalColorMapper( factors = [ ... ], pallette = [ ... ])
```
- Now you can just pass a dictionary in the color parameter:
```python
color={'field': 'species', transform: mapper}
```

```python
# Create a HoverTool: hover
hover = HoverTool(tooltips=None, mode = 'vline')

# Add the hover tool to the figure p
p.add_tools( hover )
```
```python
# Make a CategoricalColorMapper object: color_mapper
color_mapper = CategoricalColorMapper(factors=['Europe', 'Asia', 'US'],
                                      palette=['red', 'green', 'blue'])

# Add a circle glyph to the figure p
p.circle('weight', 'mpg', source=source, color=dict(field='origin', transform=color_mapper), legend='origin')
```


# Layouts, Interactions, and Annotations.
- Now we're going to learn about layouts for plots.
- The simplest is putting plots in rows and columns.
- Layouts can be nested for more sophisticated layouts.
- It also supports grid arrangements and tabbed layouts.
- To place plots in a row, first you'd import it:
```python
from bokeh.layouts import row

# pass plots to rows.
layout = row(p1,p2,p3)
```
- Columns are just as simple; they come from `column` instead.
- You can pass row or column as arguments to the others.
- You can also create more complicated graphing layouts:
```python
# Make a column layout that will be used as the second row: row2
row2 = column([mpg_hp, mpg_weight], sizing_mode='scale_width')

# Make a row layout that includes the above column layout: layout
layout = row([avg_mpg, row2], sizing_mode='scale_width')
```
- Bokeh also supports gridplots which you will import with:
```python
from bokeh.layouts import gridplot

layout = gridplot([[None,p1], [p2,p3]], toolbar_location = None)
```
- The dimensions of the lists need to be the same length.
- The `toolbar_location` can be set to:
  * `above`
  * `below`
  * `left`
  * `right`
- Creating Tabbed layouts is more involved and will require two steps.
- First, we need to create the layouts and then we need to collect them into a tabs object.
- The imports are:
```python
from bokeh.models.widgets import Tabs, Panel

# create the panels:
first = Panel( child=row(p1,p2), title = 'first')
second = Panel( child=row(p3), title = 'second')

# collect them together:
tabs = Tabs(tabs=[first,second])
```
- Once we have multiple plots, we could consider linking them together.
- Conceptually, it means that two plots share a range.
- In fact, *bokeh* makes this explicit in how it expects you to do this.
```python
p3.x_range = p2.x_range
```
- There is also linking selections.
- To do this, you only need to share the source between two different data plots.
- Guides allow you to see meaningful information from a plot.
- The package tries to use reasonable defaults.
- For the modified visuals to be useful, there needs to be legend.
- There are different ways to create legends in *bokeh* plots but we'll look at the simplest.
- If you pass parameter `legend = '<column-name>'` then it will detect and display the legend.
- The Hovertool can be configured to also display informational tool tips whenever a user hovers over them.
- Instead of passing None to the parameter `tooltips`, we pass a list of tuples:
```python
hover = HoverTool(tooltips=[ ('species name', '@species'),
                             ('petal length', '@petal_length'),
                             ('sepal length', '@sepal_length') ])
```
- The first string is the value; the second the formatting.
- The `@` values are replaced with the actual values in the data column.
```python
# Assign the legend to the bottom left: p.legend.location
p.legend.location = 'bottom_left'

# Fill the legend background with the color 'lightgray': p.legend.background_fill_color
p.legend.background_fill_color = 'lightgray'
```
```python
# Add the HoverTool object to figure p
p.add_tools( hover )
```


# Building Interactive Apps with Bokeh.

# Putting it All Together! A Case Study

# Research:

# Reference:
