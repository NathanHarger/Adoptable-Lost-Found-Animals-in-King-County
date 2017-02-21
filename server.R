#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(httr)
library(jsonlite)
source("www/helpers.R")

aData <- getData()

dogCountTable <-function()
{
  df <- table(aData$city)
  df <- as.data.frame(df)
  cityList <- getCityList()

  #Var1 is the city column
  indecies <- which(tolower(cityList) %in% tolower(df$Var1) )
  df <- subset(df, tolower(df$Var1) %in% tolower(cityList))
  
  
  latList <- getLat()
  
  longList <- getLong()

  
  lat <- c()
  long <- c()
  for(i in indecies)
  {
     lat[length(lat)+1] = latList[i]
    
     long[length(long)+1] = longList[i]
    
  
  }

 df[["lat"]] <- lat
  df[["lng"]] <-  long
   return(df)
  
}
#dataTable <-  table(aData$animal_breed,aData$city) 

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  filteredData <- function()
  {
    data <- dogCountTable()
    return(data[data$date == input$When,])
  }
   #1,2,3,4,6,7,8
  output$tbl = DT::renderDataTable({
    datatable(
      aData,
      options=list(  pageLength=100, scrollY='400px',columnDefs = list(list(visible=FALSE,targets=c(0,5, 8:23,25,26,27:30)))),
      
      # first element is offset for hidden row identifier
      colnames = c('Age', 'Breed', 'Color', 'Sex','','Name','Species','','','','','','','','','','','','','','','','','Status','','','','','','')

    )
  })

  output$mymap <- renderLeaflet({
    leaflet(filteredData()) %>%
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addCircles(popup=~as.character(Var1), radius=  ~Freq*100, stroke = TRUE, weight=2, fillOpacity = 0.5)
  })
  
 
    

    
  
  
  



})





