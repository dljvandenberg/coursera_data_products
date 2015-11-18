# TODO: fill choices with data from dataset, for example: levels(df.prices$country)
country.choices <- c("Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "Cameroon", "Cape Verde", "Central African Republic", "Chad", "China", "Comoros", "Congo", "Côte d'Ivoire", "Democratic Republic of the Congo", "Djibouti", "Egypt", "Equatorial Guinea", "Eritrea", "Ethiopia", "Gabon", "Gambia", "Ghana", "Guinea", "Guinea Bissau", "Kenya", "Lesotho", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique", "Namibia", "Niger", "Nigeria", "Rwanda", "Sao Tome and Principe", "Senegal", "Seychelles", "Sierra Leone", "Somalia", "South Africa", "South Sudan", "Sudan", "Swaziland", "Togo", "Tunisia", "Uganda", "United Republic of Tanzania", "Zambia", "Zimbabwe")
indicator.choices <- c("Beef with bones", "Bream fish", "Cooking Gas (LPG Cylinder)", "Cooking salt", "Diesel", "Gas (regular, unleaded)", "Goat meat", "Green cabbage", "Large size chicken eggs", "Loaf of white bread", "Maize grain", "Millet whole grain", "Nile perch", "Onion", "Pasteurized unskimmed milk", "Round tomato", "Sorghum white whole grain", "Spotted beans", "Sweet potatoes", "Vegetable oil", "Wheat flour", "White maize flour", "White rice, 25% broken", "White sugar", "Whole chicken frozen")

shinyUI(
    pageWithSidebar(
        headerPanel("Africa Food Prices"),
        sidebarPanel(
            # Input selection
            selectInput("country", "Country:", choices=country.choices),
            # TODO_OPTIONAL: add location options
            #selectInput("location", "Location:", choices=c("All Locations")),
            selectInput("indicator", "Indicator:", choices=indicator.choices),
            submitButton("Plot!")
        ),
        mainPanel(
            plotOutput("plot"),
            div("Source: Africa Food Prices Collection, ", a(href="http://africafoodprices.io", "http://africafoodprices.io"))
        )
    )
)