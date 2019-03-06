"use strict";

exports.newLatLngImpl = function(x, y) {
  return function() {
    return new google.maps.LatLng(x, y);
  }
}

exports.toLiteralImpl = function(latLng) {
  return latLng.toJSON();
}

exports.latImpl = function(latLng) {
  return latLng.lat();
}

exports.lngImpl = function(latLng) {
  return latLng.lng();
}

exports.toStringImpl = function(latLng) {
  return latLng.toString();
}

exports.equalsImpl = function(thisLatLng, thatLatLng) {
  return thisLatLng.equals(thatLatLng);
}
