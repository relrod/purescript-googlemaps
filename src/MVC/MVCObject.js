"use-strict";

exports.addListenerImpl = function(object, eventName, handler) {
  return function() {
    return object.addListener(eventName, function(event) {
      handler(event)();
    });
  }
}

exports.removeListenerImpl = function(listener) {
  return function() {
    listener.remove();
    return;
  }
}
