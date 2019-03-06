module Test.Main where

import Prelude

import Effect (Effect)
import Test.LatLng as LatLng
import Test.Spec (describe)
import Test.Spec.Mocha (runMocha)

main :: Effect Unit
main = runMocha do
  describe "GMaps.LatLng" LatLng.specs

