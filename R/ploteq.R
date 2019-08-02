library(tidyverse)
library(leaflet)

data("earthquakes_df")
head(earthquakes_df)
class(earthquakes_df)
str(earthquakes_df)

earthquakes_df[earthquakes_df$state == "Morelos",]

ploteq <- function(state1, year1, magnitude1){
    earthquakes_df1 <- earthquakes_df %>%
        mutate(date1 = as.character(date)) %>%
        type_convert(cols(date = "c")) %>%
        separate(col = date1, c("year", "months", "day")) %>%
        drop_na() %>%
        filter(state == state1) %>%
        filter(year == year1) %>%
        filter(magnitude > magnitude1)


    pal <- colorNumeric( palette = "plasma",
                         domain = earthquakes_df1$magnitude)

    leaflet() %>%
        addTiles() %>%
        addCircleMarkers(earthquakes_df1$longitude, earthquakes_df1$latitude,
                         weight = 19, radius = earthquakes_df1$magnitude, stroke = F,
                         fillOpacity = 0.9,
                         color = pal(earthquakes_df1$magnitude),
                         popup = paste(sep = " ",
                                       "State:",earthquakes_df1$state,"<br/>",
                                       "Local place:",earthquakes_df1$location,"<br/>",
                                       "Date:",earthquakes_df1$date, "<br/>",
                                       "Magnitude:", earthquakes_df1$magnitude
                         ))
}

ploteq("Oaxaca", 2000 , 4)
