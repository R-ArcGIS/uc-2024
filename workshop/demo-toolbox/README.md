## Disclaimer

__*This toolbox is for demonstration purposes ONLY. It is intended to provide an example of how R scripts can be integrated into a Geoprocessing toolbox in ArcGIS Pro. These tools do not contain valid R code for any analytical workflow, like calculating biomass, etc. etc. These tools also do not contain error handling or parameter validation code.*__


## Usage notes

1. Create or open an ArcGIS Pro project
2. Right-click on Toolboxes in the Catalog pane, and select "Add Toolbox"
3. Navigate to the location where the Natural Resource.atbx file is saved and select that toolbox
4. Ensure that the current map's CRS is WGS 1984 Web Mercator. (NOTE: it is not best practice to use this CRS for actual analysis. This is only for demonstration purposes.)
5. Now you should be able to run the Extract Land Use or Estimate Biomass tools. (The Assess Watershed and Identify Erosion Risk tools are "shells" with no R code - you can create R scripts for these if you wish!)

The included forest.lyrx file is used to set the symbology of the output raster layer for the Estimate Biomass tool. If you remove or re-name this file, the output layer will use a default symbology instead.


## Additional documentation and resources

- [R-ArcGIS Bridge Documentation: Geoprocessing Tools Overview](https://developers.arcgis.com/r-bridge/geoprocessing/overview/)
- [Create a script tool (Python)](https://pro.arcgis.com/en/pro-app/latest/help/analysis/geoprocessing/basics/create-a-python-script-tool.htm)
- [Building an R Script Tool](https://esricanada-ce.github.io/r-arcgis-tutorials/4-Building-an-R-Script-Tool.pdf)


## Additional examples
- [R Sample Tools](https://github.com/R-ArcGIS/r-sample-tools)


## Points of contact

R_bridge <R_bridge@esri.com>, Martha Bass <mbass@esri.com>
