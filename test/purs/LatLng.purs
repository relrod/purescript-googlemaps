module Test.LatLng 
  ( specs
  ) where

import Prelude

import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import GMaps.LatLng as G
import Math (round)
import Test.Defaults as Def
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

shouldAlmostEqual :: Number -> Number -> Aff Unit
shouldAlmostEqual x y = 
  let r = 10000000.0
      rx = round (x * r) / r
      ry = round (y * r) / r
   in rx `shouldEqual` ry

specs :: Spec Unit
specs = do
  describe "LatLng's instances" do
    it "LatLngs with the same coords are equal" do
      latLng1 <- liftEffect Def.latLng
      latLng2 <- liftEffect Def.latLng
      latLng1 `shouldEqual` latLng2
    it "Can get lat from a LatLng" do
      latLng <- liftEffect Def.latLng
      (G.lat latLng) `shouldAlmostEqual` Def.lat
    it "Can get lng from a LatLng" do
      latLng <- liftEffect Def.latLng
      (G.lng latLng) `shouldAlmostEqual` Def.lng
    it "Can create from literal" do
      latLng <- liftEffect Def.latLng
      frmLit <- liftEffect (G.fromLiteral { lat: Def.lat, lng: Def.lng })
      frmLit `shouldEqual` latLng
    it "Can translate to a literal" do
      latLng <- liftEffect Def.latLng
      let lit = G.toLiteral latLng
      lit.lat `shouldAlmostEqual` Def.lat
      lit.lng `shouldAlmostEqual` Def.lng

