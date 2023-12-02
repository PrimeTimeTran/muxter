"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const LMS_js_1 = require("./LMS.js");
const Mint_js_1 = require("./Mint.js");
const Forum_js_1 = require("./Forum.js");
const Social_js_1 = require("./Social.js");
const Delivery_js_1 = require("./Delivery.js");
const RealEstate_js_1 = require("./RealEstate.js");
const seeds = {
    lms: LMS_js_1.LMS,
    mint: Mint_js_1.Mint,
    forum: Forum_js_1.Forum,
    social: Social_js_1.Social,
    delivery: Delivery_js_1.Delivery,
    realestate: RealEstate_js_1.RealEstate,
};
exports.default = seeds;
