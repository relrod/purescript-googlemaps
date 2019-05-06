module Test.Geometry.Poly
  ( specs
  ) where

import Effect.Class (liftEffect)
import GMaps.Geometry.Poly as Poly
import GMaps.LatLng (LatLngLiteral)
import GMaps.LatLng (newLatLng, fromLiteral) as G
import GMaps.Draw.Polygon (newPolygon, defPolygonOptions) as G
import GMaps.Draw.Polyline (newPolyline, defPolylineOptions) as G
import Test.Defaults as Def
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Prelude

insideBermuda :: LatLngLiteral
insideBermuda = { lat: 24.886, lng: -70.269 }

whiteHouse :: LatLngLiteral
whiteHouse = { lat: 38.8976763, lng: -77.0365298 }

specs :: Spec Unit
specs = do
  describe "containsLocation" do
    it "Returns true when inside the bermuda triangle" do
      triangle <- liftEffect Def.polygon
      inside <- liftEffect (G.fromLiteral insideBermuda)
      (Poly.containsLocation inside triangle) `shouldEqual` true
    it "Returns false when not inisde the bermuda triangle" do
      triangle <- liftEffect Def.polygon
      outside <- liftEffect (G.fromLiteral whiteHouse)
      (Poly.containsLocation outside triangle) `shouldEqual` false
  describe "isLocationOnEdge" do
    describe "for polygons" do
      it "Returns false when outside" do
        triangle <- liftEffect Def.polygon
        inside <- liftEffect (G.fromLiteral insideBermuda)
        (Poly.isOnEdgeOfPolygon inside triangle) `shouldEqual` false
      it "Returns false when inside" do
        triangle <- liftEffect Def.polygon
        outside <- liftEffect (G.fromLiteral whiteHouse)
        (Poly.isOnEdgeOfPolygon outside triangle) `shouldEqual` false
      it "Returns true when on edge" do
        triangle <- liftEffect (G.newPolygon (G.defPolygonOptions [ Def.altPath ]))
        edge <- liftEffect (G.newLatLng 0.0 5.0)
        (Poly.isOnEdgeOfPolygon edge triangle) `shouldEqual` true
      it "Returns true when on corner" do
        triangle <- liftEffect Def.polygon
        corner <- liftEffect (G.newLatLng 25.774 (-80.190))
        (Poly.isOnEdgeOfPolygon corner triangle) `shouldEqual` true
    describe "for polylines" do
      it "Returns false when outside" do
        triangle <- liftEffect Def.polyline
        inside <- liftEffect (G.fromLiteral insideBermuda)
        (Poly.isOnEdgeOfPolyline inside triangle) `shouldEqual` false
      it "Returns false when inside" do
        triangle <- liftEffect Def.polyline
        outside <- liftEffect (G.fromLiteral whiteHouse)
        (Poly.isOnEdgeOfPolyline outside triangle) `shouldEqual` false
      it "Returns true when on edge" do
        triangle <- liftEffect (G.newPolyline (G.defPolylineOptions Def.altPath))
        edge <- liftEffect (G.newLatLng 0.0 5.0)
        (Poly.isOnEdgeOfPolyline edge triangle) `shouldEqual` true
      it "Returns true when on corner" do
        triangle <- liftEffect Def.polyline
        corner <- liftEffect (G.newLatLng 25.774 (-80.190))
        (Poly.isOnEdgeOfPolyline corner triangle) `shouldEqual` true
