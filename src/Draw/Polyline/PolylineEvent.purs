module GMaps.Draw.Polyline.PolylineEvent
  ( PolylineEvent(..)
  ) where

import Data.Newtype (class Newtype, unwrap)
import GMaps.MVC.MouseEvent (MVCMouseEvent, mouseEventName)
import GMaps.MVC.MVCEvent (class MVCEvent)
import Prelude ((<<<))

newtype PolylineEvent = PolylineEvent MVCMouseEvent

derive instance newTypePolylineEvent :: Newtype PolylineEvent _

instance mvcPolylineEvent :: MVCEvent PolylineEvent
  where eventName = mouseEventName <<< unwrap
