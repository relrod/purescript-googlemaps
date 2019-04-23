module Test.Draw.Polygon
  ( specs
  ) where

import Prelude

import GMaps.LatLng (toLiteral) as LatLng
import GMaps.Draw.Polygon as G
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
    let set = setPolygon G.setPaths
        get = map (map LatLng.toLiteral) <<< G.getPaths
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
        get = map (map LatLng.toLiteral) <<< G.getPaths
    in testIso [ Def.altPath ] set get

-- TODO: shared with Polyline
polySetterSpecs :: Spec Unit
polySetterSpecs = do
  it "Can set as draggable" $
    testIso true (setPolygon G.setDraggable) G.getDraggable
  it "Can set as editable" $
    testIso true (setPolygon G.setEditable) G.getEditable
  it "Can set path" $
    let get = map LatLng.toLiteral <<< G.getPath
    in testIso Def.altPath (setPolygon G.setPath) get
  it "Can set as invisible" $
    testIso false (setPolygon G.setVisible) G.getVisible

-- TODO: shared with Polyline
polyOptionsSpecs :: Spec Unit
polyOptionsSpecs = do
  it "Change draggable from default" $
    let set = initPolygon (_ { draggable = _ })
    in testIso true set G.getDraggable
  it "Change editable from default" $
    let set = initPolygon (_ { editable = _ })
    in testIso true set G.getEditable
  it "Change visible from default" $
    let set = initPolygon (_ { visible = _ })
    in testIso true set G.getVisible
