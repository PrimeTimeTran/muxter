"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.createDirectories = createDirectories;
var _fs = _interopRequireDefault(require("fs"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }
function createDirectories(directoryPath) {
  try {
    _fs.default.mkdirSync(directoryPath, {
      recursive: true
    });
    console.log(`Directory '${directoryPath}' created successfully.`);
  } catch (err) {
    if (err.code === 'EXIST') {
      console.log(`Directory '${directoryPath}' already exists.`);
    } else {
      console.error(`Error creating directory '${directoryPath}':`, err);
    }
  }
}