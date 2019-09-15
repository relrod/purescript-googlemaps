module Test.Draw.Polygon
  ( specs
  ) where

import Prelude

import GMaps.LatLng (toLiteral) as LatLng
import GMaps.Draw as D
import GMaps.Draw.Polygon as P
import Test.Defaults (altPath) as Def
import Test.Spec (Spec, describe, it)
import Test.Util (initPolygon, setPolygon, testIso)

specs :: Spec Unit
specs = do
  describe "Polygon specific Getters and setters" $
    setterSpecs
  describe "Polygon specific initialization options" $
    initOptionSpecs
  describe "Common Poly Getters and Setters" $
    polySetterSpecs
  describe "Common Poly Intialization options" $
    polyOptionsSpecs

setterSpecs :: Spec Unit
setterSpecs = do
  it "Can set mutiple paths at a time" $
    let set = setPolygon P.setPaths
        get = map (map LatLng.toLiteral) <<< P.getPaths
        paths =
          [ [ { lat: 0.0, lng: 0.0 }
            , { lat: 10.0, lng: 0.0 }
            , { lat: 0.0, lng: 10.0 }
            , { lat: 0.0, lng: 0.0 }
            ]
          , [ { lat: 2.0, lng: 2.0 }
            , { lat: 2.0, lng: 8.0 }
            , { lat: 8.0, lng: 2.0 }
            , { lat: 2.0, lng: 2.0 }
            ]
          ]
    in testIso paths set get

initOptionSpecs :: Spec Unit
initOptionSpecs = do
  it "Change path from default" $
    let set = initPolygon (_ { paths = _ })
        get = map (map LatLng.toLiteral) <<< P.getPaths
    in testIso [ Def.altPath ] set get

polySetterSpecs :: Spec Unit
polySetterSpecs = do
  it "Can set as draggable" $
    testIso true (setPolygon D.setDraggable) D.getDraggable
  it "Can set as editable" $
    testIso true (setPolygon D.setEditable) D.getEditable
  it "Can set path" $
    let get = map LatLng.toLiteral <<< D.getPath
    in testIso Def.altPath (setPolygon D.setPath) get
  it "Can set as invisible" $
    testIso false (setPolygon D.setVisible) D.getVisible

polyOptionsSpecs :: Spec Unit
polyOptionsSpecs = do
  it "Change draggable from default" $
    let set = initPolygon (_ { draggable = _ })
    in testIso true set D.getDraggable
  it "Change editable from default" $
    let set = initPolygon (_ { editable = _ })
    in testIso true set D.getEditable
  it "Change visible from default" $
    let set = initPolygon (_ { visible = _ })
    in testIso true set D.getVisible
