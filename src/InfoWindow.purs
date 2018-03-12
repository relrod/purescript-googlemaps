module GMaps.InfoWindow where

import Control.Monad.Eff
import GMaps.Map
import GMaps.Marker
import Data.Function (Fn1, runFn1)

data InfoWindowOptions = InfoWindowOptions
  { content :: String
  }

foreign import data InfoWindow :: Type

type InfoWindowOptionsR = { content :: String }

runInfoWindowOptions :: InfoWindowOptions -> InfoWindowOptionsR
runInfoWindowOptions (InfoWindowOptions o) = { content: o.content }

foreign import newInfowindowImpl :: forall eff. Fn1 InfoWindowOptionsR (Eff eff InfoWindow)
newInfoWindow = runFn1 newInfowindowImpl

foreign import openInfoWindowImpl :: forall eff. Fn3 InfoWindow Map Marker (Eff eff Unit)

openInfoWindow :: forall eff. InfoWindow -> Map -> Marker (Eff eff Unit)
openInfoWindow = runFn3 openInfoWindowImpl
