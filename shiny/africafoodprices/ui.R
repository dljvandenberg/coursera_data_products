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
            
            h3("About the application"),
            
            div(
                "This web application displays historical data of commodity prices (mainly agricultural) in a number of countries (mainly in Africa).
                Visualizations have been generated from the data without additional cleaning (note that some outliers have been observed). Feel free to use, re-use or contribute to the",
                a(href="https://github.com/dljvandenberg/coursera_data_products", "code"),
                "or to",
                a(href="http://dljvandenberg.github.io", "contact"),
                "me."
            ),
            
            h3("About the data"),
            
            div(
                "Data was generously provided by", a(href="http://opendataforafrica.org", "The African Development Bank."),
                "Terms of use for the data can be found", a(href="http://opendataforafrica.org/legal/termsofuse", "here.")
            )
        )
    )
)