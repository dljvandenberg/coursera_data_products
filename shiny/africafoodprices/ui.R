shinyUI(
    pageWithSidebar(
        headerPanel("Africa Food Prices"),
        sidebarPanel(
            # Input selection
            numericInput('id1', 'Numeric input, labeled id1', 0, min = 0, max = 10, step = 1),
            checkboxGroupInput("id2", "Checkbox",
                               c("Value 1" = "1",
                                 "Value 2" = "2",
                                 "Value 3" = "3")),
            dateInput("date", "Date:")
        ),
        mainPanel(
            plotOutput("plot.date.vs.value")
        )
    )
)
