"use strict";

exports.newMVCArrayImpl = function() {
  return new google.maps.MVCArray();
}

exports.pushMVCArrayImpl = function(arr, ele) {
  arr.push(ele);
  return;
}

exports.popMVCArrayImpl = function(arr) {
  return arr.pop();
}