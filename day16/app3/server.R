
library(shiny)
shinyServer(function(input, output){
  sliderValues <- reactive({ #reactive 서로 상호작용한다(aaa를 바꿀때마다 자동으로 수행)
    data.frame(
      Parameter="BBB",
      Value = as.character(input$aaa)
    ) 
    
  })
  #output$values <- renderTable({
  # sliderValues()
  #})
  output$values <- renderPrint({
    sliderValues()
  })
})

