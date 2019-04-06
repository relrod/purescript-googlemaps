module Test.Map
  ( specs
  ) where

import Prelude

import GMaps.Map as G
import GMaps.LatLng (newLatLng, toLiteral) as L
import Effect.Class (liftEffect)
import Test.Defaults (latLng) as Defaults
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Util (testIso)

specs :: G.Map -> Spec Unit
specs googleMap = do
  setterSpecs googleMap

setterSpecs :: G.Map -> Spec Unit
setterSpecs googleMap = do
  describe "Test Getters and Setters" do
    it "Can load map" do
      ll <- liftEffect Defaults.latLng
      (G.getCenter googleMap) `shouldEqual` ll
    it "Can set the map's center" do
      center <- liftEffect (L.newLatLng 43.0741751 (-89.3844704))
      let set = G.setCenter googleMap <<< L.toLiteral
      testIso center set G.getCenter
    describe "Clickable icons" do
      it "Can set the map's icons as clickable" $
        testIso true (G.setClickableIcons googleMap) G.getClickableIcons
      it "Can set the map's icons as unclickable" $
        testIso false (G.setClickableIcons googleMap) G.getClickableIcons
    -- No setDiv
    describe "Heading" do
      it "Can set the map's heading as due west" $
        testIso (-90.0) (G.setHeading googleMap) G.getHeading
      it "Can set the map's heading as due south" $
        testIso (180.0) (G.setHeading googleMap) G.getHeading
      it "Can set the map's heading as higher than 360 degrees" $
        testIso (5894.20) (G.setHeading googleMap) G.getHeading
