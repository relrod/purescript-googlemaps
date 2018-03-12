module GMaps.Marker where

import Control.Monad.Eff
import Data.Maybe
import GMaps.LatLng
import GMaps.Map
import Data.Function (Fn1, runFn1, Fn2, runFn2)

data MarkerOptions = MarkerOptions
  { position :: LatLng
  , map :: Map
  , title :: String
  , icon :: Maybe String
  }

foreign import data Marker :: Type

foreign import undefined :: forall a. a

type MarkerOptionsR = { position :: LatLng
                      , map :: Map
                      , title :: String
                      , icon :: String
                      }

runMarkerOptions :: MarkerOptions -> MarkerOptionsR
runMarkerOptions (MarkerOptions o) = { position: o.position
                                     , map: o.map
                                     , title: o.title
                                     , icon: fromMaybe undefined o.icon
                                     }

foreign import newMarkerImpl :: forall eff. Fn1 MarkerOptionsR (Eff eff Marker)

newMarkerFFI :: forall eff. MarkerOptionsR -> Eff eff Marker
newMarkerFFI = runFn1 newMarkerImpl

newMarker :: forall eff. MarkerOptions -> Eff eff Marker
newMarker opts = newMarkerFFI (runMarkerOptions opts)

foreign import setMarkerPositionImpl :: forall eff. Fn2 Marker LatLng (Eff eff Unit)

setMarkerPosition :: forall eff. Marker -> LatLng -> Eff eff Unit
setMarkerPosition = runFn2 setMarkerPositionImpl