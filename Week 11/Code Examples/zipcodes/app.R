#
# Creator: Brandon Lasher 
# Email: lasher@hood.edu
#
# Description:
#   
# 
# https://mastering-shiny.org/
#Rmarkdown
# https://stackoverflow.com/questions/33499651/rmarkdown-in-shiny-application

library(shiny)
require(dplyr)
require(dbscan)
require(ggplot2)
require(maps)
library(readr)
library(shinythemes)

#First we need to read in the data
uszips <- read_csv("./uszips.csv", show_col_types = FALSE)

#Add columns to convert lat/long to km
# Latitude: 1 deg = 110.574 km
# Longitude: 1 deg = 111.320*cos(latitude) km
# Source: https://en.wikipedia.org/wiki/Latitude

convert2Rads <- function( input ){
  return( input * pi/ 180);
}

uszips <- uszips %>% 
  filter( between( lat, 25, 50 ) & between( lng, -127, -65 ) ) %>%
  mutate( lng_km = lng * 111.320 * cos( convert2Rads( lat) ) , lat_km = 110.574 * lat )

#Create USA base plot we will change
usa_map <- map_data("state") #get a map of the US states  


usPlt <- ggplot( aes(x=long, y=lat ), data = usa_map ) +  
  geom_polygon( aes(group = group), fill=NA, show.legend = FALSE, color="grey75") +  
  coord_quickmap() +
  theme_minimal()


# Define UI for application that draws my plot
# https://mastering-shiny.org/action-layout.html
ui <- fluidPage(
    theme = shinytheme("darkly"),
  
    # Application title
    titlePanel("Zipcodes -- Example for BFIX551"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            HTML( "<h4 align=\"center\"><u>Clustering Parameters</u></h4>" ),
            sliderInput("radius",
                        "Radius (km):",
                        min = 1,
                        max = 50,
                        value = 15),
            sliderInput("numPts",
                        "Number of Points:",
                        min = 10,
                        max = 50,
                        value = 40),
              checkboxInput("base", "Show Points?", value = FALSE, width = NULL)
            ),
        
        # Main panel
        mainPanel(
          
          tabsetPanel(
            id = "Visualizations",
            # Panel with plot ----
            tabPanel("Plot", plotOutput("distPlot")),
            
            # Panel with summary ----
            #nav_panel("Summary", verbatimTextOutput("summary")),
            
            # Panel with table ----
            tabPanel("Table", titlePanel("Top 10 Cities"), tableOutput("table")),
            
            tabPanel("About", 
                     titlePanel("About"), 
                     div(includeMarkdown("about.md"), 
                         align="justify")
            ) #tabPanel(), About
            
          )
          
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    uszips_db <- data.frame()
    #Create the Plot
    output$distPlot <- renderPlot({
      db <- dbscan(uszips %>% select(lat_km, lng_km), eps = input$radius, minPts = input$numPts)

      uszips_db <- uszips %>% 
        mutate( cluster = db$cluster ) %>%
        filter( cluster > 0 )

      plt <- usPlt

      #Check for check Box
      if( input$base ){
        plt <- plt + geom_point( aes( x=lng, y=lat ), shape=20, data = uszips, alpha=.1 )
      }
            
      plt <- plt + 
        geom_point( aes( x=lng, y=lat, color = as.factor(cluster) ), shape=20, data = uszips_db, alpha=.5 ) + 
        theme(legend.position = "none")
      
      plt

    }, res = 100)

    #Function to create the desired dataset
    d <- function(){

      nCities <- 10

      topNCities <- us.cities %>%
        mutate( rank = min_rank(-pop) ) %>%
        filter( rank <= nCities)

      topNCities %>% select( name, pop, rank ) %>% arrange(rank)
    }

    #Render out the table    
    output$table <- renderTable({ 
      d()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
