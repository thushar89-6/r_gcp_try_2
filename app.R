# Define UI for the application
ui <- fluidPage(
  titlePanel("Simple R Shiny App changed"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
        "Number of bins:",
        min = 5,
        max = 50,
        value = 30
      )
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- rnorm(500) # Generate random data
    hist(x,
      breaks = input$bins, col = "blue", border = "white",
      main = "Histogram of Randomly Generated Data",
      xlab = "Value", ylab = "Frequency"
    )
  })
}

# Run the application with a specified port and host
shinyApp(ui = ui, server = server, options = list(host = "127.0.0.1", port = 5050))
