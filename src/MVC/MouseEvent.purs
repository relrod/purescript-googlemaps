module GMaps.MVC.MouseEvent
  ( MouseEvent
  , MVCMouseEvent
  , mouseEventName
  , stopMouseEvent
  , getLatLng
  ) where

import Data.Function.Uncurried (Fn1, runFn1)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import Prelude (Unit)

-- Data returned by a triggered event
foreign import data MouseEvent :: Type

foreign import stopMouseEventImpl :: Fn1 MouseEvent (Effect Unit)

stopMouseEvent :: MouseEvent -> Effect Unit
stopMouseEvent = runFn1 stopMouseEventImpl

foreign import getLatLngImpl :: Fn1 MouseEvent LatLng

getLatLng :: MouseEvent -> LatLng
getLatLng = runFn1 getLatLngImpl

-- triggers
data MVCMouseEvent
  = Click
  | DblClick
  | Drag
  | DragEnd
  | DragStart
  | MouseDown
  | MouseOut
  | MouseOver
  | MouseUp
  | RightClick

mouseEventName :: MVCMouseEvent -> String
mouseEventName = case _ of
  Click -> "click"
  DblClick -> "dblclick"
  Drag -> "drag"
  DragEnd -> "dragend"
  DragStart -> "dragstart"
  MouseDown -> "mousedown"
  MouseOut -> "mouseout"
  MouseOver -> "mouseover"
  MouseUp -> "mouseup"
  RightClick -> "rightclick"
