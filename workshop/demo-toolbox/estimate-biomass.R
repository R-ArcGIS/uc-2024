library(arcgisbinding)
library(terra)

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
  arc.progress_pos(50)
  arc_raster <- arc.raster(raster_open, nrow = 500, ncol = 500, 
                           resample_type="NearestNeighbor", 
                           extent=bbox)
  
  r_raster <- rast(as.raster(arc_raster))

  # get total forested area
  print('Getting total forested area...')
  arc.progress_label('Getting total forested area...')
  arc.progress_pos(75)
  forested <- r_raster == 2
  msk <- ifel(r_raster != 2, NA, 1)
  forested <- mask(r_raster == 2, msk)
  f_expanse <- expanse(forested, unit="ha")
  # plot(forested)
  
  # calculate est biomass
  
  # in real life, use the BIOMASS or FIESTA
  # do real forestry stuff, stratification, etc etc
  print(' ~ here you could use R packages like BIOMASS or FIESTA ~ ')
  print(' ~ this is just a placeholder for YOUR real analysis ~ ')
  AGBpHa <- 113 # placeholder
  biomass_est <- AGBpHa * f_expanse$area
  
  print('Writing output raster...')
  arc.progress_label('Writing output raster...')
  arc.progress_pos(90)
  f <- file.path(tempdir(), "temp.tif")
  writeRaster(forested, f, overwrite=TRUE)
  arc.write(outrst, arc.raster(arc.open(f)))
  
  arc.progress_label('Forested areas extracted.')
  arc.progress_pos(100)
  print(paste0('Area: ',f_expanse$area, ' hectares'))
  print(paste0('Biomass est: ',biomass_est,' metric tons'))
  
  out_params[["out_bio"]] <- biomass_est
  return(out_params)
}