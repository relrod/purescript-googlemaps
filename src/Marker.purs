module GMaps.Marker where

import Control.Monad.Eff
import GMaps.LatLng
import GMaps.Map

data MarkerOptions = MarkerOptions
  { position :: LatLng
  , map :: Map
  , title :: String
  }

foreign import data Marker :: *

type MarkerOptionsR = { position :: LatLng
                      , map :: Map
                      , title :: String
                      }

runMarkerOptions :: MarkerOptions -> MarkerOptionsR
runMarkerOptions (MarkerOptions o) = { position: o.position
                                     , map: o.map
                                     , title: o.title
                                     }

foreign import newMarkerFFI
  "function newMarkerFFI(opts) {\
  \  return function() {\
  \    return new google.maps.Marker(opts);\
  \  };\
  \}" :: forall eff. MarkerOptionsR -> Eff eff Marker

newMarker :: forall eff. MarkerOptions -> Eff eff Marker
newMarker opts = newMarkerFFI (runMarkerOptions opts)

foreign import setMarkerPosition
  "function setMarkerPosition(marker) {\
  \  return function(latlng) {\
  \    return function() {\
  \      return marker.setPosition(latlng);\
  \    };\
  \  };\
  \}" :: forall eff. Marker -> LatLng -> Eff eff Unit
