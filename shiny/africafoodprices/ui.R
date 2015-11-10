shinyUI(
    pageWithSidebar(
        headerPanel("Africa Food Prices"),
        sidebarPanel(
            # Input selection
            # TODO: fill choices with data from dataset, for example: levels(df.prices$country)
            selectInput("country", "Country:", choices=c("Zimbabwe", "Algeria", "Liberia", "Nigeria")),
            selectInput("location", "Location:", choices=c("All Locations")),
            selectInput("indicator", "Indicator:", choices=c("Diesel", "Large size chicken eggs")),
            submitButton("Plot!")
        ),
        mainPanel(
            plotOutput("plot"),
            div("Source: Africa Food Prices Collection, ", a(href="http://africafoodprices.io", "http://africafoodprices.io"))
        )
    )
)
