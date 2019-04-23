module GMaps.InfoWindow.InfoWindowEvent
  ( InfoWindowEvent(..)
  ) where

import GMaps.MVC.MVCEvent (class MVCEvent)

data InfoWindowEvent
  = CloseClick
  | DomReady

instance mvcInfoWindowEvent :: MVCEvent InfoWindowEvent
  where eventName = case _ of
          CloseClick -> "closeclick"
          DomReady -> "domeready"
