module GMaps.Polyline
  ( Polyline ()
  , PolylineOptions (..)
  , newPolyline
  , setPolylinePath) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
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

foreign import newPolylineImpl :: forall eff. Fn1 PolylineOptionsR (Eff eff Polyline)

newPolylineFFI :: forall eff. PolylineOptionsR -> Eff eff Polyline
newPolylineFFI = runFn1 newPolylineImpl

newPolyline :: forall eff. PolylineOptions -> Eff eff Polyline
newPolyline o = newPolylineFFI (runPolylineOptions o)

foreign import setPolylinePathImpl :: forall eff. Fn2 Polyline (MVCArray LatLng) (Eff eff Unit)

setPolylinePath :: forall eff. Polyline -> MVCArray LatLng -> Eff eff Unit
setPolylinePath = runFn2 setPolylinePathImpl
