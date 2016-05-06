# to install rCharts, use the following
#   require(devtools)
#   install_github('ramnathv/rCharts')

library(shiny);
library(rCharts);
library(leaflet)

shinyUI(pageWithSidebar( 
  titlePanel("Los Angeles County Crime"),
  sidebarPanel(h3("Parameters"), uiOutput("ControlsYear"), uiOutput("ControlsCrime")),
  mainPanel(
    tabsetPanel(
      tabPanel("Document", includeMarkdown("README.md")),
      tabPanel("Map",h4(textOutput("addYear")),
               h4(textOutput("addName")),
               h4(textOutput("addCount")),
               tags$style(".leaflet {height: auto; width: auto}"),
               showOutput("myChart", "leaflet"))
    )
  )
))