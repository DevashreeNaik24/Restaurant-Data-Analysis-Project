install.packages("ggmap")
install.packages("sf")
install.packages("leaflet")
install.packages("dbscan")
install.packages("htmlwidgets")

library(ggmap)
library(ggplot2)
library(leaflet)
library(dbscan)
library(htmlwidgets)
library(sf)


file_path <- "/Users/devashreenaik/Desktop/Cognifyz Technologies Project (Data Analyst)/Dataset .csv"
data <- read.csv(file_path)

head(data)

leaflet(data) %>%
  addTiles() %>%  # Use OpenStreetMap tiles
  addCircleMarkers(
    lng = ~Longitude, lat = ~Latitude,
    popup = ~paste("Restaurant.Name:", Restaurant.Name),  
    radius = 5, color = "blue", fillOpacity = 0.7
  )

library(htmlwidgets)

map <- leaflet(data) %>%
  addTiles() %>%
  addCircleMarkers(
    lng = ~Longitude, lat = ~Latitude,
    popup = ~paste("Restaurant.Name:", Restaurant.Name),
    radius = 5, color = "blue", fillOpacity = 0.7
  )
saveWidget(map, "Restaurant_Map.html")
print("Interactive map saved as 'Restaurant_Map.html'")

data_sf <- st_as_sf(data, coords = c("Longitude", "Latitude"), crs = 4326)
coords <- st_coordinates(data_sf)

clusters <- dbscan(coords, eps = 0.01, minPts = 5)  
data$Cluster <- clusters$cluster

table(data$Cluster)

ggplot(data) +
  geom_point(aes(x = Longitude, y = Latitude, color = as.factor(Cluster))) +
  labs(title = "Clusters of Restaurants", color = "Cluster") +
  theme_minimal()

write.csv(data, "Restaurant_Clusters.csv", row.names = FALSE)
print("Clustered data saved as 'Restaurant_Clusters.csv'")

ggsave("Restaurant_Cluster_Map.png", width = 10, height = 8)
print("Static map saved as 'Restaurant_Cluster_Map.png'")

getwd()



