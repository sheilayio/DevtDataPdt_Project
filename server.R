## Backend Processing of Shiny Application
## Reads in diet and age inputs from user, predict the chick weight based on 
## inputs, and display a plot showing age vs weight of chick based on the 
## selected diet.

library(shiny)
library(ggplot2)
library(data.table)

# Chick Weight Prediction
weightPredictor <- function(diet_type, age) {
        predictionModel <- lm(weight ~ Diet + Time, data = ChickWeight)
        inputParam <- data.frame(Diet = diet_type,
                                 Time = age)
        predictedWeight <- predict(predictionModel, inputParam)
        return(predictedWeight)
}

shinyServer(
        function(input, output) {
                output$odiet_type <- renderPrint({input$diet_type})
                output$oage <- renderPrint({input$age})
                output$predictedWeight <- renderPrint({
                        weightPredictor(input$diet_type, input$age)})
                output$ChickPlot <- renderPlot({
                        dataByDiet <- subset(ChickWeight, Diet == input$diet_type)
                        qplot(dataByDiet$Time, dataByDiet$weight, 
                             data = dataByDiet, xlab = "Age (days)", 
                             ylab = "Weight (gm)", geom = "smooth")
                })
        }
)