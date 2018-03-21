"use strict";

exports.gMapImpl = function(ele, opts) {
  return function() {
    return new google.maps.Map(ele, opts);
  }
}

exports.panToImpl = function(map, x) {
  return function() {
    map.panTo(x);
    return;
  }
}