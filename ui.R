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
    selectInput("What", 
                label = "Choose something to display",
                choices = c("Percent White", "Percent Black",
                            "Percent Hispanic", "Percent Asian"),
                selected = "Percent White")  ,
  
 
  selectInput("Where", 
              label = "Choose a location to norrow the search",
              choices = c("Percent White", "Percent Black",
                          "Percent Hispanic", "Percent Asian"),
              selected = "Percent White")  ,
  sliderInput("When", "Choose year range to display", sep = "", animate=TRUE,
              min = 2013, max = 2017, value = 2013)),
  
  
  mainPanel(
    tabsetPanel(
  # Application title

  
  tabPanel("Map",leafletOutput("mymap")

),
  
  tabPanel("Table",dataTableOutput('tbl'))
    )
  

  )

    
)
)
  
    
    
)
