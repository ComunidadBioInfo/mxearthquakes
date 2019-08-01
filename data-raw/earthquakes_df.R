## code to prepare `earthquakes_df` dataset goes here

# usethis::use_data("earthquakes_df")


earthquakes_df<-read.csv("data-raw/SSNMX_catalogo_19000801_20190801.csv", skip = 4)
earthquakes_df<-na.omit(earthquakes_df)
# length_earth<-nrow(earthquakes_df)
# earthquakes_table<-data.frame(earthquakes_df[c(-1:-4, -length_earth-7:-length_earth),])
# earthquakes_df<-read.csv(earthquakes_table)


