"use strict";

exports.stopImpl = function (mouseEvent) {
  return function () {
    mouseEvent.stop();
    return;
  }
}

exports.getLatLngImpl = function (mouseEvent) {
  return mouseEvent.latLng;
}
