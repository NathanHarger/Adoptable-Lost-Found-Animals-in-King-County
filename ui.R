#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#absolutePanel

library(shiny)
library(leaflet)
library(DT)
library(plotly)
library(flexdashboard)
# Define UI for application that draws a histogram
shinyUI(navbarPage("Adoptable, Lost, Found Animals in King County", inverse=TRUE,
# Application title
     tabPanel("Map",
              tags$head(tags$style(
                HTML('
                     #sidebar {
                      background-color: #FFFFFF;
                      opacity: .85;
                     }
                     
                     #copyright{
                      font-size: x-small;
                     }
                   
                     #mymap{
                   height:89vh !important;
                  
                      }
                     '
         
                )
                )),
                
          
     leafletOutput("mymap"),
     div("Data Provided by:" ,a(href="https://data.kingcounty.gov/Pets/Lost-found-adoptable-pets/yaai-7frk", em("Regional Animal Services of King County")), id = "copyright"),
    
    
      absolutePanel( id="sidebar" ,
                    top = 30, left = "auto", right = 20, bottom = 0,width="30%", height = "89%",
                      
    
    
 
           
    

  plotOutput("cityPie", height ="40%"), flexdashboard::gaugeOutput("breedType"),plotOutput("breedPie", height="40%")

  )),
     
  tabPanel("Table",dataTableOutput('tbl'))
   )
  
)

  


    