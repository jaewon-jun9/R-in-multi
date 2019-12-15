library(shiny)

shinyServer(function(input, output){
  output$summary <- renderPrint({
    dataset <- iris[-5]
    summary(dataset)
  })
  
})