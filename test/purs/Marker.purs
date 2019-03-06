module Test.Marker 
  ( specs
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Effect.Class (liftEffect)
import GMaps.LatLng (newLatLng)
import GMaps.Marker as G
import Test.Spec (Spec, describe, it)
import Test.Util (initMarker, setMarker, testIso)

specs :: Spec Unit
specs = do
  initOptionsSpecs
  setterSpecs

setterSpecs :: Spec Unit
setterSpecs = do
  describe "Test Getters and Setters" do
    it "Can set a marker's position" do
      latLng <- liftEffect (newLatLng 50.0 (-50.0))
      let set = setMarker G.setPosition
      testIso latLng set G.getPosition
-- TODO: Animation
    let setClickable = setMarker G.setClickable
    it "Can set a marker as clickable" $
       testIso true setClickable G.getClickable
    it "Can set a marker as unclickable" $
       testIso false setClickable G.getClickable
-- TODO: Cursor
    let setDraggable = setMarker G.setDraggable
    it "Can set a marker as draggable" $
      testIso true setDraggable G.getDraggable
    it "Can set a marker as undraggable" $
      testIso false setDraggable G.getDraggable
    let setIcon = setMarker G.setIcon
    it "Can set a marker's Icon" $
      testIso (Just "fake.jpeg") setIcon G.getIcon
    it "Can clear a marker's Icon" $
      testIso (Nothing) setIcon G.getIcon
    let setLabel = setMarker G.setLabel
    it "Can set a marker's label" $
      testIso (Just 'A') setLabel G.getLabel
    it "Can clear a marker's label" $
      testIso (Nothing) setLabel G.getLabel
    it "Can set a marker's opacity" $
      let set = setMarker G.setOpacity
       in testIso 0.5 set G.getOpacity
-- TODO: Shape
    let setTitle = setMarker G.setTitle
    it "Can set a marker's title" $
      testIso "Test" setTitle G.getTitle
    it "Can clear a marker's title" $
      testIso "" setTitle G.getTitle
    let setVisible = setMarker G.setVisible
    it "Can set a marker as visible" $
      testIso true setVisible G.getVisible
    it "Can set a marker as invisible" $
      testIso false setVisible  G.getVisible
    it "Can set a marker's z index" $
      let set = setMarker G.setZIndex
       in testIso 3.0 set G.getZIndex

initOptionsSpecs :: Spec Unit
initOptionsSpecs = do
  describe "Test initialization options" do
-- TODO: Animation
-- no get/set Anchor in the api.
    it "Change clickable from default" $
      let set = initMarker (_ { clickable = _ })
       in testIso false set G.getClickable
-- no get/set CrossOnDrag in the api.
-- TODO: Cursor
    it "Change draggable from default" $
      let set = initMarker (_ { draggable = _ })
       in testIso false set G.getDraggable
    it "Change icon from default" $
      let set = initMarker (_ { icon = _ })
       in testIso (Just "icon.png") set G.getIcon
    it "Change label from default" $
      let set = initMarker (_ { label = _ })
       in testIso (Just 'X') set G.getLabel
    it "Change opacity from default" $
      let set = initMarker (_ { opacity = _ })
       in testIso 0.5 set G.getOpacity
-- no get/set optimized in the api.
-- TODO: Shape
    it "Change title from default" $
      let set = initMarker (_ { title = _ })
       in testIso (Just "hello, world") set (Just <<< G.getTitle)
    it "Change visible from default" $
      let set = initMarker (_ { visible = _ })
       in testIso false set G.getVisible
    it "Change Z-Index from default" $
      let set = initMarker (_ { zIndex = _ })
       in testIso (Just 2.0) set (Just <<< G.getZIndex)

-- TODO: setOptions
