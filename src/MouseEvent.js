"use-strict";

exports.stopMouseEventImpl = function (mouseEvent) {
  return function () {
    mouseEvent.stop();
    return;
  }
}

exports.getLatLngImpl = function (mouseEvent) {
  return mouseEvent.getLatLng();
}
