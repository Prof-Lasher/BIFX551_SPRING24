#### What is this all about?

This application uses **dbscan**  and zipcode data to try to  
predict and determine the location of major cities.

#### Calculations
The latitude and longitude values need to be converted in to km.  
This is because lat and long are given in degrees and this does  
not translate directly to km, which will be used for the distance  
calculations,

##### Distance
> d = sqrt( (x2 - x1)^2 + (y2 - y1)^2 )

##### Latitude Conversion [1]
> lat_km = 110.574 * lat

##### Longitude Conversion [1]
> lng_km = lng * 111.320 * cos( convert2Rads( lat ) ) 


#### References
1. Wikipedia Latitude. [Latitude](https://en.wikipedia.org/wiki/Latitude), Accessed April 9, 2024.
