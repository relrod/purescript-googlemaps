module GMaps.Map (Map (), gMap, panTo) where

import Prelude (Unit)
import Effect (Effect)
import Web.DOM (Element)
import GMaps.LatLng (LatLng)
import GMaps.MapOptions (MapOptions, runMapOptions)
import Data.Function.Uncurried (Fn2, runFn2)

foreign import data Map :: Type

foreign import gMapImpl :: Fn2 Element { zoom :: Number, center :: LatLng, mapTypeId :: String } (Effect Map)

gMapFFI :: Element -> { zoom :: Number, center :: LatLng, mapTypeId :: String } -> Effect Map
gMapFFI = runFn2 gMapImpl

gMap :: Element -> MapOptions -> Effect Map
gMap e m = gMapFFI e (runMapOptions m)

foreign import panToImpl :: Fn2 Map LatLng (Effect Unit)

panTo :: Map -> LatLng -> Effect Unit
panTo = runFn2 panToImpl
