# PureScript Google Maps

## Introduction

An interface to Google Maps Javascript API. Allows loading maps into an HTML page/application, then adding markers and polylines to those maps.

## Example

Assuming the use of [Pulp](https://github.com/purescript-contrib/pulp) a Google Maps project could be started by running these commands:

```bash
mkdir map-project
cd map-project
pulp init
bower install --save relrod/purescript-googlemaps
```

Then delete everything in the file `src/Main.purs` and paste this into it:

```purescript
module Main where

import Prelude
import Effect (Effect)
import Web.DOM (DOM, ElementId(..), Element)
import Web.HTML (window) as HTML
import Web.HTML.Window (document) as HTML
import Web.HTML.HTMLDocument (toNonElementParentNode) as HTML
import Web.DOM.NonElementParentNode (getElementById) as DOM
import Data.Maybe (Maybe(..))
import GMaps.LatLng (newLatLng)
import GMaps.Map (MapTypeId(RoadMap), defMapOptions, gMap)

loadMap :: Effect Unit
loadMap = do
  let eid = ElementId "map"
  center <- newLatLng (-25.363) (131.044)
  let opts = defMapOptions center { zoom = 4.0, mapTypeId = Just RoadMap }
  elem <- getElementById' eid
  for_ elem (\e -> gMap e opts)

getElementById' :: ElementId -> Effect (Maybe Element)
getElementById' eid = do
  document <- HTML.document =<< HTML.window
  elem <- DOM.getElementById eid (HTML.toNonElementParentNode document)
  DOM.getElementById eid (HTML.toNonElementParentNode document)
```

Create a new file (in the `map-project` directory), call it `index.html`

```html
<!DOCTYPE html>
<html>
  <head>
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
  </head>
  <body>
    <h3>My Google Maps Demo</h3>
    <div id="map"></div>
    <script src="app.js"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=PS.Main.loadMap">
    </script>
  </body>
</html>
```

Don't forget to add your API key (obtained from Google) to the `<script>` tag above (where it says `YOUR_API_KEY`).

Then build the project (again assuming `pulp` is being used):

```bash
pulp build --to app.js --skip-entry-point
```

Note: since our `loadMap` function is called from Google Maps we add `--skip-entry-point` to `pulp build`, so it does not complain about the lack of a `main` function.

Open `index.html` in a Web browser and a map (centred on Australia) will be displayed.
