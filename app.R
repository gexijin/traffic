#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#





sadfasdf


library(shiny)
# read the data file
race <- read.csv("race.csv")

# some pre-processing
total_by_state <- table(race$STATENAME)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("My app!"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            # add a select input to select columns
            selectInput("selected_color", 
                        "Color:",
                        c("red", "blue")
            )
        ),

        

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- total_by_state
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = input$selected_color, border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
