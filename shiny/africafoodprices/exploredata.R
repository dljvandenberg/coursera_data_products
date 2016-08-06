### Exploratory analysis - Africa Food Prices

# Libraries
library(lubridate)
library(ggplot2)
library(plotly)

# Set variables
setwd("~/git/coursera_data_products/shiny/africafoodprices")
file.data <- "./data/africafoodprices.csv"

# Read data and convert classes
df.prices <- read.csv(file.data)
df.prices$Date <- mdy_hms(df.prices$Date)

# Show indicators and countries
head(levels(df.prices$indicator))
head(levels(df.prices$country))

# Select subset of data
country.selected <- "Madagascar"
indicator.selected <- "Vegetable oil"
#df.selection <- subset(df.prices, country==country.selected & indicator==indicator.selected)
df.selection <- subset(df.prices, country==country.selected & indicator==indicator.selected & location!="All Locations")

# Title and label
ylabel <- as.character(df.selection$Unit[1])
title <- paste("Price development of ", indicator.selected, " in ", country.selected, sep="")

# Types of fit
#geom.point <- geom_point()
#geom.smooth <- geom_smooth(method="loess", se=FALSE)
#geom.smoothconf <- geom_smooth(method="loess", se=TRUE)
#geom.line <- geom_line()

# Plot
#ggplot(df.selection, aes(x = Date, y = Value, color = location)) + geom_point(size=.5) + geom_line() +
#    ggtitle(title) + xlab("Date") + ylab(ylabel)
#ggplotly()

# Improved plot
ggplot(df.selection, aes(x = Date, y = Value, color = location)) + geom_point(size=.5) + geom_line() +
    ggtitle(title) + xlab("Date") + ylab("USD/litre") + scale_color_discrete(name="Region")
ggplotly()



