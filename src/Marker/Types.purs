module GMaps.Marker.Types
  ( Animation(..)
  ) where

import Data.Maybe (Maybe(..))
import Data.Show (class Show, show)
import Data.String.Read (class Read)
import Prelude (class Eq, otherwise, (==))

data Animation
  = Bounce
  | Drop

derive instance eqAnimation :: Eq Animation

instance showAnimation :: Show Animation
  where show Bounce = "BOUNCE"
        show Drop = "DROP"

instance readAnimation :: Read Animation
  where read text
          | text == show Bounce = Just Bounce
          | text == show Drop = Just Drop
          | otherwise = Nothing
