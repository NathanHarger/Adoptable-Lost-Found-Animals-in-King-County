#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(DT)
library(plotly)
library(flexdashboard)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  h4("King County Lost, Found, Adoptable Pet Data"),
 
  

  
  
  
    tabsetPanel(
      
      
  # Application title

  
  tabPanel("Map",
    
    
 
           
    

  column( 12,leafletOutput("mymap"),splitLayout(cellWidths = c("33%", "33%","33%"),cellHeights = c("33%", "33%","33%"),plotOutput("cityPie"),flexdashboard::gaugeOutput("breedType"),plotOutput("breedPie")))

  ),
  
  tabPanel("Table",dataTableOutput('tbl'))
   

)

))

  


    