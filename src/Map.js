"use strict";

exports.gMapImpl = function(ele, opts) {
  return new google.maps.Map(ele, opts);
}

exports.panToImpl = function(map, x) {
  map.panTo(x);
  return;
}