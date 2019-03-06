module Test.Map
  ( specs
  ) where

import Prelude

import GMaps.Map as G
import Effect.Class (liftEffect)
import Test.Defaults (latLng) as Defaults
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
--import Test.Util (initMarker, setMarker, testIso)

specs :: G.Map -> Spec Unit
specs googleMap = do
  setterSpecs googleMap

setterSpecs :: G.Map -> Spec Unit
setterSpecs googleMap = do
  describe "Test Getters and Setters" do
    it "Can load map" do
      ll <- liftEffect Defaults.latLng
      (G.getCenter googleMap) `shouldEqual` ll
