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

# Reactive Programming

# Customizing Appearance

# Research:

# Reference:
- [Shiny Homepage ](www.shiny.rstudion.com)
