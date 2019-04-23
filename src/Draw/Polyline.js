"use strict";

exports.newPolylineImpl = function(opts) {
  return function() {
    return new google.maps.Polyline(opts);
  }
}

exports.deletePolylineImpl = function(poly) {
  return function() {
    poly = null;
    return;
  }
}

exports.getMapImpl = function(disp) {
  return disp.getMap();
}

exports.setMapImpl = function(disp, map) {
  return function() {
    disp.setMap(map);
    return disp;
  }
}

exports.setOptionsImpl = function(poly, options) {
  return function() {
    poly.setOptions(options);
    return poly;
  }
}

// SAME AS Polygon

exports.getDraggableImpl = function(poly) {
  return poly.getDraggable();
}

exports.getEditableImpl = function(poly) {
  return poly.getEditable();
}

exports.getPathImpl = function(poly) {
  return poly.getPath();
}

exports.getVisibleImpl = function(poly) {
  return poly.getVisible();
}

exports.setDraggableImpl = function(poly, draggable) {
  return function() {
    poly.setDraggable(draggable);
    return poly;
  }
}

exports.setEditableImpl = function(poly, editable) {
  return function() {
    poly.setEditable(editable);
    return poly;
  }
}

exports.setPathImpl = function(poly, path) {
  return function() {
    poly.setPath(path);
    return poly;
  }
}

exports.setVisibleImpl = function(poly, visible) {
  return function() {
    poly.setVisible(visible);
    return poly;
  }
}
