# Module Documentation

## Module GMaps

## Module GMaps.InfoWindow

### Types

    data InfoWindow :: *

    data InfoWindowOptions where
      InfoWindowOptions :: { content :: String } -> InfoWindowOptions

    type InfoWindowOptionsR = { content :: String }


### Values

    newInfoWindow :: forall eff. InfoWindowOptions -> Eff eff InfoWindow

    newInfoWindowFFI :: forall eff. InfoWindowOptionsR -> Eff eff InfoWindow

    openInfoWindow :: forall eff. InfoWindow -> Map -> Marker -> Eff eff Unit

    runInfoWindowOptions :: InfoWindowOptions -> InfoWindowOptionsR


## Module GMaps.LatLng

### Types

    data LatLng


### Values

    newLatLng :: forall eff. Number -> Number -> Eff eff LatLng


## Module GMaps.MVCArray

### Types

    data MVCArray :: * -> *


### Values

    newMVCArray :: forall eff a. Eff eff (MVCArray a)

    popMVCArray :: forall a eff. MVCArray a -> Eff eff a

    pushMVCArray :: forall a eff. MVCArray a -> a -> Eff eff Unit


## Module Main

## Module GMaps.Map

### Types

    data Map :: *


### Values

    gMap :: forall eff. HTMLElement -> MapOptions -> Eff eff Map

    panTo :: forall eff. Map -> LatLng -> Eff eff Unit


## Module GMaps.MapOptions

### Types

    data MapOptions where
      MapOptions :: { mapTypeId :: String, center :: LatLng, zoom :: Number } -> MapOptions


### Values

    runMapOptions :: MapOptions -> { mapTypeId :: String, center :: LatLng, zoom :: Number }


## Module GMaps.Marker

### Types

    data Marker :: *

    data MarkerOptions where
      MarkerOptions :: { title :: String, map :: Map, position :: LatLng } -> MarkerOptions

    type MarkerOptionsR = { title :: String, map :: Map, position :: LatLng }


### Values

    newMarker :: forall eff. MarkerOptions -> Eff eff Marker

    newMarkerFFI :: forall eff. MarkerOptionsR -> Eff eff Marker

    runMarkerOptions :: MarkerOptions -> MarkerOptionsR

    setMarkerPosition :: forall eff. Marker -> LatLng -> Eff eff Unit


## Module GMaps.Polyline

### Types

    data Polyline :: *

    data PolylineOptions where
      PolylineOptions :: { map :: Map, strokeWeight :: Number, strokeOpacity :: Number, strokeColor :: String, geodescic :: Boolean } -> PolylineOptions


### Values

    newPolyline :: forall eff. PolylineOptions -> Eff eff Polyline

    setPolylinePath :: forall eff. Polyline -> MVCArray LatLng -> Eff eff Unit



