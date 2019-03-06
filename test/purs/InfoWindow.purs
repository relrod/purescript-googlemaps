module Test.InfoWindow
  ( specs
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Class (liftEffect)
import GMaps.LatLng (newLatLng)
import GMaps.InfoWindow as G
import Test.Spec (Spec, describe, it)
import Test.Util (initWindow, setWindow, testIso)

specs :: Spec Unit
specs = do
  initOptionSpecs
  setterSpecs

initOptionSpecs :: Spec Unit
initOptionSpecs = do
  describe "Test initialization options" do
    it "Change content from default" $
      let set = initWindow (_ { content = _ })
       in testIso (Just "hello, world") set G.getContent
    -- no getDisableAutoPan
    -- no getMaxWidth
    -- no getPixelOffset
    it "Change zIndex from default" $
      let set = initWindow (_ { zIndex = _ })
       in testIso (Just 8.0) set G.getZIndex

setterSpecs :: Spec Unit
setterSpecs = do
  describe "Test Getters and Setters" do
    it "Can set the position" do
      latLng <- liftEffect (newLatLng 50.0 (-50.0))
      let set = setWindow G.setPosition
      testIso latLng set G.getPosition
    let setContent = setWindow G.setContent
    it "Can set the content" $
      testIso (Just "some content") setContent G.getContent
    it "Can clear the content" $
      testIso (Nothing) setContent G.getContent
    let setZIndex = setWindow G.setZIndex
    it "Can set the Z Index" $
      testIso (Just 12.0) setZIndex G.getZIndex
    it "Can reset the Z Index to default" $
      testIso (Nothing) setZIndex G.getZIndex

