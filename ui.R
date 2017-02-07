
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
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("King County Lost, Found, Adoptable Pet Data"),
  sidebarLayout(
  
  sidebarPanel(
  ),
  mainPanel(
    tabsetPanel(
  # Application title

  
  tabPanel("Map",leafletOutput("mymap")),
  
  tabPanel("Table",dataTableOutput('tbl'))
    )

  )

    
)
)
  
    
    
)
