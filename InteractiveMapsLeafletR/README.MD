# Interactive Maps with leaflet in R
## Rich Majerus

# Setting Up Interactive Web Maps
- Popular Open Source JS Library.
- Can be created via `htmlwidgets`.
- **Leaflet** Builds maps using tiles.
```r
library( leaflet )
leaflet() %>% addTiles()
```
- You can also add the provider using `addProvider('CartoDB')`.
- You can add markers using `addMarkers( lng = <vector>, lat = <vector>, popup = <vector>)`.
- Questions to ask about making the Base Map:
  1. Why are you making the map?
  2. What kind of data will be plotted?
- There are over a 100 providers for tiles.
- There are a few which will require you to subscribe to access them.
- You can see the providers using `names(providers)`.
- You can also use `addProviderTiles()` instead to use those providers.
- You can use the function `ggmap::geocode()` function to find the latitude and longitude of an address.
```r
library( ggmap )
geocode('350 5th Ave, New York, NY 10118' )
```
- There are two default ways to set the Default view of the map:
  * `setView()`.
  * `fitBounds()`
- The former focuses on a point along with the zoom level.
- The latter lets you set up the view rectangle.
```r
# ..
setView( lng = <x>
         lat = <y>,
         zoom = <z>)

fitBounds( lng1 = <x1>, lng2 = <x2>,
           lat1 = <y1>, lat2 = <y2>)
```
- You can turn off the panning ability as well as limit the zoom levels.
```r
leaflet(
  options = (dragging = FALSE, # prevent panning ability
           minZoom = <z1>,
           maxZoom = <z2>)
)
```
- You can also include a soft-limit on panning using `setMaxBounds()`.
```r
setMaxBounds( lng1 = <x1>, lng2 = <x2>,
              lat1 = <y1>, lat2 = <y2>)
```
- You can plot points using the function `addMarkers()`.
- You can specify popups for the markers by passing arguments to the `popup` argument of `addMarkers()`.
- You can also ignore the markers by passing `addPopups()` instead.


# Plotting Points
- If we want to keep the map without clearing it, we can use the function `clearBounds()`.
- If we actually do want to remove the markers, then we can use the function `clearMarkers()`.
- The function `drop_na()` will remove all the observations that have a missing value.
- Sometimes, there will be overlap with Markers and you will want to use circles instead.
- You can add those using `addCircleMarkers()`.
- You can control the radius of those circles using the argument `radius = <n>`.
- You can also change the color using the argument `color = <color>`.
- You can also add the names using the argument `popup = ~<name>`.
- You can also use the formula notation - `~columnName` - to refer to a column in the data.
- The distinction between popups vs labels is that labels are *on hover* and popups are *on click*.
- You can add labels by passing the argument `label = ~name` in an add function.
- You can insert HTML into popups.
```r
map %>%
    addCircleMarkers(data = <tbl>, radius = <n>,
                     popup = ~paste0(name, "<br/>", sector_label))

```
- You can use the function `colorFactor()` to treat colors as factors to be passed to Leaflet.
```r
pal <- colorFactor( palette = c( 'red', 'blue', '9b4a11'),
                    levels = c('Public', 'Private', 'For-Profit'))
```
- You can also create a color palette using the function `colorNumeric()` to match a range.
```r
pal <- colorNumeric( palette = "Reds", domain = c(1:50), reverse = TRUE)
```
- You can add a legend to our map using the function `addLegend()`.
```r
# ...
addLegend( title = "Admit Rate", pal = pal, values = c(1:50), position = "bottomright")
```
- You can also set the attributes *opacity* and *position* via `addLegend()`.

# Groups, Layers, and Extras
- The package **leaflet.extras** extends what leaflet can do.
- There are three functions we'll be touching:
  * `addSearchOSM()` to add a search function.
  * `addReverseSearchOSM()` to geocode a mouse click.
  * `addResetMapButton()` to reset the map to the default view.
- The **OSM** stands for *Open Street Maps*.
- A Solution to overcrowding is gropus; which plot as separate layers.
- To do this, you'd pass `data = <tbl>, group = "Name-Of-Group"` to `addCircleMarkers()`.
- Then, you'd add the function `addLayersControl( overlayGroups = c("Names", "Off", "Groups"))`.
- You will need the package **htmltools**.
- There are also **Base Groups** of which there can only be one at a time.
- You can actaully group the tiles as well by passing `group = "Carto"` in the function `addProviderTiles()`.
```r
addLayersControl( baseGroups = c("OSM", "Carto", "Esri"), position = "topleft")
```
```r
m4 <- leaflet() %>%
        addTiles(group = "OSM") %>%
        addProviderTiles("CartoDB", group = "Carto") %>%
        addProviderTiles("Esri", group = "Esri") %>%
        addCircleMarkers(data = public, radius = 2, label = ~htmlEscape(name),
                         color = ~pal(sector_label),  group = "Public") %>%
        addCircleMarkers(data = private, radius = 2, label = ~htmlEscape(name),
                           color = ~pal(sector_label), group = "Private")  %>%
        addCircleMarkers(data = profit, radius = 2, label = ~htmlEscape(name),
                         color = ~pal(sector_label), group = "For-Profit")  %>%
        addLayersControl(baseGroups = c("OSM", "Carto", "Esri"),
                         overlayGroups = c("Public", "Private", "For-Profit")) %>%
        setView(lat = 39.8282, lng = -98.5795, zoom = 4)

m4
```
- You can customize the search by adding terms using `addSearchFeatures( targetGroups = "Publc")`.
- Another choice to manage lots of points is to cluster them.
- You do this by passing the argument `clusterOptions = markerClusterOptions()` to function `addCircleMarkers()`.


# Plotting Polygons
- To plot polygons, we will be using the Spatial Objects.
- You can access the data in the data slot using the `@` symbol.
- For example `shp@data`.
- To add polygons to leaflet, you'd use `addPolygons()` now instead.
- You can print the names of the slots in the sp object using the function `slotNames()`.
```r
# Left join nc_income onto shp@data and store in shp_nc_income
shp_nc_income <- shp@data %>%
                left_join(nc_income, by = c("GEOID10" = "zipcode"))
```
- There are four arguemnts that we'll focus on to refine our polygon plots:
  * Weight.
  * Color.
  * Label.
  * Height.
- There are three ways to color categorical data to numeric:
  * The function `colorNumeric( palette = "<color>", domain = <shape@data$numbers>)`.
  * The function `colorBin( palette = "<color>", bins = <n>, domain = <shape@data$numbers>)`.
  * The function `colorQuantile( palette = "<color>", n = <n>, domain = <shape@data$numbers>)`.
- After making the object for colors, you can sample the colors using `previewColors( pal = <pal-name>, values = c( seq( <start-vals>, <end-values>, by = <skip>)))`.
```r
# create color palette with colorNumeric()
nc_pal <- colorNumeric("YlGn", domain = high_inc@data$mean_income)

high_inc %>%
  leaflet() %>%
  addTiles() %>%
  # set boundary thickness to 1 and color polygons blue
  addPolygons(weight = 1, color = ~nc_pal(mean_income),
              # add labels that display mean income
              label = ~paste0("Mean Income: ", dollar(mean_income)),
              # highlight polygons on hover
              highlight = highlightOptions(weight = 5, color = "white",
              bringToFront = TRUE))
```
- Once you have created a map, you can save it.
- To save it, you use `htmlwidgets::saveWidget( <map>, "myMap.html")`.


# Reference:
- **Integrated Postsecondary Education Data System**.

# Research:
- **Administered by National Center for Education Statistics**
-
