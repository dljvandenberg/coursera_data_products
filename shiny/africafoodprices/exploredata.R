### Exploratory analysis - Africa Food Prices

# Libraries
library(lubridate)
library(ggplot2)

# Set variables
setwd("~/git/coursera_data_products/shiny/africafoodprices")
file.data <- "./data/africafoodprices.csv"

# Read data and convert classes
df.prices <- read.csv(file.data)
df.prices$Date <- mdy_hms(df.prices$Date)

# Select subset of data
df.selection <- subset(df.prices, country=="Zimbabwe" & indicator=="Diesel" & location=="All Locations")

# Plot
qplot(Date, Value, data=df.selection)