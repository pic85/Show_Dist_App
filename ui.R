#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
  titlePanel("This is a simple app to display the shapes of probability distributions"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("prob_dist", label = "Choose the probability distribution to display",
                   choiceNames = c("F","Student's t", "Chi square"), choiceValues = c("f","t", "chisq")
      ),
      sliderInput("df1", "Set the degrees of freedom", 
                  min = 1,
                  max = 20,
                  value = 1
      ),
      sliderInput("df2", "Set the degrees of freedom (only for F distribution)", 
                  min = 1,
                  max = 20,
                  value = 1)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
))