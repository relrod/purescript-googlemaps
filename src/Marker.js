"use strict";

exports.newMarkerImpl = function(opts) {
  return function() {
    return new google.maps.Marker(opts);
  }
}

exports.delMarkerImpl = function(marker) {
  return function() {
    marker.setMap(null);
    return;
  }
}

exports.setMarkerPositionImpl = function(marker, latlng) {
  return function() {
    marker.setPosition(latlng);
    return;
  }
}

exports.undefined = undefined;