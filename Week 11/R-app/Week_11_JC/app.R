library(shiny)
library(ggplot2)

# Define UI for application
datasets <- c("cars","iris", "seals")
ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot") 
)


# Define server 
server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  output$summary <- renderPrint({ 
    summary(dataset())
  })
  output$plot <- renderPlot({
    plot(dataset()) 
  }, res = 96)
}


# Run the application 
shinyApp(ui, server)