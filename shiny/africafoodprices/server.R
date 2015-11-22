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
            df.selection.tmp <- subset(df.prices, country==input$country & indicator==input$commodity)
            unique.units <- length(unique(df.selection.tmp$Unit))
            # Handle situation in which df.selection is empty or contains multiple different units
            if(unique.units==1){
                df.selection.tmp
            } else if(unique.units==0){
                cat("WARNING: Selection is empty")
                df.selection.tmp
            } else {
                # Filter using first unit in df.selection.tmp
                cat("WARNING: Multiple different units in selection. Choosing first one")
                subset(df.selection.tmp, Unit==df.selection.tmp$Unit[1])
            }
        })
        
        # Determine title and ylabel for plot
        ylabel <- reactive({
            # Check whether only single unique unit is used with this selection
            if(length(unique(df.selection()$Unit))==1) {
                df.selection()$Unit[1]
            }
        })
        title <- reactive({
            paste("Price development of ", input$commodity, " in ", input$country, sep="")
        })
        
        # Determine fit type (geom)
        fit <- reactive({
            if (input$fit=="Connected points"){
                geom_line()
            } else if (input$fit=="Smooth"){
                geom_smooth(method="loess", se=FALSE)
            } else if (input$fit=="Smooth with confidence interval"){
                geom_smooth(method="loess", se=TRUE)
            } else if (input$fit=="Linear"){
                geom_smooth(method="lm", se=FALSE)
            } else if (input$fit=="Linear with confidence interval"){
                geom_smooth(method="lm", se=TRUE)
            } else {
                geom_point()
            }
        })
        
        # Plot
        output$plot <- renderPlot(qplot(Date, Value, data=df.selection(), main=title(), ylab=ylabel()) + aes(color=location) + fit())
    }
)