module Test.Main where

import Prelude

import Effect (Effect)
import Test.Spec (describe, it)
import Test.Spec.Assertions (fail)
import Test.Spec.Mocha (runMocha)

main :: Effect Unit
main = runMocha do
  describe "your feature" $
    it "works" $
      fail "You should probably add some tests"
