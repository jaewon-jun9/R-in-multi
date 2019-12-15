library(ggmap)
library(leaflet)
install.packages("htmlwidgets")
library(htmlwidgets)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

home <- geocode(enc2utf8('마포구 연남로5길 30-5'), source="google")
lan <- home$lon
lat <- home$lat
msg <- '<strong>유지수의 집</strong><hr>연트럴파크 5분컷'
homemap <- leaflet() %>% setView(lng = lan, lat = lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='magenta', popup = msg )
homemap

saveWidget(homemap, file="mymap.html")
