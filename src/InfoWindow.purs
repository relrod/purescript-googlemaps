module GMaps.InfoWindow where

import Prelude (Unit)
import Effect (Effect)
import GMaps.Map (Map)
import GMaps.Marker (Marker)
import Data.Function.Uncurried (Fn1, runFn1, Fn3, runFn3)

data InfoWindowOptions = InfoWindowOptions
  { content :: String
  }

foreign import data InfoWindow :: Type

type InfoWindowOptionsR = { content :: String }

runInfoWindowOptions :: InfoWindowOptions -> InfoWindowOptionsR
runInfoWindowOptions (InfoWindowOptions o) = { content: o.content }

foreign import newInfoWindowImpl :: Fn1 InfoWindowOptionsR (Effect InfoWindow)

newInfoWindow :: InfoWindowOptionsR -> Effect InfoWindow
newInfoWindow = runFn1 newInfoWindowImpl

foreign import openInfoWindowImpl :: Fn3 InfoWindow Map Marker (Effect Unit)

openInfoWindow :: InfoWindow -> Map -> Marker -> Effect Unit
openInfoWindow = runFn3 openInfoWindowImpl
