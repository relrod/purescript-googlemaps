module GMaps.MVCArray where

import Prelude (Unit)
import Control.Monad.Eff (Eff)
import Data.Function.Uncurried (Fn0, runFn0, Fn1, runFn1, Fn2, runFn2)

-- NOTE: This is different than upstream because we force all elements of the
-- MVCArray to be the same type. If this causes a problem, we can undo it at the
-- cost of some extra type safety, even though this is all wrapped in Eff. -rbe
foreign import data MVCArray :: Type -> Type

foreign import newMVCArrayImpl :: forall eff a. Fn0 (Eff eff (MVCArray a))

newMVCArray :: forall eff a. Eff eff (MVCArray a)
newMVCArray = runFn0 newMVCArrayImpl

foreign import pushMVCArrayImpl :: forall eff a. Fn2 (MVCArray a) a (Eff eff Unit)

pushMVCArray :: forall a eff. MVCArray a -> a -> Eff eff Unit
pushMVCArray = runFn2 pushMVCArrayImpl

foreign import popMVCArrayImpl :: forall eff a. Fn1 (MVCArray a) (Eff eff a)

popMVCArray :: forall a eff. MVCArray a -> Eff eff a
popMVCArray = runFn1 popMVCArrayImpl
