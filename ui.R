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
shinyUI(
  bootstrapPage(
    # Application title
    tags$head(tags$style(".leaflet-control-zoom { display: none; }")),
    tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
    tags$head(tags$style(
      HTML(
        '
        #sidebar {
        background-color: #FFFFFF;
        opacity: .85;
        }
        
        #copyright{
        font-size: x-small;
        }
        
        #title{background-color: #41f4bb;text-transform:capitalize; font-size: xx-large; text-align:center;}
        '
        
      )
    )),
    leafletOutput("mymap", width = "100%", height = "100%"),
    
    absolutePanel(
      id = "sidebar" ,
      top = "5%",
      left = "auto",
      right = 0,
      bottom = 0,
      width = "30%",
      height = "95%",
      
      plotOutput("cityPie"),
      plotOutput("breedPie", height = '35%'),
      flexdashboard::gaugeOutput("breedType"),
      div(
        "Data Provided by:" ,
        a(href = "https://data.kingcounty.gov/Pets/Lost-found-adoptable-pets/yaai-7frk", em("Regional Animal Services of King County")),
        id = "copyright"
      )
      
    ),
    absolutePanel(
      id = "title",
      top = 0,
      left = 0,
      right = "auto",
      bottom = 0,
      width = "100%",
      height = "5%",
      div("Adoptable, Lost, Found Animals in King County")
    )
    )
    )