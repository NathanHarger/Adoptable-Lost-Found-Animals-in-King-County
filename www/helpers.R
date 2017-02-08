
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



