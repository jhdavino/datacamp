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
- 


# Raster Data and Color

# Data Import and Projections

# Research:
- Stamen Maps?


# Reference:
