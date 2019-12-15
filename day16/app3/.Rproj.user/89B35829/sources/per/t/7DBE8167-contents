
library(shiny)
shinyUI(fluidPage(
  titlePanel("Sliders"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("aaa", "Integer:", #aaa라는 이름으로 서버에 간다, "Integer:"는 제목
                  min=0, max=1000, value=500) #최소, 최대, 기본 
    ),
    mainPanel(
      h1("테스트"),
      #tableOutput("values")
      textOutput("values")
    )
  )
))