"use strict";

exports.getDraggableImpl = function(draw) {
  return draw.getDraggable();
};

exports.getEditableImpl = function(draw) {
  return draw.getEditable();
};

exports.getPathImpl = function(draw) {
  return draw.getPath();
};

exports.getVisibleImpl = function(draw) {
  return draw.getVisible();
};

exports.setDraggableImpl = function(draw, draggable) {
  return function() {
    draw.setDraggable(draggable);
    return draw;
  };
};

exports.setEditableImpl = function(draw, editable) {
  return function() {
    draw.setEditable(editable);
    return draw;
  };
};

exports.setPathImpl = function(draw, path) {
  return function() {
    draw.setPath(path);
    return draw;
  };
};

exports.setVisibleImpl = function(draw, visible) {
  return function() {
    draw.setVisible(visible);
    return draw;
  };
};
