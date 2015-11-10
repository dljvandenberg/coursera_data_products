# Libraries
library(lubridate)
library(ggplot2)

# Set variables
#setwd("~/git/coursera_data_products/shiny/africafoodprices")

# Read data and convert classes
df.prices <- read.csv("./data/africafoodprices.csv")
df.prices$Date <- mdy_hms(df.prices$Date)


# Interactive user session code
shinyServer(
    function(input, output) {
        # Select subset of data
        df.selection <- reactive({
            subset(df.prices, country==input$country & indicator==input$indicator & location==input$location)
        })      
        
        # TODO: check if only single unit is used with this selection
        #ylabel <- df.selection$Unit[1]
        #title <- paste("Price of ", indicator.selected, " in ", country.selected, sep="")
        
        # Plot
        # TODO: add ylab and main
        output$plot <- renderPlot(qplot(Date, Value, data=df.selection()))
    }
)