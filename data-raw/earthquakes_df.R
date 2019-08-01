## code to prepare `earthquakes_df` dataset goes here

# usethis::use_data(earthquakes_df)


earthquakes_df <- read.csv("data-raw/SSNMX_catalogo_19000801_20190801.csv", skip = 4)
earthquakes_df <- na.omit(earthquakes_df)

earthquakes_df <- earthquakes_df[, -c(8:10)]
earthquakes_names <- c("date", "hour", "magnitude", "latitude",
                    "longitude","depth", "location")
colnames(earthquakes_df) <- earthquakes_names


save(earthquakes_df, file = "data/earthquakes_df.rda")


