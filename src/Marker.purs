module GMaps.Marker where

import Prelude (Unit)
import Effect (Effect)
import Data.Maybe (Maybe, fromMaybe)
import GMaps.LatLng (LatLng)
import GMaps.Map (Map)
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)

data MarkerOptions = MarkerOptions
  { position :: LatLng
  , map :: Map
  , title :: String
  , icon :: Maybe String
  }

foreign import data Marker :: Type

-- GMaps either wants a marker icon or undefined.
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

foreign import newMarkerImpl :: Fn1 MarkerOptionsR (Effect Marker)

newMarkerFFI :: MarkerOptionsR -> Effect Marker
newMarkerFFI = runFn1 newMarkerImpl

newMarker :: MarkerOptions -> Effect Marker
newMarker opts = newMarkerFFI (runMarkerOptions opts)

foreign import setMarkerPositionImpl :: Fn2 Marker LatLng (Effect Unit)

setMarkerPosition :: Marker -> LatLng -> Effect Unit
setMarkerPosition = runFn2 setMarkerPositionImpl
