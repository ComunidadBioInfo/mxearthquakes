#Comments just for user
#usethis::use_package("dplyr") # defoult
#Adding dplyr to Imports
# Refer to functions with dplyr:: mutate
#usethis::use_package("tidyr") # defoult
# Refer to functions with tidyr:: mutate
#usethis::use_package("leaflet", "Suggest")
# Refer to functions with leaflet:: colorNumeric
# Refer to functions with leaflet:: leaflet

#' ploteq
#'
#'Ploteq an interactive map with leaflet for earthquakes in every state
#'
#' @param state1 States of Mexico with its standard short name style
#' @param year1 The year of earthquake
#'
#' @return a map interactive with notes in every point
#' @importFrom dplyr %>%
#' @export
#'
#'
#' @examples ploteq("Veracruz", 2003)
ploteq <- function(state1, year1){
    earthquakes_df1 <- earthquakes_df %>%
        dplyr::mutate(date1 = as.character(date)) %>%
        readr::type_convert(cols(date = "c")) %>%
        tidyr::separate(col = date1, c("year", "months", "day")) %>%
        tidyr::drop_na() %>%
        dplyr::filter(state == state1) %>%
        dplyr::filter(year == year1)
    #    filter(magnitude > magnitude1)


    pal <- leaflet::colorNumeric( palette = "plasma",
                         domain = earthquakes_df1$magnitude)

    leaflet::leaflet() %>%
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

#an example
#ploteq("Veracruz", 2003)
