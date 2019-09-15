"use strict";

exports.containsLocationImpl = function(latLng, polygon) {
  return google.maps.geometry.poly.containsLocation(latLng, polygon);
}

exports.isLocationOnEdgeImpl = function(latLng, poly) {
  return google.maps.geometry.poly.isLocationOnEdge(latLng, poly);
}
