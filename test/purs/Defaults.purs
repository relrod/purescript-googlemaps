module Test.Defaults where

import Prelude (bind, flip, negate, (<$>), (=<<))

import Data.Traversable (traverse)
import Data.Maybe (Maybe)
import Effect (Effect)
import GMaps.Draw.Polygon (Polygon, PolygonOptions, defPolygonOptions, newPolygon)
import GMaps.Draw.Polyline (Polyline, PolylineOptions, defPolylineOptions, newPolyline)
import GMaps.InfoWindow (InfoWindow, InfoWindowOptions, defInfoWindowOptions_, newInfoWindow)
import GMaps.Marker (Marker, MarkerOptions, defMarkerOptions_, newMarker)
import GMaps.Map (Map, defMapOptions_, gMap)
import GMaps.LatLng (LatLng, LatLngLiteral, newLatLng)
import Web.HTML (window) as HTML
import Web.HTML.HTMLDocument (toNonElementParentNode) as HTML
import Web.DOM.NonElementParentNode (getElementById) as HTML
import Web.HTML.Window (document) as HTML

-- TODO: Quickcheck Arbitrary or Gen latLng?

lat :: Number
lat = 38.8976763

lng :: Number
lng = (-77.0365298)

latLng :: Effect LatLng
latLng = newLatLng lat lng

latLngLiteral :: LatLngLiteral
latLngLiteral = { lat, lng }

infoWindowOptions :: Effect InfoWindowOptions
infoWindowOptions = defInfoWindowOptions_ <$> latLng

infoWindow :: Effect InfoWindow
infoWindow = newInfoWindow =<< infoWindowOptions

markerOptions :: Effect MarkerOptions
markerOptions = defMarkerOptions_ <$> latLng

marker :: Effect Marker
marker = newMarker =<< markerOptions

googleMap :: Effect (Maybe Map)
googleMap = do
  window <- HTML.window
  document <- HTML.document window
  let node = HTML.toNonElementParentNode document
  element <- HTML.getElementById "gmap" node
  options <- defMapOptions_ <$> latLng
  traverse (flip gMap options) element

path :: Array LatLngLiteral
path =
  [ { lat: 25.774, lng: -80.190 }
  , { lat: 18.466, lng: -66.118 }
  , { lat: 32.321, lng: -64.757 }
  , { lat: 25.774, lng: -80.190 }
  ]

altPath :: Array LatLngLiteral
altPath =
  [ { lat: 0.0, lng: 0.0 }
  , { lat: 10.0, lng: 0.0 }
  , { lat: 0.0, lng: 10.0 }
  , { lat: 0.0, lng: 0.0 }
  ]

polygonOptions :: PolygonOptions
polygonOptions = defPolygonOptions [ path ]

polygon :: Effect Polygon
polygon = newPolygon polygonOptions

polylineOptions :: PolylineOptions
polylineOptions = defPolylineOptions path

polyline :: Effect Polyline
polyline = newPolyline polylineOptions
