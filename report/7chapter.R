#6지도
#6.2 지형정보 지도
install.packages("leaflet")
install.packages("ggplot2")
library(leaflet)
library(ggplot2)


m<-leaflet() %>%
  setView(lng = 126.976882, lat = 37.574187, zoom =  = 1) %>%
  addTiles()

m


m <- leaflet() %>% addTiles() %>% addMarkers(lng = 126.976882, lat = 37.574187, 
                                             label = "광화문 광장", popup = "행사 안내")
m

m <- leaflet() %>% setView(lng = 126.976882, lat = 37.574187, zoom = 14) %>%
      addTiles() %>% addMarkers(lng = 126.976882, lat = 37.574187, 
                            label = "광화문 광장", popup = "행사 안내")
m

#6.3 지형정보 지도를 이용한 지진 분포 파악
quakes

leaflet(data = quakes) %>% addTiles() %>% addCircleMarkers(
  ~long, ~lat,
  radius = ~mag,
  stroke = TRUE, weight = 1, color = "black",
  fillColor = "red", fillOpacity = 0.3)

leaflet(data = quakes) %>%
  addTiles() %>%
  addCircleMarkers(
    ~long, ~lat,
    radius = ~ifelse(mag >=6,10,1),
    stroke = TRUE, weight = 1, color = "black",
    fillColor = "red", fillOpacity = 0.3
  )
#6.4 우리나라 행정경계 지도


