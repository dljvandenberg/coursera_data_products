# Libraries
library(lubridate)
library(ggplot2)

# Set variables
setwd("~/git/coursera_data_products/shiny/africafoodprices")
file.data <- "./data/africafoodprices.csv"

# Read data and convert classes
df.prices <- read.csv(file.data)
df.prices$Date <- mdy_hms(df.prices$Date)

# Interactive user session code
shinyServer(
    function(input, output) {
        # TODO: select vars from user input
        # country.selected <- input$country
        # location.selected <- input$location
        # indicator.selected <- input$indicator
        country.selected <- "Zimbabwe"
        location.selected <- "All Locations"
        indicator.selected <- "Diesel"
        
        # Select subset of data
        df.selection <- subset(df.prices, country==country.selected & indicator==indicator.selected & location==location.selected)
        
        # DEBUGGING CODE
        output$table1 <- renderText(head(df.selection))
        
        # Plot
        output$plot.date.vs.value <- renderPlot(qplot(Date, Value, data=df.selection))
    }
)
