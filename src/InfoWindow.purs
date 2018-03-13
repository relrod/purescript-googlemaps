module GMaps.InfoWindow where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
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

foreign import newInfoWindowImpl :: forall eff. Fn1 InfoWindowOptionsR (Eff eff InfoWindow)

newInfoWindow :: forall eff. InfoWindowOptionsR -> Eff eff InfoWindow
newInfoWindow = runFn1 newInfoWindowImpl

foreign import openInfoWindowImpl :: forall eff. Fn3 InfoWindow Map Marker (Eff eff Unit)

openInfoWindow :: forall eff. InfoWindow -> Map -> Marker -> (Eff eff Unit)
openInfoWindow = runFn3 openInfoWindowImpl
