"use strict";

exports.newInfoWindowImpl = function(opts) {
  return function() {
    return new google.maps.InfoWindow(opts);
  }
}

exports.openInfoWindowImpl = function(iw, map, marker) {
  return function() {
    iw.open(map, marker);
    return iw;
  }
}

exports.closeInfoWindowImpl = function(infoWindow) {
  return function() {
    infoWindow.close();
    return infoWindow;
  }
}

exports.deleteInfoWindowImpl = function(infoWindow) {
  return function() {
    infoWindow = null;
    return;
  }
}

exports.getContentImpl = function(infoWindow) {
  return infoWindow.getContent();
}

exports.getPositionImpl = function(infoWindow) {
  return infoWindow.getPosition();
}

exports.getZIndexImpl = function(infoWindow) {
  return infoWindow.getZIndex();
}

exports.setContentImpl = function(infoWindow, content) {
  return function() {
    infoWindow.setContent(content);
    return infoWindow;
  }
}

exports.setOptionsImpl = function(infoWindow, options) {
  return function() {
    infoWindow.setOptions(options);
    return infoWindow;
  }
}

exports.setPositionImpl = function(infoWindow, latLng) {
  return function() {
    infoWindow.setPosition(latLng);
    return infoWindow;
  }
}

exports.setZIndexImpl = function(infoWindow, zIndex) {
  return function() {
    infoWindow.setZIndex(zIndex);
    return infoWindow;
  }
}
