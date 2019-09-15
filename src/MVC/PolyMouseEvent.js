"use strict";

exports.getEdgeImpl = function (polyMouseEvent) {
  return polyMouseEvent.edge;
}

exports.getPathImpl = function (polyMouseEvent) {
  return polyMouseEvent.path;
}

exports.getVertexImpl = function (polyMouseEvent) {
  return polyMouseEvent.vertex;
}
