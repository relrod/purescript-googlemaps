module GMaps.InfoWindow
  ( InfoWindow
  , InfoWindowOptions
  , newInfoWindow
  , openInfoWindow
  , defInfoWindowOptions
  , defInfoWindowOptions_
  , closeInfoWindow
  , deleteInfoWindow
  , getContent
  , getPosition
  , getZIndex
  , setContent
  , setOptions
  , setPosition
  , setZIndex
  ) where

import Prelude (Unit, (<<<))
import Data.Function.Uncurried (Fn1, Fn2, Fn3, runFn1, runFn2, runFn3)
import Data.Maybe (Maybe(Nothing))
import Effect (Effect)
import GMaps.Internal (maybeNothing, orUndefined)
import GMaps.LatLng (LatLng, LatLngLiteral)
import GMaps.LatLng (toLiteral) as LatLng
import GMaps.Map (Map)
import GMaps.Marker (Marker)

type InfoWindowOptionsR =
  { position :: LatLngLiteral
  , content :: String
  , disableAutoPan :: Boolean
  , maxWidth :: Number
  , pixelOffset :: Int
  , zIndex :: Number
  }

type InfoWindowOptions =
  { position :: LatLngLiteral
  , content :: Maybe String
  , disableAutoPan ::Boolean
  , maxWidth :: Maybe Number
  , pixelOffset :: Int
  , zIndex :: Maybe Number
  }

defInfoWindowOptions_ :: LatLng -> InfoWindowOptions
defInfoWindowOptions_ = defInfoWindowOptions <<< LatLng.toLiteral

defInfoWindowOptions :: LatLngLiteral -> InfoWindowOptions
defInfoWindowOptions latLng =
  { position: latLng
  , content: Nothing
  , disableAutoPan: false
  , maxWidth: Nothing
  , pixelOffset: 0
  , zIndex: Nothing
  }

runInfoWindowOptions :: InfoWindowOptions -> InfoWindowOptionsR
runInfoWindowOptions options = options
  { content = orUndefined options.content
  , maxWidth = orUndefined options.maxWidth
  , zIndex = orUndefined options.zIndex
  }

foreign import data InfoWindow :: Type

foreign import newInfoWindowImpl :: Fn1 InfoWindowOptionsR (Effect InfoWindow)

newInfoWindow :: InfoWindowOptions -> Effect InfoWindow
newInfoWindow= runFn1 newInfoWindowImpl <<< runInfoWindowOptions

foreign import openInfoWindowImpl :: Fn3 InfoWindow Map Marker (Effect InfoWindow)

openInfoWindow :: InfoWindow -> Map -> Marker -> Effect InfoWindow
openInfoWindow = runFn3 openInfoWindowImpl

foreign import closeInfoWindowImpl :: Fn1 InfoWindow (Effect InfoWindow)

closeInfoWindow :: InfoWindow -> Effect InfoWindow
closeInfoWindow = runFn1 closeInfoWindowImpl

foreign import deleteInfoWindowImpl :: Fn1 InfoWindow (Effect Unit)

deleteInfoWindow :: InfoWindow -> Effect Unit
deleteInfoWindow = runFn1 deleteInfoWindowImpl

foreign import getContentImpl :: Fn1 InfoWindow String

getContent :: InfoWindow -> Maybe String
getContent = maybeNothing <<< runFn1 getContentImpl

foreign import getPositionImpl :: Fn1 InfoWindow LatLng

getPosition :: InfoWindow -> LatLng
getPosition = runFn1 getPositionImpl

foreign import getZIndexImpl :: Fn1 InfoWindow Number

getZIndex :: InfoWindow -> Maybe Number
getZIndex = maybeNothing <<< runFn1 getZIndexImpl

foreign import setContentImpl :: Fn2 InfoWindow String (Effect InfoWindow)

setContent :: InfoWindow -> Maybe String -> Effect InfoWindow
setContent infoWindow = runFn2 setContentImpl infoWindow <<< orUndefined

foreign import setOptionsImpl :: Fn2 InfoWindow InfoWindowOptionsR (Effect InfoWindow)

setOptions :: InfoWindow -> InfoWindowOptions -> Effect InfoWindow
setOptions infoWindow options = runFn2 setOptionsImpl infoWindow (runInfoWindowOptions options)

foreign import setPositionImpl :: Fn2 InfoWindow LatLng (Effect InfoWindow)

setPosition :: InfoWindow -> LatLng -> Effect InfoWindow
setPosition = runFn2 setPositionImpl

foreign import setZIndexImpl :: Fn2 InfoWindow Number (Effect InfoWindow)

setZIndex :: InfoWindow -> Maybe Number -> Effect InfoWindow
setZIndex infoWindow = runFn2 setZIndexImpl infoWindow <<< orUndefined
