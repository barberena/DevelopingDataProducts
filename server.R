# to install rCharts, use the following
#   require(devtools)
#   install_github('ramnathv/rCharts')

library(shiny);
library(rCharts);
library(leaflet);

# Data was found throug the Public Safety Open Data Portal
#  http://publicsafetydataportal.org/all-data/
# The data was retrieved using the "export" tool directly from LAC's
# Open Data portal and downloaded as a CSV file.
#  https://data.lacounty.gov/Criminal/LA-SHERIFF-CRIMES-FROM-2004-TO-2015/3dxh-c6jw
# The CSV file was dirty and was cleaned during the research phase
# which is documented and can be found at the following URL:
# 

data <- read.csv("data/CrimeDataSmall.csv", na.strings=c("", "NA"))

# Retrieve the names of crames as well as the years avaliable in the data
crimeName <- sort(unique(data$CRIME_CATEGORY_DESCRIPTION))
crimeYear <- sort(unique(data$CRIME_YEAR))

# Shiny Happy Server Code
shinyServer(
  function(input, output){
    
    # input from the user updates the dataset and the number of incidents (crimes) found in the data
    dataset <- reactive({df<- data[which(data$CRIME_CATEGORY_DESCRIPTION == input$crimeName & data$CRIME_YEAR == input$crimeYear), ]})
    count <- reactive({paste("Incidents:", nrow(dataset()))})
    
    # return to the user the input they selected as well as the number of incidents/crimes found using the parameters given
    output$addYear <- renderText({paste("Year:", input$crimeYear)})
    output$addName <- renderText({paste("Crime Name:", input$crimeName)})
    output$addCount <- renderText({count() })
    
    # return from the full data the parameters the users are able to select from
    output$ControlsYear <- renderUI({
      list(selectInput("crimeYear", "Select Year", crimeYear, selected=crimeYear[1]) )
    })
    output$ControlsCrime <- renderUI({
      selectInput("crimeName", "Select Crime", as.character(crimeName), selected=crimeName[1])
    })
    
    # we render/update the map that the user sees
    output$myChart <- renderMap({
      # it can take sometime to update the map based on the parameters the users selects
      # so let's let them know that they should wait.
      progress = shiny::Progress$new()
      on.exit(progress$close())
      progress$set(message="Plotting Incidents on Map.  Please wait.", value=0)
      
      # read the sub dataset start rendering the map
      df <- dataset()
      map <- Leaflet$new()
      map$setView(c(33.95, -118.18),zoom=9)
      map$tileLayer(provider='Stamen.TonerLite') # black and white
      
      # place markers with popups onto the map
      for (ix in 1:nrow(df)) {
        map$marker(c(df[ix, "LATITUDE"], df[ix, "LONGITUDE"]), bindPopup = paste(df[ix,"CRIME_IDENTIFIER"], df[ix,"CRIME_DATE"], df[ix, "STATISTICAL_CODE_DESCRIPTION"], df[ix,"STREET"], df[ix,"CITY"], sep="<br>"))
      }
      
      # make sure we can see as much data as we are allowed
      map$fullScreen(TRUE)
      
      # return the map to the output
      map
  })
})