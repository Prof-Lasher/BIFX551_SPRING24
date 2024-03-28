# Spatial Data  
Sometimes it is a necessity to analyze your data on a map. To do this we need to create polygons to define the different boundaries of the regions of interest. These can be defined by a list of points and a group, used to denote each of the polygons. Or in the case of SF, the plygon itself can be used as a datatype ( again also a list of points but it is encapsulated ). 

# Geographical Maps
A common library to retrieve maps from is the `maps` library. However, it is also possible to import shape files (.shp) or other libraries as well. Maps can be used to define things such as countries, congressional districts or some other distinct regions. When creating a map it is important to remember these plots are just layers and so while one layer may have the polygons defining a shape other layers may be used to define points or text. 

```{r}
#Get a map of the US and color by state  
library(maps)  
usa_map <- map_data("state") #get a map of the US states  
ggplot( aes(x=long, y=lat ), data = usa_map ) +  
   geom_polygon( aes(group = group, fill=region), show.legend = FALSE, color="grey50") +  
  coord_quickmap()  
```

When using maps it is important to be sure to set the coordinates scale properly based on the data type passed in. For *st* formatting of data use `coord_quickmap()` or `coord_map() ` as the scale. For *sf* use `coord_sf()`.

There are many map packages out there but one of interest is [Leaflet](https://rstudio.github.io/leaflet/). This is a javascript based interactive map package. Take time and review it, to see some of the things that are possible. 

# Assignment 
Find a dataset of the zip code locations. There are a few on kaggle, as well as other data sources. Use the lat and long data to plot their locations on a map of the USA. ( You may want to limit your plot to the continental US using xlim and ylim. )

1. What can you infer from this plot? 
2. Does the concentration of zip codes in a given area tell you anything about that area?
3. What would be the next steps to test your hypothesis? 
