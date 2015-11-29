### Exploratory analysis - Africa Food Prices

# Libraries
library(lubridate)
library(ggplot2)
library(rCharts)

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
country.selected <- "Burundi"
indicator.selected <- "Goat meat"
#df.selection <- subset(df.prices, country==country.selected & indicator==indicator.selected)
df.selection <- subset(df.prices, country==country.selected & indicator==indicator.selected & location!="All Locations")

# Title and label
ylabel <- df.selection$Unit[1]
title <- paste("Price development of ", indicator.selected, " in ", country.selected, sep="")

# Types of fit
geom.point <- geom_point()
geom.smooth <- geom_smooth(method="loess", se=FALSE)
geom.smoothconf <- geom_smooth(method="loess", se=TRUE)
geom.line <- geom_line()

# Plot using ggplot2
qplot(Date, Value, data=df.selection, main=title, ylab=ylabel) + aes(color=location) + geom.line

# Plot using rCharts -> date handling not standard + change point type?
hPlot(x = "Date", y = "Value", data = df.selection, type="line", group="location")
#df.selection.rchart <- transform(df.selection, Date = as.character(Date))
#mPlot(x = "Date", y = c("Value"), type = "Line", data = df.selection.rchart, color="location")
#hPlot(x = "Date", y = "Value", data = df.selection.rchart, type="line", group="location")
