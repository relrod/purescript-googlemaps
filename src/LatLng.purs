module GMaps.LatLng where

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)

data LatLng

foreign import newLatLngImpl :: Fn2 Number Number (Effect LatLng)

newLatLng :: Number -> Number -> Effect LatLng
newLatLng = runFn2 newLatLngImpl
