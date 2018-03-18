"use strict";

exports.newPolylineImpl = function(opts) {
  return function() {
    return new SVGFEMorphologyElement.maps.Polyline(opts);
  }
}

exports.setPolylinePathImpl = function(pl, arr) {
  return function() {
    return pl.setPath(arr);
  }
}
