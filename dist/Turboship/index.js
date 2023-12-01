function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return _typeof(key) === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (_typeof(input) !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (_typeof(res) !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
import chalk from 'chalk';
import JSZip from 'jszip-sync';
import { program } from 'commander';
import Framework from './Framework.mjs';
import seeds from '../seeds/seeds.mjs';
import { prettify } from './helpers.mjs';

// 1. Make Turboship wrap JSZip
// Have Turboship use JSZip to build source files, generate zip, return it
// Impossible to format?
var Turboship = /*#__PURE__*/function () {
  function Turboship(entities) {
    _classCallCheck(this, Turboship);
    _defineProperty(this, "supportedFrameworks", ['flutter', 'nuxt', 'rn']);
    this.zip = new JSZip();
    this.entities = {};
    this.options = this.options();
    this.buildEntities(entities);
    this.setupFrameworks(entities);
  }
  _createClass(Turboship, [{
    key: "options",
    value: function options() {
      program.option('-d, --debug', 'output extra debugging').option('-l, --language <type>', 'language choice', 'js').option('-b, --backend <type>', 'backend choice', 'nuxt').option('-m, --mobile <type>', 'mobile choice', 'flutter').option('-e, --entities <letters...>', 'entities included', 'user');
      program.parse(process.argv);
      return program.opts();
    }
  }, {
    key: "buildEntities",
    value: function buildEntities() {
      var _this = this;
      var entities = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];
      var entityTemplates = ['mint', 'bank', 'lms', 'social', 'pm', 'customer'];
      var keys = Object.values(this.options.entities);
      this.entities.wizard = seeds['lms'][0];
      var chosen = keys.filter(function (k) {
        return entityTemplates.includes(k);
      });
      chosen.forEach(function (name) {
        var collection = seeds[name];
        collection.forEach(function (e) {
          _this.entities[e.name] = e;
        });
      });
      if (Object.keys(entities).length > 0) {
        entities === null || entities === void 0 || entities.forEach(function (e) {
          _this.entities[e.name] = e;
        });
      }
    }
  }, {
    key: "setupFrameworks",
    value: function setupFrameworks() {
      var _this2 = this;
      var keys = [this.options.backend];
      var frameworks = keys.filter(function (k) {
        return _this2.supportedFrameworks.includes(k);
      });
      this.entities.wizard = seeds['lms'][0];
      var _iterator = _createForOfIteratorHelper(frameworks),
        _step;
      try {
        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          var framework = _step.value;
          var fw = new Framework(framework, this.options, this.entities, this.zip);
          fw.createDirectories();
          fw.zipBaseDirectory();
          fw.build();
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }
    }
  }, {
    key: "report",
    value: function report() {
      var options = program.opts();
      console.log('\n\n');
      if (options.debug) console.log(options);
      console.log('\n\n');
      console.log(chalk.green.underline('Run Details:'));
      if (options.language) console.log(chalk['green']('language'), "- ".concat(options.language));
      if (options.backend) console.log(chalk['green']('backend'), "- ".concat(options.backend));
      if (options.mobile) console.log(chalk['green']('mobile'), "- ".concat(options.mobile));
      if (options.entities) console.log(chalk['green']('entities'), "- ".concat(options.entities));
      console.log('\n\n');
      prettify(this.options.root);
    }
  }]);
  return Turboship;
}();
export { Turboship as default };