module GMaps.MVC.MVCEvent
  ( class MVCEvent
  , eventName
  ) where

class MVCEvent e
  where eventName :: e -> String
