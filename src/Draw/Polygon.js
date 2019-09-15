"use strict";

exports.newPolygonImpl = function(opts) {
  return function() {
    return new google.maps.Polygon(opts);
  }
}

exports.deletePolygonImpl = function(poly) {
  return function() {
    poly = null;
    return;
  }
}

exports.getPathsImpl = function(poly) {
  return poly.getPaths();
}

exports.setPathsImpl = function(poly, paths) {
  return function() {
    poly.setPaths(paths);
    return poly;
  }
}

exports.getMapImpl = function(disp) {
  return disp.getMap();
}

exports.setMapImpl = function(disp, map) {
  return function() {
    disp.setMap(map);
    return disp;
  }
}

exports.setOptionsImpl = function(poly, options) {
  return function() {
    poly.setOptions(options);
    return poly;
  }
}
