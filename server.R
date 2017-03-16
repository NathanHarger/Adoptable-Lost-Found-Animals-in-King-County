
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

cityList <- getCityList()

latList <- getLat()

longList <- getLong()


content <- function(city,freq)
{
  result <- paste( sep="<br/>",
                   "<b><i>",city, "</i></b>", 
                   getAnimalDistribution(city,freq),paste("<p> Total: ", freq, "</p>"))
  
  
  
  
  return(result)
}

getAnimalDistribution <- function(city,freq)
{  
  animalTypeTable <- table(aData$city,aData$animal_type)
  
  row <- animalTypeTable[city,]
  result <- ""
  names <- colnames(row)
  for (cn in colnames(row))
  {
    
    
    
    result <- paste(result,cn, ":", " ", row[city,cn], "<br/>")
    
  }
  return(result)
  
}

dogCountTable <-function()
{
  
  df <- table(aData$city)
  df <- as.data.frame(df)
  
  #Var1 is the city column
  indecies <- which(tolower(cityList) %in% tolower(df$Var1) )
  df <- subset(df, tolower(df$Var1) %in% tolower(cityList))
  
  
  
  
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
ax <- list(
  title = "",
  zeroline = FALSE,
  showline = FALSE,
  showticklabels = FALSE,
  showgrid = FALSE
)
calculatePercentDog <- function()
{
  df <- table(aData$animal_type)
  loc <- grep("Dog",names(df), value=TRUE)
  dogTotal <- 0
  
  for(val in loc){
    dogTotal = dogTotal + df[[val]]
  }
  total <- sum(df)
  
  return(ceiling(dogTotal/total *100))
}

breedSummary <- function()
{
  
  df <-table(aData$animal_breed)
  
  df[["American Pit Bull Terrier"]] <- df[["American Pit Bull Terrier"]] + df[["Pit Bull"]]
  
  loc <- which(names(df) == "Pit Bull")
  df <- df[-c(loc)]
  
  df["Chihuahua"] <- df[["Chihuahua - Long Haired"]] + df[["Chihuahua - Smooth Coated"]]
  
  
  
  loc <- which(names(df) %in% c("Chihuahua - Long Haired","Chihuahua - Smooth Coated" ))
  
  df <- df[-c(loc)]
  
  
  
  return(df)
  
}
filterData <- function()
{
  #d<-aData[as.numeric(format(aData$date,'%Y')) == input$When,]
  
  return(aData)
}
citySummary <- function()
{
  df <- table(aData$city)
  return(df)
  
}


#dataTable <-  table(aData$animal_breed,aData$city) 

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  breedPieData <- breedSummary()
  output$breedPie <- renderPlot({
    pie(breedPieData[breedPieData > 5], main="Top Breeds", col=rainbow(length(breedPieData)))
    
    
  })
  output$breedType <- flexdashboard::renderGauge({
    gauge(calculatePercentDog(), min = 0, max = 100, symbol = '%', label = "Percent Dog",gaugeSectors(
      success = c(100, 6), warning = c(5,1), danger = c(0, 1), colors = c("#CC6699")
    ))
    
  })
  output$cityPie <- renderPlot({
    
    data <- citySummary()
    pie(data[data>5], main="Top Cities", col=rainbow(length(data))) 
  })
  
  #1,2,3,4,6,7,8
  output$tbl = DT::renderDataTable({
    datatable(
      aData,
      options=list(  pageLength=100, scrollY='500', scrollX ='500',
                     columnDefs = list(list(visible=FALSE,targets=c(5,13,14,21,27,28))))
      # first element is offset for hidden row identifier
      
      
    )
  })
  observe({
    filteredData <- filterData()
    output$mymap <- renderLeaflet({
      data <- dogCountTable()
      leaflet(dogCountTable()) %>% addTiles() %>%
        fitBounds(~min(lng),~min(lat),~max(lng), ~max(lat)) %>%
        addCircles(popup=content(as.character(data$Var1), data$Freq), radius=  ~Freq*100, stroke = TRUE, weight=2, fillOpacity = 0.5)
      
    })
  })
  
})




