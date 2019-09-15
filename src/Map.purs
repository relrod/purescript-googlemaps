module GMaps.Map
  ( module GMaps.Map.Types
  , Map
  , MapOptions
  , defMapOptions
  , defMapOptions_
  , gMap
  --, fitBounds
  --, getBounds
  , getCenter
  , getClickableIcons
  , getDiv
  , getHeading
  , getMapTypeId
  --, getProjection
  --, getStreetView
  , getTilt
  , getZoom
  , panBy
  , panTo
  --, panToBounds
  , setCenter
  , setClickableIcons
  , setHeading
  , setMapTypeId
  , setOptions
  --, setStreetView
  , setTilt
  , setZoom
  ) where

import Data.Function.Uncurried (Fn1, Fn2, Fn3, runFn1, runFn2, runFn3)
import Data.Maybe (Maybe(..))
import Data.String.Read (read)
import Effect (Effect)
import GMaps.Internal (orUndefined)
import GMaps.LatLng (LatLng, LatLngLiteral)
import GMaps.LatLng (toLiteral) as LatLng
import GMaps.Map.Types (GestureHandling, MapTypeId)
import Web.DOM (Element)
import Prelude (show, (<<<), (<$>))

type MapOptionsR =
  { center :: LatLngLiteral
  , backgroundColor :: String
  , clickableIcons :: Boolean
  , controlSize :: Number
  , disableDefaultUI :: Boolean
  , disableDoubleClickZoom :: Boolean
  , draggable :: Boolean
  , draggableCursor :: String
  --, fullscreenControl :: Boolean
  --, fullscreenControlOptions :: FullscreenControlOptions
  , gestureHandling :: String
  , heading :: Number
  , keyboardShortcuts :: Boolean
  --, mapTypeControl :: Boolean
  --, mapTypeControlOptions :: MapTypeControlOptions
  , mapTypeId :: String
  , maxZoom :: Int
  , minZoom :: Int
  , noClear :: Boolean
  --, panControl :: Boolean -- disabled v3.22
  --, panControlOptions :: PanControlOptions  -- disabled v3.22
  --, restriction :: MapRestriction
  --, rotateControl :: Boolean
  --, rotateControlOptions :: RotateControlOptions
  --, scaleControl :: Boolean
  --, scaleControlOptions :: ScaleControlOptions
  , scrollwheel :: Boolean
  --, streetView :: StreetViewPanorama
  --, streetViewControl :: Boolean
  --, streetViewControlOptions :: StreetViewControlOptions
  --, styles :: Array MapTypeStyle
  --, tilt :: Nothing
  , zoom :: Int
  --, zoomControl :: Boolean
  --, zoomControlOptions :: ZoomControlOptions
  }

type MapOptions =
  { center :: LatLngLiteral
  , backgroundColor :: Maybe String
  , clickableIcons :: Boolean
  , controlSize :: Maybe Number
  , disableDefaultUI :: Boolean
  , disableDoubleClickZoom :: Boolean
  , draggable :: Boolean
  , draggableCursor :: Maybe String
  --, fullscreenControlOptions :: Maybe FullscreenControlOptions
  , gestureHandling :: Maybe GestureHandling
  , heading :: Number
  , keyboardShortcuts :: Boolean
  --, mapTypeControlOptions :: Maybe MapTypeControlOptions
  , mapTypeId :: Maybe MapTypeId
  , maxZoom :: Maybe Int
  , minZoom :: Maybe Int
  , noClear :: Boolean
  --, panControl :: Boolean -- disabled v3.22
  --, panControlOptions :: PanControlOptions  -- disabled v3.22
  --, restriction :: Maybe MapRestriction
  --, rotateControlOptions :: Maybe RotateControlOptions
  --, scaleControlOptions :: Maybe ScaleControlOptions
  , scrollwheel :: Boolean
  --, streetView :: Maybe StreetViewPanorama
  --, streetViewControlOptions :: Maybe StreetViewControlOptions
  --, styles :: Array MapTypeStyle
  --, tilt :: Nothing
  , zoom :: Int
  --, zoomControlOptions :: Maybe ZoomControlOptions
  }

defMapOptions_ :: LatLng -> MapOptions
defMapOptions_ = defMapOptions <<< LatLng.toLiteral

defMapOptions :: LatLngLiteral -> MapOptions
defMapOptions center =
  { center
  , backgroundColor: Nothing
  , clickableIcons: true
  , controlSize: Nothing
  , disableDefaultUI: false
  , disableDoubleClickZoom: true
  , draggable: true
  , draggableCursor: Nothing
  --, fullscreenControlOptions: Nothing
  , gestureHandling: Nothing
  , heading: 0.0
  , keyboardShortcuts: true
  --, mapTypeControlOptions: Nothing
  , mapTypeId: Nothing
  , maxZoom: Nothing
  , minZoom: Nothing
  , noClear: false
  --, panControlOptions: Nothing  -- disabled v3.22
  --, restriction: Nothing
  --, rotateControlOptions: Nothing
  --, scaleControlOptions: Nothing
  , scrollwheel: true
  --, streetView: Nothing
  --, streetViewControlOption: Nothing
  --, styles: []
  --, tilt: Nothing
  , zoom: 10
  --, zoomControlOptions: Nothing
  }

runMapOptions :: MapOptions -> MapOptionsR
runMapOptions options = options
  { backgroundColor = orUndefined options.backgroundColor
  , controlSize = orUndefined options.controlSize
  , draggableCursor = orUndefined options.draggableCursor
  --, fullscreenControl = orUndefined options.fullScreenControlOptions
  --, fullscreenControlOptions = orUndefined options.fullScreenControlOptions
  , gestureHandling = orUndefined (show <$> options.gestureHandling)
  --, mapTypeControl = isJust options.mapTypeControlOptions
  --, mapTypeControlOptions = orUndefined options.mapTypeControlOptions
  , mapTypeId = orUndefined (show <$> options.mapTypeId)
  , maxZoom = orUndefined options.maxZoom
  , minZoom = orUndefined options.minZoom
  --, restriction = orUndefined options.restriction
  --, rotateControl = isJust options.rotateControlOptions
  --, rotateControlOptions = orUndefined options.rotateControlOptions
  --, scaleControl = isJust options.scaleControlOptions
  --, scaleControlOptions = orUndefined options.scaleControlOptions
  --, streetView = orUndefined options.streetView
  --, streetViewControl = isJust options.streetViewControlOptions
  --, streetViewControlOptions = orUndefined options.streetViewControlOptions
  --, styles = runMapTypeStyle <$> otpions.styles
  --, tilt = orUndefined options.tilt
  --, zoomControl = isJust options.zoomControlOptions
  --, zoomControlOptions = orUndefined options.zoomControlOptions
  }

foreign import data Map :: Type

foreign import gMapImpl :: Fn2 Element MapOptionsR (Effect Map)

gMap :: Element -> MapOptions -> Effect Map
gMap element = runFn2 gMapImpl element <<< runMapOptions

-- foreign import fitBoundsImpl :: Fn2 Map LatLngBounds (Effect Map)
-- fitBounds :: Map -> LatLngBounds -> Effect Map
-- fitBounds = runFn2 fitBoundsImpl

-- foreign import getBoundsImpl :: Fn1 Map LatLngBounds
-- getBounds :: Map -> LatLngBounds
-- getBounds = runFn1 getBoundsImpl

foreign import getCenterImpl :: Fn1 Map LatLng

getCenter :: Map -> LatLng
getCenter = runFn1 getCenterImpl

foreign import getClickableIconsImpl :: Fn1 Map Boolean

getClickableIcons :: Map -> Boolean
getClickableIcons = runFn1 getClickableIconsImpl

foreign import getDivImpl :: Fn1 Map Element

getDiv :: Map -> Element
getDiv = runFn1 getDivImpl

foreign import getHeadingImpl :: Fn1 Map Number

getHeading :: Map -> Number
getHeading = runFn1 getHeadingImpl

foreign import getMapTypeIdImpl :: Fn1 Map String

getMapTypeId :: Map -> Maybe MapTypeId
getMapTypeId = read <<< runFn1 getMapTypeIdImpl

--foreign import getProjectionImpl :: Fn1 Map Projection
--getProjection :: Map -> Projection
--getProjection = runFn1 getProjectionImpl

--foreign import getStreetViewImpl :: Fn1 Map StreetViewPanorama
--getStreetView :: Map -> StreetView
--getStreetView = runFn1 getStreetViewImpl

foreign import getTiltImpl :: Fn1 Map String

getTilt :: Map -> String
getTilt = runFn1 getTiltImpl

foreign import getZoomImpl :: Fn1 Map Number

getZoom :: Map -> Number
getZoom = runFn1 getZoomImpl

foreign import panByImpl :: Fn3 Map Number Number (Effect Map)

panBy :: Map -> Number -> Number -> Effect Map
panBy = runFn3 panByImpl

foreign import panToImpl :: Fn2 Map LatLng (Effect Map)

panTo :: Map -> LatLng -> Effect Map
panTo = runFn2 panToImpl

--foreign import panToBoundsImpl :: Fn2 Map LatLngBounds (Effect Map)
--panToBounds :: Map -> LatLngBounds -> Effect Map
--panToBounds = runFn2 panToBoundsImpl

foreign import setCenterImpl :: Fn2 Map LatLngLiteral (Effect Map)

setCenter :: Map -> LatLngLiteral -> Effect Map
setCenter = runFn2 setCenterImpl

foreign import setClickableIconsImpl :: Fn2 Map Boolean (Effect Map)

setClickableIcons :: Map -> Boolean -> Effect Map
setClickableIcons = runFn2 setClickableIconsImpl

foreign import setHeadingImpl :: Fn2 Map Number (Effect Map)

setHeading :: Map -> Number -> Effect Map
setHeading = runFn2 setHeadingImpl

foreign import setMapTypeIdImpl :: Fn2 Map String (Effect Map)

setMapTypeId :: Map -> MapTypeId -> Effect Map
setMapTypeId gmap = runFn2 setMapTypeIdImpl gmap <<< show

foreign import setOptionsImpl :: Fn2 Map MapOptionsR (Effect Map)

setOptions :: Map -> MapOptions -> Effect Map
setOptions map = runFn2 setOptionsImpl map <<< runMapOptions

--foreign import setStreetViewImpl :: Fn2 Map StreeViewPanorama (Effect Map)
--setStreetView :: Map -> StreeViewPanorama -> Effect Map
--setStreetView = runFn2 setStreetViewImpl

foreign import setTiltImpl :: Fn2 Map Number (Effect Map)

setTilt :: Map -> Number -> Effect Map
setTilt = runFn2 setTiltImpl

foreign import setZoomImpl :: Fn2 Map Number (Effect Map)

setZoom :: Map -> Number -> Effect Map
setZoom = runFn2 setZoomImpl
