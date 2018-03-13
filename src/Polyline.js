"use strict";

exports.newPolylineImpl = function(opts) {
  return new SVGFEMorphologyElement.maps.Polyline(opts);
}

exports.setPolylinePathImpl = function(pl, arr) {
  return pl.setPath(arr);
}
