module GMaps.Marker
  ( Marker
  , MarkerOptions
  , newMarker
  , deleteMarker
  , removeMarker
  , defMarkerOptions
  , defMarkerOptions_
  --, getAnimation
  , getClickable
  --, getCursor
  , getDraggable
  , getIcon
  , getLabel
  , getMap
  , getOpacity
  , getPosition
  --, getShape
  , getTitle
  , getVisible
  , getZIndex
  --, setAnimation
  , setClickable
  --, setCursor
  , setDraggable
  , setIcon
  , setLabel
  , setMap
  , setOpacity
  , setOptions
  , setPosition
  --, setShape
  , setTitle
  , setVisible
  , setZIndex
  ) where

import Prelude (Unit, (<<<))
import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import GMaps.LatLng (LatLng, LatLngLiteral)
import GMaps.LatLng (toLiteral) as LatLng
import GMaps.Internal (maybeNothing, orUndefined)
import GMaps.Map (Map)

type MarkerOptionsR =
  { position :: LatLngLiteral
  , map :: Map
  --, anchorPoint :: Point
  --, animation :: Animation
  , clickable :: Boolean
  , crossOnDrag :: Boolean
  --, cursor :: String
  , draggable :: Boolean
  , icon :: String
  , label :: Char
  , opacity :: Number
  , optimized :: Boolean
  --, shape :: MarkerShape
  , title :: String
  , visible :: Boolean
  , zIndex :: Number
  }

type MarkerOptions =
  { position :: LatLngLiteral
  , map :: Maybe Map
  --, anchorPoint :: Maybe Point
  --, animation :: Maybe Animation
  , clickable :: Boolean
  , crossOnDrag :: Boolean
  --, cursor :: Maybe Cursor
  , draggable :: Boolean
  , icon :: Maybe String
  , label :: Maybe Char
  , opacity :: Number
  , optimized :: Boolean
  --, shape :: Maybe MarkerShape
  , title :: Maybe String
  , visible :: Boolean
  , zIndex :: Maybe Number
  }

defMarkerOptions_ :: LatLng -> MarkerOptions
defMarkerOptions_ = defMarkerOptions <<< LatLng.toLiteral

defMarkerOptions :: LatLngLiteral -> MarkerOptions
defMarkerOptions position =
  { position
  , map: Nothing
  --, anchorPoint: Nothing
  --, animation: Nothing
  , clickable: true
  , crossOnDrag: true
  --, cursor: Nothing
  , draggable: false
  , icon: Nothing
  , label: Nothing
  , opacity: 1.0
  , optimized: true
  --, shape: Nothing
  , title: Nothing
  , visible: true
  , zIndex: Nothing
  }

runMakerOptions :: MarkerOptions -> MarkerOptionsR
runMakerOptions options = options
  { map = orUndefined options.map
  --, anchorPoint = orUndefined options.anchorPoint
  --, animation = orUndefined options.animation
  --, cursor = orUndefined options.cursor
  , icon = orUndefined options.icon
  , label = orUndefined options.label
  --, shape = orUndefined options.shape
  , title = orUndefined options.title
  , zIndex = orUndefined options.zIndex
  }

foreign import data Marker :: Type

foreign import newMarkerImpl :: Fn1 MarkerOptionsR (Effect Marker)

newMarker :: MarkerOptions -> Effect Marker
newMarker = runFn1 newMarkerImpl <<< runMakerOptions

foreign import removeMarkerImpl :: Fn1 Marker (Effect Marker)

removeMarker :: Marker -> Effect Marker
removeMarker = runFn1 removeMarkerImpl

foreign import deleteMarkerImpl :: Fn1 Marker (Effect Unit)

deleteMarker :: Marker -> Effect Unit
deleteMarker = runFn1 deleteMarkerImpl

--foreign import getAnimationImpl :: Fn1 Marker Animation
--
--getAnimation :: Marker ->  Animation
--getAnimation = runFn1 getAnimationImpl

foreign import getClickableImpl :: Fn1 Marker Boolean

getClickable :: Marker -> Boolean
getClickable = runFn1 getClickableImpl

--foreign import getCursorImpl :: Fn1 Marker Cursor
--
--getCursor :: Marker ->  Boolean
--getCursor = runFn1 getCursorImpl

foreign import getDraggableImpl :: Fn1 Marker Boolean

getDraggable :: Marker -> Boolean
getDraggable = runFn1 getDraggableImpl

foreign import getIconImpl :: Fn1 Marker String

getIcon :: Marker -> Maybe String
getIcon = maybeNothing <<< runFn1 getIconImpl

foreign import getLabelImpl :: Fn1 Marker Char

getLabel :: Marker -> Maybe Char
getLabel = maybeNothing <<< runFn1 getLabelImpl

foreign import getMapImpl :: Fn1 Marker Map

getMap :: Marker -> Maybe Map
getMap = maybeNothing <<< runFn1 getMapImpl

foreign import getOpacityImpl :: Fn1 Marker Number

getOpacity :: Marker -> Number
getOpacity = runFn1 getOpacityImpl

foreign import getPositionImpl :: Fn1 Marker LatLng

getPosition :: Marker -> LatLng
getPosition = runFn1 getPositionImpl

--foreign import getShapeImpl :: Fn1 Marker Shape
--
--getShape :: Marker -> Shape
--getShape = runFn1 getShapeImpl

foreign import getTitleImpl :: Fn1 Marker String

getTitle :: Marker -> String
getTitle = runFn1 getTitleImpl

foreign import getVisibleImpl :: Fn1 Marker Boolean

getVisible :: Marker -> Boolean
getVisible = runFn1 getVisibleImpl

foreign import getZIndexImpl :: Fn1 Marker Number

getZIndex :: Marker -> Number
getZIndex = runFn1 getZIndexImpl

--foreign import setAnimationImpl :: Fn2 Marker ?umm (Effect Marker)
--
--setAnimation :: Marker -> Animation -> Effect Marker
--setAnimation marker = runFn2 setAnimationImpl marker orNull

foreign import setClickableImpl :: Fn2 Marker Boolean (Effect Marker)

setClickable :: Marker -> Boolean -> Effect Marker
setClickable = runFn2 setClickableImpl

--foreign import setCursorImpl :: Fn2 Marker ?umm (Effect Marker)
--
--setCursor :: Marker -> Cursor -> Effect Marker
--setCursor marker cursor = runFn2 setCursorImpl marker (?umm cursor)

foreign import setDraggableImpl :: Fn2 Marker Boolean (Effect Marker)

setDraggable :: Marker -> Boolean -> Effect Marker
setDraggable = runFn2 setDraggableImpl

foreign import setIconImpl :: Fn2 Marker String (Effect Marker)

setIcon :: Marker -> Maybe String -> Effect Marker
setIcon marker = runFn2 setIconImpl marker <<< orUndefined -- orNull?

foreign import setLabelImpl :: Fn2 Marker Char (Effect Marker)

setLabel :: Marker -> Maybe Char -> Effect Marker
setLabel marker = runFn2 setLabelImpl marker <<< orUndefined -- orNull?

foreign import setMapImpl :: Fn2 Marker Map (Effect Marker)

-- See removeMarker to `setMap(null)`
setMap :: Marker -> Map -> Effect Marker
setMap marker = runFn2 setMapImpl marker

foreign import setOpacityImpl :: Fn2 Marker Number (Effect Marker)

setOpacity :: Marker -> Number -> Effect Marker
setOpacity = runFn2 setOpacityImpl

foreign import setOptionsImpl :: Fn2 Marker MarkerOptionsR (Effect Marker)

setOptions :: Marker -> MarkerOptions -> Effect Marker
setOptions marker = runFn2 setOptionsImpl marker <<< runMakerOptions

foreign import setPositionImpl :: Fn2 Marker LatLng (Effect Marker)

setPosition :: Marker -> LatLng -> Effect Marker
setPosition = runFn2 setPositionImpl

--foreign import setShapeImpl :: Fn2 Marker MarkerShape (Effect Marker)
--
--setShape :: Marker -> Maybe MarkerShape -> Effect Marker
--setShape marker = runFn2 setShapeImpl <<< orNull

foreign import setTitleImpl :: Fn2 Marker String (Effect Marker)

setTitle :: Marker -> String -> Effect Marker
setTitle = runFn2 setTitleImpl

foreign import setVisibleImpl :: Fn2 Marker Boolean (Effect Marker)

setVisible :: Marker -> Boolean -> Effect Marker
setVisible = runFn2 setVisibleImpl

foreign import setZIndexImpl :: Fn2 Marker Number (Effect Marker)

setZIndex :: Marker -> Number -> Effect Marker
setZIndex = runFn2 setZIndexImpl
