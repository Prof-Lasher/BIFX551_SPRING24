#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#       https://shiny.posit.co/
#
# Referenced https://shiny.posit.co/r/getstarted/shiny-basics/lesson1/
# Load required libraries
library(shiny)
library(ggplot2)  # For plotting
library(dplyr)     # For data manipulation

# Define UI for application that allows you to select form type and plot the data for that form
ui <- fluidPage(
  
  titlePanel("USCIS Historical Processing Times"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("formula_type", "Select USCIS Formula Type:",
                  choices = c("I-129", "I-130", "I-485", "I-751"),
                  selected = "I-129")
    ),
    mainPanel(
      plotOutput("processing_times_plot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Load historical processing time data
  historical_data <- read.csv("uscis_processing_times.csv", stringsAsFactors = FALSE)
  
  # Define a reactive expression to filter data based on selected formula type
  filtered_data <- reactive({
    historical_data %>%
      filter(Formula_Type == input$formula_type)
  })
  
  # Render plot based on selected formula type
  output$processing_times_plot <- renderPlot({
    ggplot(filtered_data(), aes(x = Year, y = Processing_Time_Months)) +
      geom_line() +
      geom_point() +
      labs(title = paste("Historical Processing Times for", input$formula_type),
           x = "Year", y = "Processing Time (Months)")
  })
} #server

# Create Shiny object
shinyApp(ui = ui, server = server)
