module GMaps.Map (Map (), gMap, panTo) where

import Control.Monad.Eff
import Data.HTML.Types
import GMaps.LatLng
import GMaps.MapOptions
import Data.Function (Fn2, runFn2)

foreign import data Map :: Type

foreign import gMapImpl :: Fn2 HTMLElement { zoom :: Number, center :: LatLng, mapTypeId :: String } (Eff eff Map)

gMapFFI :: forall eff. HTMLElement -> { zoom :: Number, center :: LatLng, mapTypeId :: String } -> Eff eff Map
gMapFFI = runFn2 gMapImpl

gMap :: forall eff. HTMLElement -> MapOptions -> Eff eff Map
gMap e m = gMapFFI e (runMapOptions m)

foreign import panToImpl :: Fn2 Map LatLng (Eff eff Unit)

panTo :: forall eff. Map -> LatLng -> Eff eff Unit
panTo = runFn2 panToImpl
