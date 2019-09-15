module GMaps.MVC.MouseEvent
  ( MouseEvent
  , MVCMouseEvent(..)
  , mouseEventName
  , stop
  , getLatLng
  ) where

import Data.Function.Uncurried (Fn1, runFn1)
import Effect (Effect)
import GMaps.LatLng (LatLng)
import Prelude (Unit)

-- Data returned by a triggered event
foreign import data MouseEvent :: Type

foreign import stopImpl :: Fn1 MouseEvent (Effect Unit)

stop :: MouseEvent -> Effect Unit
stop = runFn1 stopImpl

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
