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
- You can use the function `ggmap::geocode()` function to find the latitude and logitude of an address.
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

# Plotting Polygons

# Reference:
- **Integrated Postsecondary Education Data System**.

# Research:
- **Administered by National Center for Education Statistics**
-
