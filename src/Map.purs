module GMaps.Map (Map (), gMap, panTo) where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import DOM.Node.Types (Element)
import GMaps.LatLng (LatLng)
import GMaps.MapOptions (MapOptions, runMapOptions)
import Data.Function.Uncurried (Fn2, runFn2)

foreign import data Map :: Type

foreign import gMapImpl :: forall eff. Fn2 Element { zoom :: Number, center :: LatLng, mapTypeId :: String } (Eff eff Map)

gMapFFI :: forall eff. Element -> { zoom :: Number, center :: LatLng, mapTypeId :: String } -> Eff eff Map
gMapFFI = runFn2 gMapImpl

gMap :: forall eff. Element -> MapOptions -> Eff eff Map
gMap e m = gMapFFI e (runMapOptions m)

foreign import panToImpl :: forall eff. Fn2 Map LatLng (Eff eff Unit)

panTo :: forall eff. Map -> LatLng -> Eff eff Unit
panTo = runFn2 panToImpl
