module GMaps.LatLng where

import Control.Monad.Eff
import Data.Function.Uncurried (Fn2, runFn2)

data LatLng

foreign import newLatLngImpl :: forall eff. Fn2 Number Number (Eff eff LatLng)

newLatLng :: forall eff. Number -> Number -> Eff eff LatLng
newLatLng = runFn2 newLatLngImpl
