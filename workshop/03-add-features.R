# I've decided I want to have CA and nevada cities
library(dplyr)

nv_cities <- cities_sf |>
  filter(STATE_ABBR == "NV")

add_res <- add_features(ca_fl, nv_cities)
add_res
