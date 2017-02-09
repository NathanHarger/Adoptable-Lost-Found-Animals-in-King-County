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
  df[12,2] <- df[12,2] +df[13,2]
 df[31,2] <- df[31,2] +df[32,2]
  df <- df[-c(33,32, 23,22,13,1),]
  df["lat"] <- c(47.282222,47.302222,47.6,47.771667,47.468333,47.648333,47.365833,47.734167,47.807869, 47.2025, 47.566389, 47.316667, 47.535556, 	47.752778, 	47.382778, 47.685833, 47.827778, 47.366111, 47.493889, 47.669444, 47.486667, 47.608889, 47.441389, 47.609722, 47.756389,	47.533056, 47.241389, 47.478333, 47.644167)
  df["lng"] <-  c(-122.254167, -122.214722, -122.166667, -122.204444	,-122.345556,-121.908611,-122.100278,  -121.975556, -122.360133, -121.994167,-121.895,	-122.35, -122.043333, -122.247222,-122.226944,-122.191667, -122.305278,-122.044722, -121.786111,-122.123889, -122.195278,-122.042222, -122.293056,-122.333056, -122.339722, -121.844444, -122.459444, -122.275556, -122.216667		)
  View(df)
   return(df)
  
}
#dataTable <-  table(aData$animal_breed,aData$city) 

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

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
    leaflet(dogCountTable()) %>%
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = FALSE)
      ) %>%
      addCircleMarkers(popup=~as.character(Var1), radius=~Freq, stroke = FALSE, fillOpacity = 0.5)
  })
  
 
    

    
  
  
  



})





