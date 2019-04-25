module GMaps.MVC.PolyMouseEvent
  ( PolyMouseEvent
  , getEdge
  , getLatLng
  , getPath
  , getVertex
  , stop
  ) where

import Effect (Effect)
import Data.Function.Uncurried (Fn1, runFn1)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype, unwrap)
import GMaps.Internal (maybeNothing)
import GMaps.LatLng (LatLng)
import GMaps.MVC.MouseEvent (MouseEvent)
import GMaps.MVC.MouseEvent (getLatLng, stop) as MouseEvent
import Prelude (Unit, (<<<))

newtype PolyMouseEvent = PolyMouseEvent MouseEvent

derive instance newtypePolyMouseEvent :: Newtype PolyMouseEvent _

-- TODO: what does unwrap compile to?
stop :: PolyMouseEvent -> Effect Unit
stop = MouseEvent.stop <<< unwrap

getLatLng :: PolyMouseEvent -> LatLng
getLatLng = MouseEvent.getLatLng <<< unwrap

foreign import getEdgeImpl :: Fn1 PolyMouseEvent Int

getEdge :: PolyMouseEvent -> Maybe Int
getEdge = maybeNothing <<< runFn1 getEdgeImpl

foreign import getPathImpl :: Fn1 PolyMouseEvent Int

getPath :: PolyMouseEvent -> Maybe Int
getPath = maybeNothing <<< runFn1 getPathImpl

foreign import getVertexImpl :: Fn1 PolyMouseEvent Int

getVertex :: PolyMouseEvent -> Maybe Int
getVertex = maybeNothing <<< runFn1 getVertexImpl
