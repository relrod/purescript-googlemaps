"use strict";

exports.newWindowImpl = function(opts){
  return new google.maps.InfoWindow(opts);
}

exports.openWindowImpl = function(iw, map, marker) {
  iw.open(map, marker);
  return;
}