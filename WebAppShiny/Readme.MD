# Building Web Applications in R with Shiny
## Mine Cetinkaya-Rundel

# Introduction and Shiny Basics
- Class assumes:
  * You have a background with R.
  * Uses *Tidyverse* Syntax.
- Tips:
  * Always run the entire script.
  * Error messages are useful for direction.
  * Beware of loose commas.
- Anatomy of a Shiny App:
  * UI.
  * Server.
  * Combining Call.
- The UI starts with a `fluidPage()` function.
- There are many different layout options, but most common is `sidebarLayout()`.
- Then, inside `sidebarLayout()` we'll use `sidebarPanel()` to nest the controls for the main area.
- Then, we'll use a `selectInput()` function which is how we'll include a drop down menu.
- Its parameters are:
   * `inputId` for the reference name.
   * `label` for the name of the field.
   * `choices` is a vector of options in the drop down.
   * `selected` is the default choice.
- Lastly, the `mainPanel()` will contain `outputId = 'scatterplot'` since that's what we want to draw.
- You can also use a vector of Name, variable pairs in the `choices` parameter.
- The *server* is delclared using `function( input, output ){}`.
- You save objects you wish to display using `output$name_here <- ...`.
- You can render a plot to output using `renderPlot({ ... })`.
- You can pass variables from input to output using `input$var_name`.
- This will map `inputId = 'turtles'` to `input$turtles` for using on the server side.
- Rules of server funcions:
  1. Save objects to display using `input$xx`.
  2. Build objects to display with `render*()`.
  3. Use input values with `input$xx`.
- *Shiny* automatically updates plots when inputs to those plots change.
- The last call to actually setup the app is `shinyApp( ui = ui, server = server )`.

# Inputs, Outputs, and Rendering Functions
- **Reactivity** automatically occurs when an input vlaue is used to render an output object.
- You can adjust the dimensions of a plot by passing `height = <n>` to `plotOutput()`.
- You can create a checkbox using `checkboxInput()`.
- You can create a Data table using `DT::dataTableOutput()`.
- You render the table using `DT::renderDataTable({})`.
- The function `req()` will stop execution is the value is not *truthy*.
- Passing the parameter `multiple = TRUE` will allows you to filter on multiple values.
- You can use `dateInput()` to select a date.
- You can use `dateRangeInput()` to select two dates to condition on.
- You will need to pass parameters `start` and `end` instead of `value` for the dates.
- You can pass parameter `startview = 'year'` to control what level the user can control the calendar at.
- You can use `checkBoxGroupInput()` to declare a group of interaction check boxes.
- You can also control the appearance with extended parameters passed to `renderTable()`.
- A few:
  * `striped = TRUE` will alternatively color the rows.
  * `digits = 4` will do automatic rounding.
  * `width = "90%"` to control how much of the width of the page is taken up.
  * `caption = "Self evident"` to control the caption text.
- You can add text using `renderText()`.
- You can allow a user to subset values on the graph by passing `brush = "plot_brush"`.
- This will then make calculations only on those values.
- You call function `BrushPoints( <data>, input$plot_brush)` to collect those points on the server.
- You can also use only the points being hovered over by passing `hover = "plot_hover"` in `plotOutput()`.
- You will need to change the graphing function to `nearPoints()` instead of `BrushPoints()`
- You display text on the UI with `textOutput()`.
- You can display the outpu as if it came from the console using `verbatimTextOutput()`.
- The function `pull()` will extract a column as a local copy; sort of like `[[`.
- You can render generic `HTML()` objects using `renderUI()`.
- You use the function `htmlOutput()` to draw generic object in the UI.
- You use the function `downloadHandler()` to tell the server that something is downloadable.
- You use functions `downloadButton()` or `downloadLink()` to draw the download on the UI.

# Reactive Programming
- There are three kinds of *Reactive Objects*:
  1. Reactive Sources.
  2. Reactive Conductive.
  3. Reactive Endpoint.
- **Reactive Source** is user input that comes through a browser interface.
- **Reactive Endpoint** is something that appears in the user's browser window.
- One *Reactive Source* can be connected to multiple endpoints.
- **Reactive Conductor** is a reactive component between a source and an endpoint.
- A *Conductor* does not need to be alone in a chain; it can connect to other *Conductors*.
- To create a reactive expression, simply wrap code in `reactive({})`.
- The return of this is actually a function and will require that you call it like a function without inputs.
- *Reactives* help you to reduce code duplication and simplify calculations.
- **Reactive Expressions** only get evaluated when the input changes.
- The **Reactlog** is a graphical representation of what is going on under the hood of your apps.
- You can invoke this with `options(shiny.reactlog = TRUE)`, run the app and then press *CTRL+F3*.
- An **Observer** is used to monitor the changing variable under the hood.
- They can access reactive sources and reactive values but they don't return a value.
- You use them for the side effects; usually sending data to the web browser.
- *Reactive Expressions* must not have side effects while *observers* are used for precisely that.
- You can impede changes by using `isolate({})` around an input that you don't want to have updated constantly.
- The function `observeEvent()` will trigger changes only when the selected input is caught.
- You can create a button using `actionButton()`.
- The function `eventReactive( <event>, <expression>, ignoreNull = TRUE)` will tell shiny to ignore a blank value at initialization.
- 

# Customizing Appearance

# Research:
- `aes_string()`?
- selective.js?


# Reference:
- [Shiny Homepage ](www.shiny.rstudion.com)
