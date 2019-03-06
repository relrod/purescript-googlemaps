module Test.Defaults where

import Prelude (bind, flip, negate, (<$>), (=<<))

import Data.Traversable (traverse)
import Data.Maybe (Maybe)
import Effect (Effect)
import GMaps.Map (Map, defMapOptions_, gMap)
import GMaps.InfoWindow (InfoWindow, InfoWindowOptions, defInfoWindowOptions_, newInfoWindow)
import GMaps.LatLng (LatLng, newLatLng)
import GMaps.Marker (Marker, MarkerOptions, defMarkerOptions_, newMarker)
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

