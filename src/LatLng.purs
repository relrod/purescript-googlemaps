module GMaps.LatLng 
  ( LatLng
  , LatLngLiteral
  , newLatLng
  , fromLiteral
  , toLiteral
  , lat
  , lng
  ) where

import Data.Eq (class Eq)
import Data.Function.Uncurried (Fn1, Fn2, runFn1, runFn2)
import Data.Show (class Show)
import Effect (Effect)

type LatLngLiteral = 
  { lat :: Number
  , lng :: Number
  }

foreign import data LatLng :: Type

foreign import newLatLngImpl :: Fn2 Number Number (Effect LatLng)

newLatLng :: Number -> Number -> Effect LatLng
newLatLng = runFn2 newLatLngImpl

fromLiteral :: LatLngLiteral -> Effect LatLng
fromLiteral lit = newLatLng lit.lat lit.lng

foreign import toLiteralImpl :: Fn1 LatLng LatLngLiteral

toLiteral :: LatLng -> LatLngLiteral
toLiteral = runFn1 toLiteralImpl

foreign import latImpl :: Fn1 LatLng Number

lat :: LatLng -> Number
lat = runFn1 latImpl

foreign import lngImpl :: Fn1 LatLng Number

lng :: LatLng -> Number
lng = runFn1 lngImpl

foreign import toStringImpl :: Fn1 LatLng String

instance showLatLng :: Show LatLng
  where show = runFn1 toStringImpl

foreign import equalsImpl :: Fn2 LatLng LatLng Boolean

instance eqLatLng :: Eq LatLng
  where eq = runFn2 equalsImpl
