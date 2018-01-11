# Working With Geospatial Data in R
## Charlotte Wickham

# Basic Mapping with ggplot2 and ggmap
- Data that is associated with location is considered **Spatial**.
- This is usually described using coordinates and a description of which Coordinate system.
- The most common coordinate system is Latitude and Longitude.
- **Point Data** is information about a single lat,long value row.
- You can interpret lat/long as x/y but it wont be much of a map without spatial cues.
- We'll use the *ggmap package* to add these cues to the plot.
- It uses web services to add a layer to ggplot of the data.
- Get the map of NYC:
```r
nyc <- c(lon = -74.0059, lat = 40.7128)
nyc_map <- get_map( location = nyc, zoom = 10)
ggmap( nyc_map )
```
- `get_map()` is querying the Google Maps API.
- You'll want to refer to the help page to iterate over all possibilities.
- Since you need to move the data to the `geom_point()` call to use `ggmap()`, then you can have issues specifying arguments.
- To get around this, you can pass the data and values via the parameter `base_layer = ` in `ggmap()`.
- Only do pass the data along with the lat,long combination; keep everything else in other layers.
- The parameter `extend` controls how much of the plotting area should the map take up.
- The parameter `maprange` controls whether the plot limits come from the map limits.
- There also a `qplot()` verions for *ggmap* called `qmplot()`.
- When passing a variable to parameter `facets` make sure to pass in formula notation; ie `~ months`.
- There are a few different types of spatial data:
  1. Point: assumed independent.
  2. Line: assumed related via single connections.
  3. Polygon: assumed relation via area.
  4. Raster: Where data is associated with a specific grid.
- You can draw filled in polygons using `geom_polygon( aes( fill = ward, group = group))`.
- You can generate a heatmap using `geom_tile()`.

# Point and Polygon Data
- Data frames are not ideal for spatial data.
- This is due to the inability to retain coordinate reference system information.
- This forces hierarchical structure into a forced flat format.
- The *sp package* contains classes that are used to store different types of spatial data.
- They also contain better methods for manipulating spatial objects.
- This is the standard for storing spatial data in R.
- You can limit the depth of a `str()` call using the parameter `max.level = <n>`.
- The **Spatial Polygon Object** is the same as a **Spatial Polygon Data Frame Object** just the latter has an attached data frame.
- **S4** is:
  * One of the object oriented systems in R.
  * They contain classes; which are defined objects.
  * Also, methods; which are how to interact with an object.
  * They have places called **Slots** to place things.
- You can access the slots using methods:
  * ex. `proj4string( countires_sp)`.
- You can also follow them with an `@` to access the named slot.
- Further, you can use the function `slot( <obj>, <label>)` to access a specific field.
- These are lists and you will need to use `[[ ]]` to extract single elements.
- Polygon Object -> Polygons Object -> SpatialPolygon Object.
- You can pass `sp_object[1,]` to select only the first polygon object's data and it will limit the return data to that smaller subset from other slots.
- The package *tmap* expects spatial data format.
- The function `qtm()` stands for **Quick Thematic Map**.
- Ex: `qtm( shp = <target_sp>, fill = 'attr')`.
- It has a similar philosophy and sytnax to ggplot2.
- The function `tm_shape()` does what the `ggplot()` call does and simply prepares the data.
- You can add the borders using `tm_borders()`.
- You can add the fill layer using `tm_fill( col = "attr")`.
- There are tons more options.
- It is worth highlighting that there are no scale functions in *tmap*.
- You can add grid lines using `tm_grid()`.
- You can select the kind of projection using by passing the parameter `projection = `.
- You can choose also projections `hd` for Hobo-Dyer projection and `robin` for Robinson projection.
- You can save the plot using `save_tmap()`.
- The passed file extension controls the format of the output.
- You can also use the package *leaflet* and save it as an html object for a interactive version.
- Make sure to pass the `filename=` parameter.

# Raster Data and Color
- Data frames are not optimal for raster data either.
- A better structure would be matrix + grid information + Coordinate System.
- The package *sp* has some classes for raster, but we'll be using the *raster* package.
- Benefits:
  * Easier to import.
  * Large ones are not loaded into memory.
  * provides functions for raster type operations.
- The *raster* package will also include `print()` functions for *sp* objects.
- Calling `plot()` will produce a heatmap-like plot.
- You can extract the values from a raster Object using `values()`.
- There are multi-dimensional Rasters: `RasterStack` and `RasterBrick`.
- Subsetting is done via list notation.
- `tmap` also works with raster objects.
- When dealing with a `RasterStack` or `Rasterbrick` object you will need to specify the layer in the `tm_raster(col = '<target>')`.
- We perceive color as three dimensional:
  * Hue.
  * Chroma.
  * Luminance.
- To create order, one will need to vary chroma or luminance.
- Different Types of Scale:
  * Sequential - Ordered.
  * Diverging - Ordered; two directions.
  * Qualitative - unordered.
- We'll be using package *RColorBrewer* to manage colors.
- You can see all defined colors using `display.brewer.all()`.
- You can generate a palette using `brewer.pal(n = <n>, "Blues")`.
- You can add the color palette using `scale_fill_gradientn( colors = <palette>)` or `scale_color_gradientn(colors = <palette>)`.
- To pass the palette in `tm_raster()` you'll use the parameter `palette`.
- You can add a legend to the plot using `tm_legend( position = c("[left|right]", "[top|bottom]"))`.
- You can used `classInt::classIntervals(values, n = 5, style = "equal")` to split up a range into discrete bits.

# Data Import and Projections
- Census tracts are areas with roughly the smae number of people.
- Procudure:
  1. Read in shape files.
  2. Match up two different coordinate systems.
  3. Merge data from a data frame into a SpatialPolygonDataFrame.
  4. Polish a map to be publication ready.
- **Vector Data** is data described by points, lines, polygons.
- The function `rgdal::readOGR()` will read in vector formats.
- To use it, you use `readOGR('<dir_name>', '<filename_no_ext>')`.
- You can read in raster data using function `rgdal::readGDAL()`.
- Or, you can use `raster::raster()`.
- You can use `tigris::tracts()` to download US Census geographies.
- There are subset functions:
  * `states()`.
  * `counties()`.
  * `places()`.
- Ex: `tracts( state = 'NY', county = 'New York'. cb = TRUE)`.
- There is more than just one definition of Longitude and Latitude.
- You can assign a coordinate system by assigning a string via `proj4string(<x>) <- "..."`.
- You must convert the different CRS's using `rgdal::spTransform( <object>, <string_CRS>)`.
- You can get the coordinates using `coordinates( <object> )`.
- The package *ACS* downloads data from the American Community Survey.
- The SP objects maintain an internal unique ID that allows it to tie data to polygons.
- To ask the function to do this, you'll need to pass parameter `match.ID = TRUE` to `SpatialPolygonsDataFrame()`.
- This matching is important because no other checks exist to ensure consistency.
- The function `sp::merge()` was designed for just this issue.
- Polishing a Map:
  * Remove Distractions, let data shine.
  * Useful spatial context.
  * Make sure you add ancillary data.
  * Add annotations.

# Research:
- Stamen Maps?
- tmap?
- equirectangular projection?
- Hobo-Dyer?
- classInt package?
- tract boundaries?
-


# Reference:
