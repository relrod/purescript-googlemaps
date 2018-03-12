module GMaps.LatLng where

import Control.Monad.Eff
import Data.Function (Fn2, runFn2)

data LatLng

foreign import newLatLngImpl :: Fn2 Number Number (Eff eff LatLng)

newLatLng = runFn2 newLatLngImpl
