"use strict";

exports.newLatLngImpl = function(x, y) {
  return function() {
    return new google.maps.LatLng(x, y);
  }
}