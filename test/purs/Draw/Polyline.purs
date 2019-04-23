module Test.Draw.Polyline
  ( specs
  ) where

import Prelude

import GMaps.LatLng (toLiteral) as LatLng
import GMaps.Draw.Polyline as G
import Test.Defaults (altPath) as Def
import Test.Spec (Spec, describe, it)
import Test.Util (initPolyline, setPolyline, testIso)

specs :: Spec Unit
specs = do
  describe "Test initialization options" $
    initOptionSpecs
  describe "Common Poly Getters and Setters" $
    polySetterSpecs
  describe "Common Poly Intialization options" $
    polyOptionsSpecs

initOptionSpecs :: Spec Unit
initOptionSpecs = do
  it "Change path from default" $
    let set = initPolyline (_ { path = _ })
        get = map LatLng.toLiteral <<< G.getPath
    in testIso Def.altPath set get

-- TODO: shared with Polygon
polySetterSpecs :: Spec Unit
polySetterSpecs = do
  it "Can set as draggable" $
    testIso true (setPolyline G.setDraggable) G.getDraggable
  it "Can set as editable" $
    testIso true (setPolyline G.setEditable) G.getEditable
  it "Can set path" $
    let get = map LatLng.toLiteral <<< G.getPath
    in testIso Def.altPath (setPolyline G.setPath) get
  it "Can set as invisible" $
    testIso false (setPolyline G.setVisible) G.getVisible

-- TODO: shared with Polygon
polyOptionsSpecs :: Spec Unit
polyOptionsSpecs = do
  it "Change draggable from default" $
    let set = initPolyline (_ { draggable = _ })
    in testIso true set G.getDraggable
  it "Change editable from default" $
    let set = initPolyline (_ { editable = _ })
    in testIso true set G.getEditable
  it "Change visible from default" $
    let set = initPolyline (_ { visible = _ })
    in testIso true set G.getVisible

