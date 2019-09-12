"use strict";

exports.newPolylineImpl = function(opts) {
  return function() {
    return new google.maps.Polyline(opts);
  }
}

exports.deletePolylineImpl = function(poly) {
  return function() {
    poly = null;
    return;
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
