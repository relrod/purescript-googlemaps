"use strict";

exports.newMVCArrayImpl = function() {
  return function() {
    return new google.maps.MVCArray();
  }
}

exports.pushMVCArrayImpl = function(arr, ele) {
  return function() {
    arr.push(ele);
    return;
  }
}

exports.popMVCArrayImpl = function(arr) {
  return function() {
    return arr.pop();
  }
}