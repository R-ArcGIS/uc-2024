# authenticate
set_arc_token(auth_user())

publish_res <- publish_layer(
  ca_cities,
  "California Cities"
)

# extract new URL
new_furl <- publish_res$services$encodedServiceURL

# Read the new layer back into memory
ca_fl <- arc_open(new_furl) |>
  get_layer(0)

ca_fl |>
  arc_select()
