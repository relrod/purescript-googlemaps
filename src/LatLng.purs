module GMaps.LatLng where

import Control.Monad.Eff

data LatLng

foreign import newLatLng
  "function newLatLng(x) {\
  \  return function(y) {\
  \    return function() {\
  \      return (new google.maps.LatLng(x, y));\
  \    };\
  \ };\
  \}" :: forall eff. Number -> Number -> Eff eff LatLng
