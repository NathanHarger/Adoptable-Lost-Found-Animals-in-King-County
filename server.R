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

data <- getData()

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   #1,2,3,4,6,7,8
  output$tbl = DT::renderDataTable({
    datatable(
      data,
      options=list(columnDefs = list(list(visible=FALSE,targets=c(0,5, 8:23,25,26,27:30)))),
      
      # first element is offset for hidden row identifier
      colnames = c('Age', 'Breed', 'Color', 'Sex','','Name','Species','','','','','','','','','','','','','','','','m','Status','','','','','','')
    )
})
  })
