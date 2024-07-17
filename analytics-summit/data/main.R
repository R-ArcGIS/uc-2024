library(sf)
library(dplyr)
library(readr)
library(arcgis)

# read in dataset
businesses <- read_csv("data/atlanta_businesses.csv")

# authenticate to AGOL
set_arc_token(auth_user())

# geocode addresses
geocoded <- geocode_addresses(
  businesses$SINGLELINE
)

# Select only a subset of fields
geo_clean <- geocoded |>
  select(
    st_addr, nbrhd, city,
    subregion, region, region_abbr,
    postal, postal_ext, country
  )

# Combining geocoded with original data
clean_businesses <- bind_cols(
  select(businesses, NAME, TYPE, SALES),
  geo_clean
) |>
  st_as_sf()

# publish to AGOL
res <- publish_layer(
  clean_businesses,
  "Atlanta Businesses"
)
