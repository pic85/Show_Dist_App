#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    
    plot(x=NULL, y = NULL, xlim = c(-10,10), ylim = c(0, 0.9), ylab = "")
    
    ifelse(input$prob_dist == "f", curve(df(x, input$df1, input$df2), -10,10, add = T),
           ifelse(input$prob_dist == "t", curve(dt(x, df = input$df1), -10,10,  add = T),
                  ifelse(input$prob_dist == "chisq", curve(dchisq(x, df = input$df1), -10,10,  add = T),
                         paste("No probablity distribution called", input$prob_dist, "found")
                  )
           )
    )
    
  })
})