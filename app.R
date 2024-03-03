library(shiny)
library(leaflet)


ui = fluidPage(
  leafletOutput("plot",height = "100vh")
)

server = function(input, output) {
  output$plot <- renderLeaflet({ 
    # use www folder 
    # temp = "WDPA_50NewCol/{z}/{x}/{-y}.png"
    ## use github 
    temp = "https://raw.githubusercontent.com/wajahat16079/birdRangerTiles/main/rich_all_clean/{z}/{x}/{-y}.png"
    temp = "https://raw.githubusercontent.com/wajahat16079/birdRangerTiles/main/Underprotected_8Bit/{z}/{x}/{-y}.png"
    temp = "https://raw.githubusercontent.com/wajahat16079/birdRangerTiles/main/WDPA_40/{z}/{x}/{-y}.png"
    
    leaflet() %>%
      addProviderTiles(providers$Esri.WorldTopoMap, group = "base") %>%
      # clearGroup("overlay") %>%
      addTiles(urlTemplate = temp,
               group = 'overlay',
               tileOptions(opacity = 0.7)) %>%
      setView(lat = 0.382122, lng = -72.063001, zoom = 5)
    })
}

shinyApp(ui = ui, server = server)