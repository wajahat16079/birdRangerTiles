
library(tiler)
library(raster)
library(leaflet)
library(mapview)

tiler_options(osgeo4w = "C:/OSGeo4W/OSGeo4W.bat")

tiler_options()

crs2 = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"

colorList <- c('#1C6FF8', 
               '#27BBE0',
               '#31DB92',
               # '#1BF118',
               '#FFFB79',
               # '#FEF720',
               '#FF7F50',
               '#FF5B5B',
               '#FF0000'
)



outDir = "checkRastersTiles/www/rich_all_clean"
tempIn = "Aggregated/rich_all_clean.tif"
tile(tempIn, outDir, "0-10", crs2, col = colorList)


r = raster(tempIn)

vals = getValues(r)

hist(vals, breaks = 20, main = "rich_all_clean.tif")

summary(vals)

