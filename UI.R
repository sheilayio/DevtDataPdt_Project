## User Interface for Shiny Application
## User can select the diet type to predict the weight of chick for the 
## diet at the selected age.

library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Chick Weight Predictor"),
        sidebarPanel(
                h6("This application predicts the weight of chick based on user 
                   selected diet and age of chick. The prediction algorithm is 
                   built on the Chick Weight dataset."),
                h6("Please select the diet type and age of chick to start the 
                   prediction:"),
                selectInput(inputId = "diet_type", label = "Diet Type",
                            choices = list("Diet 1" = 1, "Diet 2" = 2, 
                                           "Diet 3" = 3, "Diet 4" = 4), 
                            selected = 1), 
                numericInput(inputId = "age", label = "Age of Chick (days)",
                             value = 0, min = 0, max = 50, step = 1)
                ), 
        mainPanel(
                h4("You have selected Diet Type"),
                verbatimTextOutput("odiet_type"),
                h4("You have selected age of chick as "),
                verbatimTextOutput("oage"),    
                h4("Weight of chick (gm) predicted based on inputs..."),
                verbatimTextOutput("predictedWeight"),
                h3("Age vs Weight Plot for Selected Diet"),
                plotOutput("ChickPlot")
                )
        )
)