module GMaps.MVCArray where

import Control.Monad.Eff
import Data.Function (Fn, runFn, Fn1, runFn1, Fn2, runFn2)

-- NOTE: This is different than upstream because we force all elements of the
-- MVCArray to be the same type. If this causes a problem, we can undo it at the
-- cost of some extra type safety, even though this is all wrapped in Eff. -rbe
foreign import data MVCArray :: Type -> Type

foreign import newMVCArrayImpl :: forall eff a. Fn Eff eff (MVCArray a)

newMVCArray :: forall eff a. Eff eff (MVCArray a)
newMVCArray = runFn newMVCArrayImpl

foreign import pushMVCArrayImpl :: forall eff a. Fn2 (MVCArray a) (Eff eff a)

pushMVCArray :: forall a eff. MVCArray a -> a -> Eff eff Unit
pushMVCArray = runFn2 pushMVCArray

foreign import popMVCArrayImpl :: forall eff a. Fn1 (MVCArray a) (Eff eff a)

popMVCArray :: forall a eff. MVCArray a -> Eff eff a
popMVCArray = runFn1 popMVCArrayImpl
