library(dplyr)

# csv stored on AGOL
fp <- "https://analysis-1.maps.arcgis.com/sharing/rest/content/items/0423768816b343b69d9a425b82351912/data"

# read in addresses
restaurants <- readr::read_csv(fp) |>
  # remove extra columns
  select(-starts_with("reviews")) |>
  # create unique ID
  mutate(id = row_number())

restaurants

# authenticate to ArcGIS Online
set_arc_token(auth_user())

geocoded <- geocode_addresses(
  single_line = restaurants[["restaurant_address"]]
)

# preview the first 10 columns
glimpse(geocoded[, 1:10])


# join back together
joined_addresses <- left_join(
  restaurants,
  geocoded,
  by = c("id" = "result_id")
)

# preview
dplyr::glimpse(joined_addresses)
