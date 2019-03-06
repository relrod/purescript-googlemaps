module GMaps.Polyline
  ( Polyline
  , PolylineOptions
  , newPolyline
  , setPolylinePath
  ) where

import Prelude (Unit)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import GMaps.Map (Map)
import GMaps.MVCArray (MVCArray)
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)

foreign import data Polyline :: Type

type PolylineOptions = 
  { geodescic :: Boolean
  , strokeColor :: String
  , strokeOpacity :: Number
  , strokeWeight :: Number
  , map :: Map
  }

foreign import newPolylineImpl :: Fn1 PolylineOptions (Effect Polyline)

newPolyline :: PolylineOptions -> Effect Polyline
newPolyline = runFn1 newPolylineImpl

foreign import setPolylinePathImpl :: Fn2 Polyline (MVCArray LatLng) (Effect Unit)

setPolylinePath :: Polyline -> MVCArray LatLng -> Effect Unit
setPolylinePath = runFn2 setPolylinePathImpl
