library(arcgisbinding)

tool_exec <- function(in_params, out_params) {
  bbox <- in_params[["extent"]]
  outrst <- out_params[["out_rst"]]
  
  arc.check_product()

  # Read image service from Living Atlas: Sentinel2 Land Cover

  raster_url <- 'https://env1.arcgis.com/arcgis/rest/services/Sentinel2_10m_LandCover/ImageServer'

  print('Reading land cover service metadata...')
  arc.progress_label('Reading land cover service metadata...')
  arc.progress_pos(25)
  raster_open <- arc.open(raster_url)
  
  print('Accessing land cover data...')
  arc.progress_label('Accessing land cover data...')
  arc.progress_pos(75)
  arc_raster <- arc.raster(raster_open, nrow = 500, ncol = 500, 
                         resample_type="NearestNeighbor", 
                         extent=bbox)

  arc.write(outrst, arc_raster)
  
  arc.progress_label('Data export complete')
  arc.progress_pos(100)
  print('Data export complete.')
  
  return(out_params)
}