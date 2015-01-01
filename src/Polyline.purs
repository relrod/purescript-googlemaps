module GMaps.Polyline
  ( Polyline ()
  , PolylineOptions (..)
  , newPolyline
  , setPolylinePath) where

import Control.Monad.Eff
import GMaps.LatLng
import GMaps.Map
import GMaps.MVCArray

foreign import data Polyline :: *

type PolylineOptionsR = { geodescic :: Boolean
                        , strokeColor :: String
                        , strokeOpacity :: Number
                        , strokeWeight :: Number
                        , map :: Map
                        }

data PolylineOptions = PolylineOptions
  { geodescic :: Boolean
  , strokeColor :: String
  , strokeOpacity :: Number
  , strokeWeight :: Number
  , map :: Map
  }

runPolylineOptions :: PolylineOptions -> PolylineOptionsR
runPolylineOptions (PolylineOptions o) = { geodescic: o.geodescic
                                         , strokeColor: o.strokeColor
                                         , strokeOpacity: o.strokeOpacity
                                         , strokeWeight: o.strokeWeight
                                         , map: o.map
                                         }

foreign import newPolylineFFI
  "function newPolylineFFI(opts) {\
  \  return function() {\
  \    return new google.maps.Polyline(opts);\
  \  };\
  \}" :: forall eff. PolylineOptionsR -> Eff eff Polyline

newPolyline :: forall eff. PolylineOptions -> Eff eff Polyline
newPolyline o = newPolylineFFI (runPolylineOptions o)

foreign import setPolylinePath
  "function setPolylinePath(pl) {\
  \  return function(arr) {\
  \    return function() {\
  \      pl.setPath(arr);\
  \    };\
  \  };\
  \}" :: forall eff. Polyline -> MVCArray LatLng -> Eff eff Unit
