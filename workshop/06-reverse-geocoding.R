library(sf)
library(dplyr)

# USA State Capitals
fp <- "https://analysis-1.maps.arcgis.com/sharing/rest/content/items/85bcfca158d641b99e7579b47cfee91e/data"

# read the csv
capitals <- readr::read_csv(fp) |>
  # convert to an sf object with EPSG:4326
  st_as_sf(
    coords = c("longitude", "latitude"),
    crs = 4326
  )

# preview data
capitals

# reverse geocode
geocoded <- reverse_geocode(st_geometry(capitals))

# preview
glimpse(geocoded)
