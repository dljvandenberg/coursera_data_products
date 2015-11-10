shinyUI(
    pageWithSidebar(
        headerPanel("Africa Food Prices"),
        sidebarPanel(
            # Input selection
            textInput("country", "Country:", ""),
            textInput("location", "Location:", ""),
            textInput("indicator", "Indicator:", ""),
            submitButton("Plot!")
        ),
        mainPanel(
            plotOutput("plot")
        )
    )
)
