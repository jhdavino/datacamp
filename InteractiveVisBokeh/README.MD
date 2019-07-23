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
- Bokeh really just outputs static HTML, CSS and Javascript.
- We will use the Bokeh Server to allow us to query and run dynamic analysis.
- Bokeh applications typically import curdoc.
```python
from bokeh.io import curdoc
```
- We create plots and widgets to put on the server.
- Callbacks are what get run in response to some event.
- Arrange the plots and widgets in layouts.
- Lastly, we added all the elements together using:
```python
curdoc().add_root(layout)
```
- You can run the applciation from the command line using `bokeh serve --show myapp.py`
- The parameter `--show` just opens it in the local web browswer..
- You can do much more by targeting a directory instead with data and templates.
```python
# Create a new plot: plot
plot = figure()

# Add a line to the plot
plot.line( x = [1,2,3,4,5], y = [2,5,4,6,7])

# Add the plot to the current document
curdoc().add_root(plot)
```
```python
# Perform the necessary imports
from bokeh.io import curdoc
from bokeh.layouts import widgetbox
from bokeh.models import Slider

# Create a slider: slider
slider = Slider(title='my slider', start=0, end=10, step=0.1, value=2)

# Create a widgetbox layout: layout
layout = widgetbox( slider )

# Add the layout to the current document
curdoc().add_root( layout )
```
- You can add callbacks to any property with the following format:
```python
def callback( attr, old, new):
  # read the value off the slider:
  N = slider.value
  source.data = { 'x': random(N), 'y': random(N)}
  # attached via this:
  slider.on_change('value', callback)
```
- You then arrange the widgets how you'd like:
```python
layout = column(slider, plot)
```
- You can also append Dropdowns.
- We will use `bokeh.models.Select` to build the menu.
- You can pass the set of options using the parameter `options = []`.
- You can set the default using `value='<value>'`.
- You can set the title using `title='<title>'`.
```python
# Perform necessary imports
from bokeh.models import ColumnDataSource, Select

# Create ColumnDataSource: source
source = ColumnDataSource(data={
    'x' : fertility,
    'y' : female_literacy
})

# Create a new plot: plot
plot = figure()

# Add circles to the plot
plot.circle('x', 'y', source=source)

# Define a callback function: update_plot
def update_plot(attr, old, new):
    # If the new Selection is 'female_literacy', update 'y' to female_literacy
    if new == 'female_literacy':
        source.data = {
            'x' : x,
            'y' : female_literacy
        }
    # Else, update 'y' to population
    else:
        source.data = {
            'x' : x,
            'y' : population
        }

# Create a dropdown Select widget: select    
select = Select(title="distribution", options=['female_literacy', 'population'], value='female_literacy')

# Attach the update_plot callback to the 'value' property of select
select.on_change( 'value', update_plot)

# Create layout and add to current document
layout = row(select, plot)
curdoc().add_root(layout)
```
```python
# Create two dropdown Select widgets: select1, select2
select1 = Select(title='First', options=['A', 'B'], value='A')
select2 = Select(title='Second', options=['1', '2', '3'], value='1')

# Define a callback function: callback
def callback(attr, old, new):
    # If select1 is 'A'
    if select1.value == 'A':
        # Set select2 options to ['1', '2', '3']
        select2.options = ['1', '2', '3']

        # Set select2 value to '1'
        select2.value = '1'
    else:
        # Set select2 options to ['100', '200', '300']
        select2.options = ['100', '200', '300']

        # Set select2 value to '100'
        select2.value = '100'

# Attach the callback to the 'value' property of select1
select1.on_change('value', callback)

# Create layout and add to current document
layout = widgetbox(select1, select2)
curdoc().add_root(layout)
```
- We will learn about button widgets next.
- Buttons don't really change values since they're simply an event in and of themselves.
- You will import it from `from bokeh.models import Button`
- Instead of `on_change()` we will use `on_click()`.
- There are other kinds of buttons too:
![Different examples of buttons](images\buttonTypes.png)
- They expect a single parameter `active` instead - as seen in the image.
```python
# Create a Button with label 'Update Data'
button = Button(label='Update Data')

# Define an update callback with no arguments: update
def update():

    # Compute new y values: y
    y = np.sin(x) + np.random.random(N)

    # Update the ColumnDataSource data dictionary
    source.data = {'x': x, 'y': y}

# Add the update callback to the button
button.on_click(update)

# Create layout and add to current document
layout = column(widgetbox(button), plot)
curdoc().add_root(layout)
```
```python
# Import CheckboxGroup, RadioGroup, Toggle from bokeh.models
from bokeh.models import CheckboxGroup, RadioGroup, Toggle

# Add a Toggle: toggle
toggle = Toggle( button_type='success', label='Toggle button')

# Add a CheckboxGroup: checkbox
checkbox = CheckboxGroup( labels=['Option 1', 'Option 2', 'Option 3'])

# Add a RadioGroup: radio
radio = RadioGroup( labels= ['Option 1', 'Option 2', 'Option 3'])

# Add widgetbox(toggle, checkbox, radio) to the current document
curdoc().add_root( widgetbox( toggle, checkbox, radio) )
```
- There is a guide at the website about hosting a server for others.
- They can also be deployed on Anaconda.org now as well.


# Putting it All Together! A Case Study
- Time to apply what we learned.
- Time to start a Basic App.
```python
# Import the necessary modules
from bokeh.io import curdoc
from bokeh.models import ColumnDataSource
from bokeh.plotting import figure

# Make the ColumnDataSource: source
source = ColumnDataSource(data={
    'x'       : data.loc[1970].fertility,
    'y'       : data.loc[1970].life,
    'country' : data.loc[1970].Country,
    'pop'     : (data.loc[1970].population / 20000000) + 2,
    'region'  : data.loc[1970].region,
})

# Save the minimum and maximum values of the fertility column: xmin, xmax
xmin, xmax = min(data.fertility), max(data.fertility)

# Save the minimum and maximum values of the life expectancy column: ymin, ymax
ymin, ymax = min(data.life), max(data.life)

# Create the figure: plot
plot = figure(title='Gapminder Data for 1970', plot_height=400, plot_width=700,
              x_range=(xmin, xmax), y_range=(ymin, ymax))

# Add circle glyphs to the plot
plot.circle(x='x', y='y', fill_alpha=0.8, source=source)

# Set the x-axis label
plot.xaxis.axis_label ='Fertility (children per woman)'

# Set the y-axis label
plot.yaxis.axis_label = 'Life Expectancy (years)'

# Add the plot to the current document and add a title
curdoc().add_root(plot)
curdoc().title = 'Gapminder'
```


# Research:

# Reference:
