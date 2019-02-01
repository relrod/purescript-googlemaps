module GMaps.Polyline
  ( Polyline ()
  , PolylineOptions (..)
  , newPolyline
  , setPolylinePath) where

import Prelude (Unit)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import GMaps.Map (Map)
import GMaps.MVCArray (MVCArray)
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)

foreign import data Polyline :: Type

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

foreign import newPolylineImpl :: Fn1 PolylineOptionsR (Effect Polyline)

newPolylineFFI :: PolylineOptionsR -> Effect Polyline
newPolylineFFI = runFn1 newPolylineImpl

newPolyline :: PolylineOptions -> Effect Polyline
newPolyline o = newPolylineFFI (runPolylineOptions o)

foreign import setPolylinePathImpl :: Fn2 Polyline (MVCArray LatLng) (Effect Unit)

setPolylinePath :: Polyline -> MVCArray LatLng -> Effect Unit
setPolylinePath = runFn2 setPolylinePathImpl
