module GMaps.MVCEvent
  ( class MVCEvent
  , eventName
  ) where

class MVCEvent e
  where eventName :: e -> String
