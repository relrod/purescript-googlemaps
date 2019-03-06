module Test.Defaults where

import Prelude (negate)

import Effect (Effect)
import GMaps.LatLng (LatLng, newLatLng)

-- TODO: Quickcheck Arbitrary or Gen latLng?

lat :: Number
lat = 38.8976763

lng :: Number
lng = (-77.0365298)

latLng :: Effect LatLng
latLng = newLatLng lat lng
