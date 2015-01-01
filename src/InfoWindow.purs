module GMaps.InfoWindow where

import Control.Monad.Eff
import GMaps.Map
import GMaps.Marker

data InfoWindowOptions = InfoWindowOptions
  { content :: String
  }

foreign import data InfoWindow :: *

type InfoWindowOptionsR = { content :: String }

runInfoWindowOptions :: InfoWindowOptions -> InfoWindowOptionsR
runInfoWindowOptions (InfoWindowOptions o) = { content: o.content }

foreign import newInfoWindowFFI
  "function newInfoWindowFFI(opts) {\
  \  return function() {\
  \    return new google.maps.InfoWindow(opts);\
  \  };\
  \}" :: forall eff. InfoWindowOptionsR -> Eff eff InfoWindow

newInfoWindow :: forall eff. InfoWindowOptions -> Eff eff InfoWindow
newInfoWindow opts = newInfoWindowFFI (runInfoWindowOptions opts)

foreign import openInfoWindow
  "function openInfoWindow(iw) {\
  \  return function(map) {\
  \    return function(marker) {\
  \      return function() {\
  \        iw.open(map, marker);\
  \        return;\
  \      };\
  \    };\
  \  };\
  \}" :: forall eff. InfoWindow -> Map -> Marker -> Eff eff Unit
