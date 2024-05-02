# Load R packages
library(shiny)
library(shinythemes)
library(datasets)
library(ggplot2)

vars <- setdiff(names(airquality), "Month")

# Define UI
ui <- fluidPage(
  #Setting the theme
  theme = shinytheme("darkly"),
  #Setting the title
  titlePanel("Air Quality -- Example for BFIX551"),
                
  # Sidebar with a selection input for variable by days 
  sidebarLayout(
    sidebarPanel(
      #selectInput('xcol', 'X Variable', vars[[5]]),
      selectInput('ycol', 'Y Variable', vars)),
    mainPanel(
      plotOutput("plot")
      )
    )
  )

# Define server
server <- function(input, output, session) {
  #selected <- reactiveVal(rep(FALSE, nrow(airquality)))
  selectedData <- reactive({
    airquality[, c(vars[[5]], input$ycol)]
  })
  output$plot <- renderPlot({
    plot(selectedData())
    #airquality$sel <- selected()
    #ggplot(airquality, aes(x = `Day`, y = sel)) + geom_point()
  })
}


# Run the application 
shinyApp(ui = ui, server = server)