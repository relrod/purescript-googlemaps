module GMaps.Marker.MarkerEvent
  ( MarkerEvent(..)
  ) where

import GMaps.MVCEvent (class MVCEvent)

data MarkerEvent
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

instance mvcMarkerEvent :: MVCEvent MarkerEvent
  where eventName = case _ of
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

