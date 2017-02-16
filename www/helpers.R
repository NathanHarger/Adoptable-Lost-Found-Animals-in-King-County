
# gets animal data from King County website
getData <- function() {
  url <-  "https://data.kingcounty.gov"
  path <- "resource/murn-chih.json"
  raw.result <- GET(url=url,path=path)
  raw.result.content <- rawToChar(raw.result$content)
  content <- fromJSON(raw.result.content)
  names(content)[names(content)=="obfuscated_longitude"] <- "long"
  names(content)[names(content)=="obfuscated_latitude"] <- "lat"
    return(content)
}


getCityList <- function(){
              return(c("Algona",
              "Auburn",
              "Beaux Arts Village",
              "Bellevue",
              "Black Diamond",
              "Bothell",
              "Burien",
              "Carnation",
              "Clyde Hill",
              "Covington" ,
              "Des Moines" ,
              "Duvall",
              "Enumclaw",
              "Fall City",
              "Federal Way",
              "Hunts Point",
              "Issaquah",
              "Kenmore",
              "Kent",
              "Kirkland",
              "Lake Forest Park",
              "Maple Valley",
              "Medina",
              "Mercer Island",
              "Milton",
              "Newcastle",
              "Normandy Park",
             "North Bend",
              "Pacific",
              "Redmond",
              "Renton",
              "Sammamish",
              "SeaTac",
              "Seattle",
              "Shoreline",
              "Skykomish",
              "Snoqualmie",
              "Tukwila",
              "Woodinville",
             "Yarrow Point"))}


getLat <- function()
          {
          return(c(
         47.282222, #  
         47.302222,  #
         47.585833,#
         47.6,#
         47.317778,#
         47.771667,#
         47.468333,#
         47.648333,#
         47.630278,#
         47.365833,#
         47.394167,#
         47.734167,#
         47.2025,#
         47.566389, #
         47.316667,#
         47.636667,#
         47.535556,#
         47.752778,	#
         
         47.365833,#Kent
         47.685833,#Kirkland
         47.756667,#Lake Forest Park
         47.366111,#Maple Valley
         47.626667,#Medina
         47.5775,#Mercer Island
         47.248333,#Milton
         47.533215,#Newcastle
         47.437222,#Normandy Park
         47.493889,#North Bend
         47.263333,#Pacific
         47.669444,#Redmond
         47.486667,#Renton
         47.608889,	#Sammamish
         47.441389,#SeaTac
         47.608013,#Seattle
         47.756389,#Shoreline
         47.71,#Skykomish
         47.533056,# Snoqualmie
         47.478333,#Tukwila
         47.7525,#	Woodinville
         47.644167))#Yarrow Point
      }
getLong <- function()
{
  return(c(-122.254167,
          -122.214722,
          -122.201944,
          -122.166667,
          -122.014722,
          -122.204444,
          -122.345556,
          -121.908611,
          -122.216667,
          -122.100278,
          -122.318056,
          -121.975556,
          -121.994167,
          -121.895,
          -122.35,
          -122.230556,
          -122.043333,
          -122.247222,
          -122.2348,
          -122.191667,
          -122.289722,
          -122.044722,
          -122.232778,
          -122.212,
          -122.3175,
          -122.172101,
          -122.343333,
          -121.786111,
          -122.247778,
          -122.123889,
          -122.195278,
          -122.042222,
          -122.293056,
          -122.333167,
          -122.339722,
          -121.355833,
          -121.844444,
          -122.275556,
          -122.155833,
          -122.216667))
}

