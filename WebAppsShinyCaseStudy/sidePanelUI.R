library( shiny )

# basic side panel ui
ui <- fluidPage(
  sidebarLayout( 
    sidebarPanel(
      "This is a sidebar"
    ),
    mainPanel(
      "Main panel goes here"
    )
  )
)

server <- function( input, output ){}
shinyApp( ui = ui, server = server )