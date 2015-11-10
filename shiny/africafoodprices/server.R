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
        
        # TODO: check if only single unit is used with this selection
        ylabel <- df.selection$Unit[1]
        title <- paste("Price of ", indicator.selected, " in ", country.selected, sep="")
        
        # Plot
        output$plot <- renderPlot(qplot(Date, Value, data=df.selection, main=title, ylab=ylabel))
    }
)