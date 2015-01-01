module GMaps.MapOptions where

import GMaps.LatLng

data MapOptions = MapOptions
  { zoom :: Number
  , center :: LatLng
  , mapTypeId :: String
  }

runMapOptions :: MapOptions -> { zoom :: Number, center :: LatLng, mapTypeId :: String }
runMapOptions (MapOptions o) = { zoom: o.zoom, center: o.center, mapTypeId: o.mapTypeId }
