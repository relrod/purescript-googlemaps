module GMaps.Draw.Polyline
  ( Polyline
  , PolylineOptions
  , defPolylineOptions
  , defPolylineOptions_
  , newPolyline
  , deletePolyline
  , getMap
  , setMap
  , remove
  -- TODO: same as Polygon
  , getDraggable
  , getEditable
  , getPath
  , getPath_
  , getVisible
  , setDraggable
  , setEditable
  , setPath
  , setPath_
  , setVisible
  ) where

import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import GMaps.Draw.Polyline.PolylineEvent (PolylineEvent)
import GMaps.Internal (maybeNothing, orUndefined)
import GMaps.LatLng (LatLng, LatLngLiteral)
import GMaps.LatLng (toLiteral) as LatLng
import GMaps.MVC.MVCArray (MVCArray)
import GMaps.MVC.MVCArray (toArray) as MVCArray
import GMaps.MVC.MVCObject (class MVCObject, defAddListener)
import GMaps.Map (Map)
import Prelude (Unit, flip, map, (<<<))

type PolylineOptionsR =
  { clickable :: Boolean
  , draggable :: Boolean
  , editable :: Boolean
  , geodesic :: Boolean
  -- icons :: Array IconSequence
  , map :: Map
  , path :: Array LatLngLiteral
  , strokeColor :: String
  , strokeOpacity :: Number
  , strokeWeight :: Number
  , visible :: Boolean
  , zIndex :: Number
  }

type PolylineOptions =
  { clickable :: Boolean
  , draggable :: Boolean
  , editable :: Boolean
  , geodesic :: Boolean
  -- icons :: Array IconSequence
  , map :: Maybe Map
  , path :: Array LatLngLiteral
  , strokeColor :: Maybe String
  , strokeOpacity :: Maybe Number
  , strokeWeight :: Maybe Number
  , visible :: Boolean
  , zIndex :: Maybe Number
  }

defPolylineOptions_ :: Array LatLng -> PolylineOptions
defPolylineOptions_ = defPolylineOptions <<< map LatLng.toLiteral

defPolylineOptions :: Array LatLngLiteral -> PolylineOptions
defPolylineOptions path =
  { path
  , map: Nothing
  , clickable: true
  , draggable: false
  , editable: false
  , geodesic: false
  -- icons: []
  , strokeColor: Nothing
  , strokeOpacity: Nothing
  , strokeWeight: Nothing
  , visible: true
  , zIndex: Nothing
  }

runPolylineOptions :: PolylineOptions -> PolylineOptionsR
runPolylineOptions options = options
  { map = orUndefined options.map
  , strokeColor = orUndefined options.strokeColor
  , strokeOpacity = orUndefined options.strokeOpacity
  , strokeWeight = orUndefined options.strokeWeight
  , zIndex = orUndefined options.zIndex
  }

foreign import data Polyline :: Type

instance mvcPolylineObject :: MVCObject Polyline PolylineEvent
  where addListener = defAddListener

foreign import newPolylineImpl :: Fn1 PolylineOptionsR (Effect Polyline)

newPolyline :: PolylineOptions -> Effect Polyline
newPolyline = runFn1 newPolylineImpl <<< runPolylineOptions

foreign import deletePolylineImpl :: Fn1 Polyline (Effect Unit)

deletePolyline :: Polyline -> Effect Unit
deletePolyline = runFn1 deletePolylineImpl

foreign import getMapImpl :: Fn1 Polyline Map

getMap :: Polyline -> Maybe Map
getMap = maybeNothing <<< runFn1 getMapImpl

foreign import setMapImpl :: Fn2 Polyline Map (Effect Polyline)

setMap :: Polyline -> Maybe Map -> Effect Polyline
setMap display = runFn2 setMapImpl display <<< orUndefined

remove :: Polyline -> Effect Polyline
remove = flip setMap Nothing

foreign import setOptionsImpl :: Fn2 Polyline PolylineOptionsR (Effect Polyline)

setOptions :: Polyline -> PolylineOptions -> Effect Polyline
setOptions polyline = runFn2 setOptionsImpl polyline <<< runPolylineOptions

-- TODO: same as Polygon
foreign import getDraggableImpl :: Fn1 Polyline Boolean

getDraggable :: Polyline -> Boolean
getDraggable = runFn1 getDraggableImpl

foreign import getEditableImpl :: Fn1 Polyline Boolean

getEditable :: Polyline -> Boolean
getEditable = runFn1 getEditableImpl

foreign import getPathImpl :: Fn1 Polyline (MVCArray LatLng)

getPath_ :: Polyline -> MVCArray LatLng
getPath_ = runFn1 getPathImpl

getPath :: Polyline -> Array LatLng
getPath = MVCArray.toArray <<< getPath_

foreign import getVisibleImpl :: Fn1 Polyline Boolean

getVisible :: Polyline -> Boolean
getVisible = runFn1 getVisibleImpl

foreign import setDraggableImpl :: Fn2 Polyline Boolean (Effect Polyline)

setDraggable :: Polyline -> Boolean -> Effect Polyline
setDraggable = runFn2 setDraggableImpl

foreign import setEditableImpl :: Fn2 Polyline Boolean (Effect Polyline)

setEditable :: Polyline -> Boolean -> Effect Polyline
setEditable = runFn2 setEditableImpl

foreign import setPathImpl :: Fn2 Polyline (Array LatLngLiteral) (Effect Polyline)

setPath :: Polyline -> Array LatLngLiteral -> Effect Polyline
setPath = runFn2 setPathImpl

setPath_ :: Polyline -> Array LatLng -> Effect Polyline
setPath_ polyline = setPath polyline <<< map LatLng.toLiteral

foreign import setVisibleImpl :: Fn2 Polyline Boolean (Effect Polyline)

setVisible :: Polyline -> Boolean -> Effect Polyline
setVisible = runFn2 setVisibleImpl
