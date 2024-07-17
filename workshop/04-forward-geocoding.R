library(arcgisgeocode)

addresses <- c(
  "380 New York Street Redlands, California, 92373, USA",
  "Esri Redlands",
  "ESRI CA"
)

locs <- find_address_candidates(
  addresses,
  max_locations = 1L
)

dplyr::glimpse(locs)
