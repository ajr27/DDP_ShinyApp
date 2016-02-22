
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

    title = "BMI Calculator",

    fluidRow(
        column(12, div(h1("BMI Calculator"), align = "center"))
    ),

    br(),

    p("This application takes height in inches and weight in pounds as inputs
      to calculate a Body Mass Index (BMI). The formula used for the
      calculation is very basic, which is to say that more advanced formulae
      also take into account factors like gender, chest circumfrence, waist
      circumfrence, etc."),

    p("The first line of text on the right dynamically shows height in feet and
      inches and meters. The second line of text dynamically shows the weight in
      the weight text box in pounds and kilograms. The resulting BMI is shown
      below these two lines."),

    hr(),

    fluidRow(
        column(4, offset = 1,
               wellPanel(sliderInput("ht", "Height in inches:", min = 1,
                                     max = 108, value = 65)),
               wellPanel(numericInput("wt", "Weight in pounds:", min = 1,
                                      max = 700, value = 150))
        ),

        column(6, offset = 1,
               div(textOutput("htText"), style = "font-size:16pt"),
               div(textOutput("wtText"), style = "font-size:16pt"),
               br(),
               div(strong("BMI: ", style = "font-size:16pt")),
               div(strong(textOutput("bmi"),
                          style = "color:red; font-size:40pt")),
               div(strong(textOutput("bmi.class"), style = "font-size:20pt"))
        )
    ),

    hr(),

    h4("How to use this BMI calculator:"),

    p("1. Use the slider labeled \"Height in inches\" to select a height"),
    p("2. Enter weight in pounds in the text box labeled \"Weight in pounds:\"
      by either typing it in or adjusting the value with the up/down arrow
      buttons on the right.")
))
