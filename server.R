
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

    htInput <- reactive({input$ht})

    wtInput <- reactive({input$wt})

    calcBMI <- reactive({round(703 * (wtInput() / htInput() ^ 2), 2)})

    classBMI <- reactive({
        if (calcBMI() < 18.5) {
            return("Underweight")
        } else {
            if (calcBMI() < 25) {
                return("Healthy Weight")
            } else {
                if (calcBMI() < 30) {
                    return("Overweight")
                } else {
                    return("Obese")
                }
            }
        }
    })

    output$htText <- renderText({
        # Print the height from the slider input in feet and inches (meters)
        paste0("Height: ", floor(htInput() / 12), "'", htInput() %% 12, "\"",
               " (", round(htInput() * 0.0254, 2), "m)")
    })

    output$wtText <- renderText({
        # Print the weight from the numeric input in pounds (kilograms)
        paste0("Weight: ", wtInput(), "lbs (", round(wtInput() * 0.453592, 2),
               "kg)")
    })

    output$bmi <- renderText({
        # Calculate BMI and print it
        calcBMI()
    })

    output$bmi.class <- renderText({
        classBMI()
    })

})
