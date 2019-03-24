module GMaps.MVCObject
  ( class MVCObject
  , Listener
  , addListener
  , defAddListener
  , removeListener
  ) where

import Data.Function.Uncurried (Fn1, runFn1, Fn3, runFn3)
import Effect (Effect)
import GMaps.MVCEvent (class MVCEvent, eventName)
import Prelude (Unit)

foreign import data Listener :: Type

class MVCObject o e
  where addListener :: forall a. MVCEvent e => o -> e -> (a -> Effect Unit) -> Effect Listener

foreign import addListenerImpl :: forall o a.  Fn3 o String (a -> Effect Unit) (Effect Listener)

defAddListener :: forall e o a. MVCEvent e => MVCObject o e => o -> e -> (a -> Effect Unit) -> Effect Listener
defAddListener object event handler = runFn3 addListenerImpl object (eventName event) handler

foreign import removeListenerImpl :: Fn1 Listener (Effect Unit)

removeListener :: Listener -> Effect Unit
removeListener = runFn1 removeListenerImpl
