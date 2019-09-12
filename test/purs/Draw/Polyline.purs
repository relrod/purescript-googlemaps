module Test.Draw.Polyline
  ( specs
  ) where

import Prelude

import GMaps.LatLng (toLiteral) as LatLng
import GMaps.Draw as D
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
        get = map LatLng.toLiteral <<< D.getPath
    in testIso Def.altPath set get

polySetterSpecs :: Spec Unit
polySetterSpecs = do
  it "Can set as draggable" $
    testIso true (setPolyline D.setDraggable) D.getDraggable
  it "Can set as editable" $
    testIso true (setPolyline D.setEditable) D.getEditable
  it "Can set path" $
    let get = map LatLng.toLiteral <<< D.getPath
    in testIso Def.altPath (setPolyline D.setPath) get
  it "Can set as invisible" $
    testIso false (setPolyline D.setVisible) D.getVisible

polyOptionsSpecs :: Spec Unit
polyOptionsSpecs = do
  it "Change draggable from default" $
    let set = initPolyline (_ { draggable = _ })
    in testIso true set D.getDraggable
  it "Change editable from default" $
    let set = initPolyline (_ { editable = _ })
    in testIso true set D.getEditable
  it "Change visible from default" $
    let set = initPolyline (_ { visible = _ })
    in testIso true set D.getVisible

