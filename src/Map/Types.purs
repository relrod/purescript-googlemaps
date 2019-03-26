module GMaps.Map.Types
  ( GestureHandling(..)
  , MapTypeId(..)
  ) where

import Data.Maybe (Maybe(..))
import Data.Show (class Show, show)
import Data.String.Read (class Read)
import Prelude (otherwise, (==))

data GestureHandling
  = Cooperative
  | Greedy
  | None
  | Auto

instance showGestureHandling :: Show GestureHandling
  where show Cooperative = "cooperative"
        show Greedy = "greedy"
        show None = "none"
        show Auto = "auto"

data MapTypeId
  = Hybrid
  | RoadMap
  | Satellite
  | Terrain

instance showMapTypeId :: Show MapTypeId
  where show Hybrid = "hybrid"
        show RoadMap = "roadmap"
        show Satellite = "satellite"
        show Terrain = "terrain"

instance readMapTypeId :: Read MapTypeId
  where read text
          | text == show Hybrid = Just Hybrid
          | text == show RoadMap = Just RoadMap
          | text == show Satellite = Just Satellite
          | text == show Terrain = Just Terrain
          | otherwise = Nothing
