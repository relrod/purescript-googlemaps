"use strict";

exports.newInfoWindowImpl = function(opts) {
  return function() {
    return new google.maps.InfoWindow(opts);
  }
}

exports.openInfoWindowImpl = function(iw, map, marker) {
  return function() {
    iw.open(map, marker);
    return;
  }
}