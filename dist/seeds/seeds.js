"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _LMS = require("./LMS.js");
var _Mint = require("./Mint.js");
var _Forum = require("./Forum.js");
var _Social = require("./Social.js");
var _Delivery = require("./Delivery.js");
var _RealEstate = require("./RealEstate.js");
const seeds = {
  lms: _LMS.LMS,
  mint: _Mint.Mint,
  forum: _Forum.Forum,
  social: _Social.Social,
  delivery: _Delivery.Delivery,
  realestate: _RealEstate.RealEstate
};
var _default = exports.default = seeds;