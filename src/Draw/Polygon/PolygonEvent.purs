module GMaps.Draw.Polygon.PolygonEvent
  ( PolygonEvent(..)
  ) where

import Data.Newtype (class Newtype, unwrap)
import GMaps.MVC.MouseEvent (MVCMouseEvent, mouseEventName)
import GMaps.MVC.MVCEvent (class MVCEvent)
import Prelude ((<<<))

newtype PolygonEvent = PolygonEvent MVCMouseEvent

derive instance newTypePolygonEvent :: Newtype PolygonEvent _

instance mvcPolygonEvent :: MVCEvent PolygonEvent
  where eventName = mouseEventName <<< unwrap
