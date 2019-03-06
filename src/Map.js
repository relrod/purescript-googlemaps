"use strict";

exports.gMapImpl = function(ele, opts) {
  return function() {
    return new google.maps.Map(ele, opts);
  }
}

//exports.fitBounds = function(map, latLngBounds) {
//  return function() {
//    map.fitBounds(latLngBounds);
//    return map;
//  }
//}

//exports.getBounds = function(map) {
//  return map.getBounds();
//}

exports.getCenterImpl = function(map) {
  return map.getCenter();
}

exports.getClickableIconsImpl = function(map) {
  return map.getClickableIcons();
}

exports.getDivImpl = function(map) {
  return map.getDiv();
}

exports.getHeadingImpl = function(map) {
  return map.getHeading();
}

exports.getMapTypeIdImpl = function(map) {
  return map.getMapTypeId();
}

//exports.getProjectionImpl = function(map) {
//  return map.getProjection();
//}

//exports.getStreetViewImpl = function(map) {
//  return map.getStreetView();
//}

exports.getTiltImpl = function(map) {
  return map.getTilt();
}

exports.getZoomImpl = function(map) {
  return map.getZoom();
}

exports.panByImpl = function(map, x, y) {
  return function() {
    map.panBy(x, y);
    return map;
  }
}

exports.panToImpl = function(map, x) {
  return function() {
    map.panTo(x);
    return map;
  }
}

//exports.panToBounds = function(map, latLngBounds) {
//  return function() {
//    map.panToBounds(latLngBounds);
//    return map;
//  }
//}

exports.setClickableIconsImpl = function(map, clickable) {
  return function() {
    map.setClickableIcons(clickable);
    return map;
  }
}

exports.setHeadingImpl = function(map, heading) {
  return function() {
    map.setHeading(heading);
    return map;
  }
}

exports.setMapTypeIdImpl = function(map, mapTypeId) {
  return function() {
    map.setMapTypeId(mapTypeId);
    return map;
  }
}

exports.setOptionsImpl = function(map, options) {
  return function() {
    map.setOptions(options);
    return map;
  }
}

//exports.setStreetViewImpl = function(map, streetView) {
//  return function() {
//    map.setStreetView(streetView);
//    return map;
//  }
//}

exports.setTiltImpl = function(map, tilt) {
  return function() {
    map.setTilt(tilt);
    return map;
  }
}

exports.setZoomImpl = function(map, zoom) {
  return function() {
    map.setZoom(zoom);
    return map;
  }
}
