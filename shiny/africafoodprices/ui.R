shinyUI(
    pageWithSidebar(
        headerPanel("Africa Food Prices"),
        sidebarPanel(
            # Input selection
            textInput("country", "Country:", ""),
            textInput("location", "Location:", ""),
            selectInput("indicator", "Indicator:", choices = c("Diesel", "Large size chicken eggs")),
            submitButton("Plot!")
        ),
        mainPanel(
            plotOutput("plot"),
            div("Source: Africa Food Prices Collection, ", a(href="http://africafoodprices.io", "http://africafoodprices.io"))
        )
    )
)
