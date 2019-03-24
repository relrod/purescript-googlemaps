module GMaps.MouseEvent
  ( MouseEvent
  , stopMouseEvent
  , getLatLng
  ) where

import Data.Function.Uncurried (Fn1, runFn1)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import Prelude (Unit)

foreign import data MouseEvent :: Type

foreign import stopMouseEventImpl :: Fn1 MouseEvent (Effect Unit)

stopMouseEvent :: MouseEvent -> Effect Unit
stopMouseEvent = runFn1 stopMouseEventImpl

foreign import getLatLngImpl :: Fn1 MouseEvent LatLng

getLatLng :: MouseEvent -> LatLng
getLatLng = runFn1 getLatLngImpl
