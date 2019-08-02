## code to prepare `earthquakes_df` dataset goes here

# usethis::use_data(earthquakes_df)


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


save(earthquakes_df, file = "data/earthquakes_df.rda")



