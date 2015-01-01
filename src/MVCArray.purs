module GMaps.MVCArray where

import Control.Monad.Eff

-- NOTE: This is different than upstream because we force all elements of the
-- MVCArray to be the same type. If this causes a problem, we can undo it at the
-- cost of some extra type safety, even though this is all wrapped in Eff. -rbe
foreign import data MVCArray :: * -> *

foreign import newMVCArray
  "function newMVCArray() {\
  \    return new google.maps.MVCArray();\
  \}" :: forall eff a. Eff eff (MVCArray a)

foreign import pushMVCArray
  "function pushMVCArray(arr) {\
  \  return function(ele) {\
  \    return function() {\
  \      arr.push(ele);\
  \      return;\
  \    };\
  \  };\
  \}" :: forall a eff. MVCArray a -> a -> Eff eff Unit

foreign import popMVCArray
  "function popMVCArray(arr) {\
  \  return function() {\
  \    return arr.pop();\
  \  };\
  \}" :: forall a eff. MVCArray a -> Eff eff a
