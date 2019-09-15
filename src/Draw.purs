module GMaps.Draw
  ( class Draw
  , getDraggable
  , getEditable
  , getPath
  , getPath_
  , getVisible
  , setDraggable
  , setEditable
  , setPath
  , setPath_
  , setVisible
  ) where

import Data.Function.Uncurried (Fn1, runFn1, Fn2, runFn2)
import Effect (Effect)
import GMaps.Draw.Polygon (Polygon)
import GMaps.Draw.Polyline (Polyline)
import GMaps.LatLng (LatLng, LatLngLiteral)
import GMaps.LatLng (toLiteral) as LatLng
import GMaps.MVC.MVCArray (MVCArray)
import GMaps.MVC.MVCArray (toArray) as MVCArray
import Prelude (map, (<<<))

class Draw a where
  getDraggable :: a -> Boolean
  getEditable :: a -> Boolean
  getPath :: a -> Array LatLng
  getPath_ :: a -> MVCArray LatLng
  getVisible :: a -> Boolean
  setDraggable :: a -> Boolean -> Effect a
  setPath :: a -> Array LatLngLiteral -> Effect a
  setPath_ :: a -> Array LatLng -> Effect a
  setEditable :: a -> Boolean -> Effect a
  setVisible :: a -> Boolean -> Effect a

-- NOTE: eta expansion of these methods are require for compilation

instance drawPolygon :: Draw Polygon where
  getDraggable d = _getDraggable d
  getEditable d = _getEditable d
  getPath d = _getPath d
  getPath_ d = _getPath_ d
  getVisible d = _getVisible d
  setDraggable d = _setDraggable d
  setEditable d = _setEditable d
  setPath d = _setPath d
  setPath_ d = _setPath_ d
  setVisible d = _setVisible d

instance drawPolyline :: Draw Polyline where
  getDraggable d = _getDraggable d
  getEditable d = _getEditable d
  getPath d = _getPath d
  getPath_ d = _getPath_ d
  getVisible d = _getVisible d
  setDraggable d = _setDraggable d
  setEditable d = _setEditable d
  setPath d = _setPath d
  setPath_ d = _setPath_ d
  setVisible d = _setVisible d

foreign import getDraggableImpl :: forall a. Fn1 a Boolean

_getDraggable :: forall a. a -> Boolean
_getDraggable = runFn1 getDraggableImpl

foreign import getEditableImpl :: forall a. Fn1 a Boolean

_getEditable :: forall a. Draw a =>  a -> Boolean
_getEditable = runFn1 getEditableImpl

foreign import getPathImpl :: forall a. Fn1 a (MVCArray LatLng)

_getPath_ :: forall a. a -> MVCArray LatLng
_getPath_ = runFn1 getPathImpl

_getPath :: forall a. a -> Array LatLng
_getPath = MVCArray.toArray <<< _getPath_

foreign import getVisibleImpl :: forall a. Fn1 a Boolean

_getVisible :: forall a. a -> Boolean
_getVisible = runFn1 getVisibleImpl

foreign import setDraggableImpl :: forall a. Fn2 a Boolean (Effect a)

_setDraggable :: forall a. a -> Boolean -> Effect a
_setDraggable = runFn2 setDraggableImpl

foreign import setEditableImpl :: forall a. Fn2 a Boolean (Effect a)

_setEditable :: forall a. a -> Boolean -> Effect a
_setEditable = runFn2 setEditableImpl

foreign import setPathImpl :: forall a. Fn2 a (Array LatLngLiteral) (Effect a)

_setPath :: forall a. a -> Array LatLngLiteral -> Effect a
_setPath = runFn2 setPathImpl

_setPath_ :: forall a. a -> Array LatLng -> Effect a
_setPath_ draw = _setPath draw <<< map LatLng.toLiteral

foreign import setVisibleImpl :: forall a. Fn2 a Boolean (Effect a)

_setVisible :: forall a. a -> Boolean -> Effect a
_setVisible = runFn2 setVisibleImpl
