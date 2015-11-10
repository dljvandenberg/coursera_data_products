### Exploratory analysis - Africa Food Prices

# Set variables
setwd("~/git/coursera_data_products/shiny/africafoodprices")
file.data <- "./data/africafoodprices.csv"

# Data set
df.foodprices <- read.csv(file.data)
#df.foodprices <- read.csv(file.data, colClasses = c("factor", "factor", "factor", "factor","Date", "numeric"))

# TODO: convert classes of input data (date)
library(lubridate)
#dmy_hms("9/22/2014 12:00:00 AM")
# %Y-%m-%d %I:%M:%S %p

# TODO: choose subset of data (indicator=="Diesel") to start with
# DONE: does not contain NAs
# DONE: check Unit for each indicator (looks standard)
