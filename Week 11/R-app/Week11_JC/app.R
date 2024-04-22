
library(shiny)

# Define UI for application that draws a histogram
library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)


# Define server logic required to draw a histogram

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name)
  })
}


# Run the application 
shinyApp(ui, server)
