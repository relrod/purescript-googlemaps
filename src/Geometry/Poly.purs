module GMaps.Geometry.Poly
  ( containsLocation
  , isOnEdgeOfPolygon
  , isOnEdgeOfPolyline
  ) where

import GMaps.Draw.Polygon (Polygon)
import GMaps.Draw.Polyline (Polyline)
import Data.Function.Uncurried (Fn2, runFn2)
import GMaps.LatLng (LatLng)

foreign import containsLocationImpl :: Fn2 LatLng Polygon Boolean

containsLocation :: LatLng -> Polygon -> Boolean
containsLocation = runFn2 containsLocationImpl

foreign import isLocationOnEdgeImpl :: forall a. Fn2 LatLng a Boolean

isOnEdgeOfPolygon :: LatLng -> Polygon -> Boolean
isOnEdgeOfPolygon = runFn2 isLocationOnEdgeImpl

isOnEdgeOfPolyline :: LatLng -> Polyline -> Boolean
isOnEdgeOfPolyline = runFn2 isLocationOnEdgeImpl
