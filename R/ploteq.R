library(tidyverse)
library(leaflet)

data("earthquakes_df")
head(earthquakes_df)
class(earthquakes_df)
str(earthquakes_df1)

earthquakes_df1 <- earthquakes_df %>%
    mutate(date = as.character(date)) %>%
    type_convert(cols(date = "c")) %>%
    separate(col = date, c("year", "months", "day")) %>%
    drop_na() %>%
    filter(state == " OAX") %>%
    filter(year == "2019") %>%
    filter(magnitude > 4)


head(earthquakes_df1)
dim(earthquakes_df1)

magma <- c("#000004FF", "#1D1146FF", "#50127CFF", "#822681FF", "#B63779FF",
           "#E65163FF", "#FB8761FF", "#FEC387FF", "#FCFDBFFF")
pal <- colorFactor(magma, domain = earthquakes_df1$magnitude)

pal <- colorFactor(c("navy", "red"), domain = c("ship", "pirate"))

leaflet() %>%
    addTiles() %>%
    addCircleMarkers(earthquakes_df1$longitude, earthquakes_df1$latitude,
                    weight = 8, radius = 2*earthquakes_df1$magnitude, stroke = F, fillOpacity = 0.4,
                    #color = ~pal(type),
                    popup = paste(sep = " ",
                                  "State:",earthquakes_df1$state,"<br/>",
                                  "Local data:",earthquakes_df1$location,"<br/>",
                                  "Date:",earthquakes_df1$date, "<br/>"
                                  ))
