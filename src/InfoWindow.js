"use strict";

exports.newInfoWindowImpl = function(opts){
  return new google.maps.InfoWindow(opts);
}

exports.openInfoWindowImpl = function(iw, map, marker) {
  iw.open(map, marker);
  return;
}