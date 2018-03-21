# PureScript Google Maps

## Introduction

An interface to Google Map's Javascript API. Allows loading maps into an HTML page/application, then adding markers and polylines to those maps.

## Example

Assuming the use of [Pulp](https://github.com/purescript-contrib/pulp) a Google Maps project could be started by running these commands:

```Bash
mkdir map-project
cd map-project
pulp init
bower install --save relrod/purescript-googlemaps
```

Then delete everything in the file `src/Main.purs` and paste this into it:

```PureScript
module Main where

import Prelude
import Control.Monad.Eff (Eff)
import DOM (DOM)
import DOM.HTML (window) as HTML
import DOM.HTML.Window (document) as HTML
import DOM.HTML.Types (htmlDocumentToNonElementParentNode) as HTML
import DOM.Node.NonElementParentNode (getElementById) as DOM
import DOM.Node.Types (ElementId(..), Element)
import Data.Maybe (Maybe(..))
import GMaps.LatLng (newLatLng)
import GMaps.Map (gMap)
import GMaps.MapOptions (MapOptions(..))

loadMap :: forall eff.
  Eff (dom :: DOM | eff)
  Unit
loadMap = do
  let eid = ElementId "map"
  latlng <- newLatLng (-25.363) (131.044)
  let opts = MapOptions { zoom: 4.0, center: latlng, mapTypeId: "roadmap" }
  elem <- getElementById' eid
  case elem of
    Just elem_ -> do
      _ <- gMap elem_ opts
      pure unit
    Nothing -> pure unit

getElementById' :: forall eff.
  ElementId
  -> Eff
       ( dom :: DOM
       | eff
       )
       (Maybe Element)
getElementById' eid = do
  document <- HTML.document =<< HTML.window
  elem <- DOM.getElementById eid (HTML.htmlDocumentToNonElementParentNode document)
  DOM.getElementById eid (HTML.htmlDocumentToNonElementParentNode document)
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