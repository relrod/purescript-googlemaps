module GMaps.MVCArray 
  ( MVCArray
  , newMVCArray
  , pushMVCArray
  , popMVCArray
  ) where

import Prelude (Unit)
import Effect (Effect)
import Data.Function.Uncurried (Fn0, runFn0, Fn1, runFn1, Fn2, runFn2)

-- NOTE: This is different than upstream because we force all elements of the
-- MVCArray to be the same type. If this causes a problem, we can undo it at the
-- cost of some extra type safety, even though this is all wrapped in Eff. -rbe
foreign import data MVCArray :: Type -> Type

foreign import newMVCArrayImpl :: forall a. Fn0 (Effect (MVCArray a))

newMVCArray :: forall a. Effect (MVCArray a)
newMVCArray = runFn0 newMVCArrayImpl

foreign import pushMVCArrayImpl :: forall a. Fn2 (MVCArray a) a (Effect Unit)

pushMVCArray :: forall a. MVCArray a -> a -> Effect Unit
pushMVCArray = runFn2 pushMVCArrayImpl

foreign import popMVCArrayImpl :: forall a. Fn1 (MVCArray a) (Effect a)

popMVCArray :: forall a. MVCArray a -> Effect a
popMVCArray = runFn1 popMVCArrayImpl
