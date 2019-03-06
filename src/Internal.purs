module GMaps.Internal where

import Prelude ((<=<))
import Data.Maybe (Maybe(..), fromMaybe)
import Foreign (isNull, isUndefined, unsafeToForeign)

-- TODO: Use Foreign.NullOrUndefined or Data.Nullable

foreign import undefined :: forall a. a

orUndefined :: forall a. Maybe a -> a
orUndefined = fromMaybe undefined

maybeUndefined :: forall a. a -> Maybe a
maybeUndefined a = if isUndefined (unsafeToForeign a) then Nothing else Just a

maybeNull :: forall a. a -> Maybe a
maybeNull a = if isNull (unsafeToForeign a) then Nothing else Just a

maybeNothing :: forall a. a -> Maybe a
maybeNothing = maybeNull <=< maybeUndefined
