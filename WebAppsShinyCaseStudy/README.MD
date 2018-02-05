# Building Web Applications in R with Shiny: Case Studies
## Dean Attali

# Shiny Review
- This course assumes you already know the basics of Shiny.
- Examples of function to include in the UI:
  * `h1()` for Header, size 1.
  * `h2()` for Header, size 2.
  * `strong()` for bold text.
  * `em()` for italicized text.
- There are many different kinds of layouts but we'll focus on the **Sidebar Layout**.
- Inputs are called inside the ui in format `<type_of>Input()`.
- Ex:
  * `numericInput( inputId = '<name>' label = "turtles", value = 4, min = 0)`
  * `textInput( inputId = '<name>', label = "Enter your name")`
- Outputs require two rules:
  1. A placeholder in the ui: `plotOutput( outputId = '<name>')`
  2. The logic in the server.
- There are three rules to an output:
  1. Use a render function: `renderTable()`
  2. Save the result of the expression to `output$<outputId>`.
  3. Optionally, include inputs using `input$<inputId>`.
```r
output$myTable <- renderTable({
    head( iris, n = input$num)
})
```
- Shiny uses **Reactive Programming**.
- Outputs react to inputs.
- Keep in mind that reactive values can only occur inside reactive contexts.
- All `*render()` is a reactive context.
- The function `observer({})` can be used to access a reactive value in a reactive context.
- A **Observe Context** is dependent on all reactive values that exist inside it.
- This means that the whole block will be rerun when any of the values change.
- You can create your own reactive values using `reactive({})`.
- You will need to treat the reactive value as a function - because it is.
```r
x <- reactive({ input$num + 1 })
print( x() )
```
-


# Make The Perfect Plot Using Shiny

# Explore a Dataset Interactively With Shiny

# Create Your Own Word Cloud in Shiny

# Research:

# Reference:
