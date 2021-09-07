```{r load packages, message=FALSE}
library(sf)
library(tidyverse)
library(ggspatial)
library(ggthemes)
boundaries <- st_read("https://bostonopendata-boston.opendata.arcgis.com/datasets/142500a77e2a4dbeb94a86f7e0b568bc_9.kml?outSR=%7B%22latestWkid%22%3A2249%2C%22wkid%22%3A102686%7D", quiet = TRUE)
fireboxes<- st_read("https://bostonopendata-boston.opendata.arcgis.com/datasets/3a0f4db1e63a4a98a456fdb71dc37a81_1.kml?outSR=%7B%22latestWkid%22%3A2249%2C%22wkid%22%3A102686%7D", quiet = TRUE)
policestation <-st_read("https://bostonopendata-boston.opendata.arcgis.com/datasets/e5a0066d38ac4e2abbc7918197a4f6af_6.kml?outSR=%7B%22latestWkid%22%3A2249%2C%22wkid%22%3A102686%7D", quiet = TRUE)

policestation_plot <- ggplot(policestation) + geom_sf()

policestation_plot

ggplot(policestation) +
  geom_sf(shape = 17, color = "blue", size = 5, alpha = 0.3)

policestation_plot+ geom_sf (data = fireboxes) + geom_sf(data = boundaries)

ggplot()+ geom_sf (data = boundaries, color = "purple", size =3, fill = 'blue', alpha = 0.5) + geom_sf(data = policestation, colour = "green") + geom_sf (data = fireboxes, colour = "red")

#{r boston public spaces and police station with base map as precints}

precincts <- st_read("https://bostonopendata-boston.opendata.arcgis.com/datasets/3525b0ee6e6b427f9aab5d0a1d0a1a28_0.kml?outSR=%7B%22latestWkid%22%3A2249%2C%22wkid%22%3A102686%7D")
freewifi <- st_read("https://bostonopendata-boston.opendata.arcgis.com/datasets/6a7a0ab4e964471f819d40078b17e7fa_0.kml?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D")
publicspace <- st_read("https://bostonopendata-boston.opendata.arcgis.com/datasets/2868d370c55d4d458d4ae2224ef8cddd_7.kml")

precinct_plot <- ggplot(precincts) + geom_sf()

precinct_plot

precinct_plot + geom_sf(data = publicspace, fill = 'blue', alpha = 0.5) + geom_sf(data = freewifi, color = "red",size = 3)
precinct_plot + geom_sf(data = publicspace, fill = 'blue', alpha = 0.5) + geom_sf(data = policestation, shape = 20, color = "red", size = 5)
precinct_plot + geom_sf(data = publicspace, fill = 'blue', alpha = 0.5) + geom_sf(data = freewifi, color = "red",size = 3)+   annotation_map_tile(zoomin = 0, progress = "none", type = "cartolight")  + geom_sf() + labs(caption = "Map tiles and data by OpenStreetMap")

'''{r boston neighbourhoods and police and house prices}