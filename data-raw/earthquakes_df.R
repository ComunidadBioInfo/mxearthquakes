## code to prepare `earthquakes_df` dataset goes here

# usethis::use_data(earthquakes_df)

library(tidyverse)
earthquakes_df <- read_csv("data-raw/SSNMX_catalogo_19000801_20190801.csv", skip = 4)
earthquakes_df <- na.omit(earthquakes_df)

head(earthquakes_df)
earthquakes_df <- earthquakes_df[, -c(8:10)]
earthquakes_names <- c("date", "hour", "magnitude", "latitude",
                    "longitude","depth", "location")
colnames(earthquakes_df) <- earthquakes_names
earthquakes_df$magnitude <- as.numeric(earthquakes_df$magnitude)

earthquakes_df_states <- data.frame(earthquakes_df$location)
states <- data.frame(do.call('rbind',
                strsplit(as.character(earthquakes_df_states$earthquakes_df.location),
                ',',fixed = TRUE)))
colnames(states) <- c("location","state")

earthquakes_df <- earthquakes_df[,-7]
earthquakes_df <- cbind(earthquakes_df, states)

earthquakes_df$state <- str_replace_all(string = earthquakes_df$state,
                                        pattern = " ", repl = "")

levels(as.factor(earthquakes_df$state))


dplyr::mutate(Cultivo = recode(Cultivo,"amap" = "Amapola"))

earthquakes_df <- earthquakes_df %>%
    dplyr::mutate(state = recode(state,"AGS" = "Aguascalientes")) %>%
    dplyr::mutate(state = recode(state,"BC" = "Baja California")) %>%
    dplyr::mutate(state = recode(state,"BCS" = "Baja California Sur")) %>%
    dplyr::mutate(state = recode(state,"CAMP" = "Campeche")) %>%
    dplyr::mutate(state = recode(state,"CDMX" = "Ciudad de México")) %>%
    dplyr::mutate(state = recode(state,"CHIH" = "Chihuahua")) %>%
    dplyr::mutate(state = recode(state,"CHIS" = "Chiapas")) %>%
    dplyr::mutate(state = recode(state,"COAH" = "Coahuila")) %>%
    dplyr::mutate(state = recode(state,"COL" = "Colima")) %>%
    dplyr::mutate(state = recode(state,"DGO" = "Durango")) %>%
    dplyr::mutate(state = recode(state,"GRO" = "Guerrero")) %>%
    dplyr::mutate(state = recode(state,"GTO" = "Guanajuato")) %>%
    dplyr::mutate(state = recode(state,"HGO" = "Hidalgo")) %>%
    dplyr::mutate(state = recode(state,"JAL" = "Jalisco")) %>%
    dplyr::mutate(state = recode(state,"MEXICO" = "Estado de México")) %>%
    dplyr::mutate(state = recode(state,"MICH" = "Michoacán")) %>%
    dplyr::mutate(state = recode(state,"MOR" = "Morelos")) %>%
    dplyr::mutate(state = recode(state,"NAY" = "Nayarit")) %>%
    dplyr::mutate(state = recode(state,"NL" = "Nuevo León")) %>%
    dplyr::mutate(state = recode(state,"OAX" = "Oaxaca")) %>%
    dplyr::mutate(state = recode(state,"PUE" = "Puebla")) %>%
    dplyr::mutate(state = recode(state,"QR" = "Quintana Roo")) %>%
    dplyr::mutate(state = recode(state,"QRO" = "Querétaro")) %>%
    dplyr::mutate(state = recode(state,"SIN" = "Sinaloa")) %>%
    dplyr::mutate(state = recode(state,"SLP" = "San Luis Potosí")) %>%
    dplyr::mutate(state = recode(state,"SON" = "Sonora")) %>%
    dplyr::mutate(state = recode(state,"TAB" = "Tabasco")) %>%
    dplyr::mutate(state = recode(state,"TAMS" = "Tamaulipas")) %>%
    dplyr::mutate(state = recode(state,"TLAX" = "Tlaxcala")) %>%
    dplyr::mutate(state = recode(state,"VER" = "Veracruz")) %>%
    dplyr::mutate(state = recode(state,"YUC" = "Yucatán")) %>%
    dplyr::mutate(state = recode(state,"ZAC" = "Zacatecas"))

save(earthquakes_df, file = "data/earthquakes_df.rda")



