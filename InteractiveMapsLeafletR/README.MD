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
- 


# Groups, Layers, and Extras

# Plotting Polygons

# Reference:

# Research:
