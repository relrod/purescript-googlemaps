module GMaps.Map (Map (), gMap, panTo) where

import Control.Monad.Eff
import Data.DOM.Simple.Types
import GMaps.LatLng
import GMaps.MapOptions

foreign import data Map :: *

foreign import gMapFFI
  "function gMapFFI(ele) {\
  \  return function(opts) {\
  \    return function() {\
  \      return (new google.maps.Map(ele, opts));\
  \    };\
  \  };\
  \}" :: forall eff. HTMLElement -> { zoom :: Number, center :: LatLng, mapTypeId :: String } -> Eff eff Map

gMap :: forall eff. HTMLElement -> MapOptions -> Eff eff Map
gMap e m = gMapFFI e (runMapOptions m)

foreign import panTo
  "function panTo(map) {\
  \  return function(x) {\
  \    return function() {\
  \      map.panTo(x);\
  \      return;\
  \    };\
  \  };\
  \}" :: forall eff. Map -> LatLng -> Eff eff Unit

