library(arcgis)

# Search the Living Atlas
# https://livingatlas.arcgis.com/en/browse/#q=usa%20cities


furl <- "https://services.arcgis.com/P3ePLMYs2RVChkJx/arcgis/rest/services/USA_Major_Cities_/FeatureServer/0"


# create a reference to Layer
cities_fl <- arc_open(furl)
cities_fl


# Read in as an {sf} object
cities_sf <- arc_select(cities_fl)

cities_sf


# select only the cities in California
arc_select(
  cities_fl,
  where = "state_abbr = 'CA'"
)

# remove columns we don't want:
ca_cities <- arc_select(
  cities_fl,
  where = "state_abbr = 'CA'",
  fields = c("OBJECTID", "NAME", "PLACE_FIPS", "POPULATION")
)

ca_cities
