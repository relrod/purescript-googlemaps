module GMaps.Marker.MarkerEvent
  ( MarkerEvent(..)
  ) where

import Data.Newtype (class Newtype, unwrap)
import GMaps.MVC.MouseEvent (MVCMouseEvent, mouseEventName)
import GMaps.MVC.MVCEvent (class MVCEvent)
import Prelude ((<<<))

newtype MarkerEvent = MarkerEvent MVCMouseEvent

derive instance newtypeMarkerEvent :: Newtype MarkerEvent _

instance mvcMarkerEvent :: MVCEvent MarkerEvent
  where eventName = mouseEventName <<< unwrap

