"use strict";

exports.newMarkerImpl = function(opts) {
  return new google.maps.Marker(opts);
}

exports.setMarkerPositionImpl = function(marker, latlng) {
  marker.setPosition(latlng);
  return;
}