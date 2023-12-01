function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function ownKeys(e, r) { var t = Object.keys(e); if (Object.getOwnPropertySymbols) { var o = Object.getOwnPropertySymbols(e); r && (o = o.filter(function (r) { return Object.getOwnPropertyDescriptor(e, r).enumerable; })), t.push.apply(t, o); } return t; }
function _objectSpread(e) { for (var r = 1; r < arguments.length; r++) { var t = null != arguments[r] ? arguments[r] : {}; r % 2 ? ownKeys(Object(t), !0).forEach(function (r) { _defineProperty(e, r, t[r]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : ownKeys(Object(t)).forEach(function (r) { Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r)); }); } return e; }
function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
function _slicedToArray(arr, i) { return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _unsupportedIterableToArray(arr, i) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t["return"] && (u = t["return"](), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(arr) { if (Array.isArray(arr)) return arr; }
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return _typeof(key) === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (_typeof(input) !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (_typeof(res) !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
import path from 'path';
import { camelize, getType, capitalize } from '../helpers.mjs';
export var ModelBuilder = /*#__PURE__*/function () {
  function ModelBuilder(entities, _options) {
    var _this = this;
    _classCallCheck(this, ModelBuilder);
    _defineProperty(this, "buildEntities", function () {
      _this.entities.map(function (e) {
        _this.e = e;
        _this.buildModel();
      });
    });
    _defineProperty(this, "buildModel", function () {
      var e = _this.e,
        options = _this.options,
        _this$e = _this.e,
        name = _this$e.name,
        label = _this$e.label,
        attributes = _this$e.attributes;
      var fields;
      if (name == 'wizard') {
        fields = _this.e.fields;
      } else {
        fields = _this.buildTransformation(attributes);
      }
      var _this$generateFields = _this.generateFields(fields, name),
        _this$generateFields2 = _slicedToArray(_this$generateFields, 2),
        values = _this$generateFields2[0],
        enumerators = _this$generateFields2[1];
      var buildImports = function buildImports() {
        if (options.typescript) {
          return "\n        import { z } from 'zod'\n        import { Model, Document } from 'mongoose'\n        import { defineMongooseModel } from '#nuxt/mongoose'\n        ";
        }
        return "\n      import mongoose, { Schema } from 'mongoose'\n      ";
      };
      var buildEntitySchema = function buildEntitySchema() {
        if (!options.typescript) return '';
        return "export const ".concat(e.label, "Schema = z.object({\n        ").concat(values, "\n      })");
      };
      var buildZodType = function buildZodType() {
        if (!options.typescript) return '';
        return "export type ".concat(label, "Type = z.infer<typeof ").concat(label, "Schema>");
      };
      var buildNuxtMongoose = function buildNuxtMongoose() {
        if (options.typescript) {
          return "\n        type Combined = ".concat(label, "Type & typeof Model & Document\n        const ").concat(name, ": ").concat(label, "Type = {}\n        export const ").concat(label, " = defineMongooseModel('").concat(label, "', {\n          name: '").concat(label, "',\n          schema: { ...").concat(name, " },\n          options: {},\n          hooks(schema) {\n            schema.pre('find', function (this: Combined, next) {\n              console.log('").concat(label, " hook pre find')\n              next()\n            })\n            schema.post('find', function (docs, next) {\n              console.log('").concat(label, " hook post find')\n              next()\n            })\n          },\n        })");
        }
        return "export const ".concat(label, " = mongoose.model('").concat(label, "', {\n        ").concat(_this.buildMongoose(e), "\n      })");
      };
      var content = "\n      ".concat(buildImports(), "\n      ").concat(_this.buildEnumerators(name, enumerators), "\n      ").concat(buildEntitySchema(), "\n      ").concat(buildZodType(), "\n      ").concat(buildNuxtMongoose(), "\n    ");
      return content;
    });
    _defineProperty(this, "generateFields", function (fields, name) {
      var keys = Object.keys(fields);
      var values = [];
      var enumerators = [];
      for (var _i = 0, _keys = keys; _i < _keys.length; _i++) {
        var key = _keys[_i];
        var _fields$key = fields[key],
          type = _fields$key.type,
          required = _fields$key.required;
        if (type === 'enumerator' || type === 'enumeratorMulti') {
          var strings = void 0;
          if (typeof fields[key].enumerators[0] !== 'string') {
            strings = Object.keys(fields[key].enumerators).map(function (k) {
              return k;
            });
          }
          enumerators.push({
            key: key,
            enumerators: strings || fields[key].enumerators
          });
        }
        values.push("".concat(camelize(key), ": ").concat(getType(name, type, key)).concat(!required ? '.optional()' : ''));
      }
      return [values, enumerators];
    });
    _defineProperty(this, "buildEnumerators", function (name, items) {
      var enumeratorKeys = [];
      var _iterator = _createForOfIteratorHelper(items),
        _step;
      try {
        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          var obj = _step.value;
          var strings = [];
          for (var key in obj.enumerators) {
            var safe = Object.hasOwnProperty.call(obj.enumerators, key);
            if (safe) {
              var element = obj.enumerators[key];
              strings.push("".concat(element, ": '").concat(element, "'"));
            }
          }
          var string = "\n        ".concat(obj.key, ": {\n          ").concat(strings.join(','), "\n        },\n      ");
          enumeratorKeys.push(string);
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }
      var keyValue = "export const ".concat(name, "Enumerators = {\n    ").concat(enumeratorKeys.join(''), "\n  }");
      return keyValue;
    });
    this.entities = entities;
    this.options = _options;
    this.path = this.getModelPath();
  }
  _createClass(ModelBuilder, [{
    key: "getModelPath",
    value: function getModelPath() {
      // Get the current working directory
      var currentWorkingDir = process.cwd();

      // Calculate the path to the Models directory
      return path.join(currentWorkingDir, 'src', 'Models');
    }
  }, {
    key: "buildTransformation",
    value: function buildTransformation(attributes) {
      var fields = {};
      if (attributes) {
        attributes.forEach(function (f) {
          if (f.name !== '_id') {
            fields[f.name] = _objectSpread({}, f);
            delete fields[f.name]._id;
            if (f.type === 'enumerator' || f.type === 'enumeratorMulti') {
              var _f$options;
              fields[f.name].enumeratorType = 'string';
              fields[f.name].enumerators = {};
              var options = (_f$options = f.options) === null || _f$options === void 0 ? void 0 : _f$options.split(',');
              if (options) {
                options.forEach(function (o) {
                  fields[f.name].enumerators[o] = {
                    val: o,
                    color: null
                  };
                });
              }
            }
          }
        });
        this.e.fields = fields;
        this.e.tableFields = Object.keys(fields);
      }
      return fields;
    }
  }, {
    key: "getType",
    value: function getType(type) {
      switch (type) {
        case 'Decimal':
          return 'Schema.Types.Decimal128';
        case 'Relation':
          return 'Schema.Types.ObjectId';
        case 'String':
          return 'String';
        case 'Boolean':
          return 'Boolean';
        case 'Date':
          return 'Date';
        case 'DateTime':
          return 'Date';
        case 'Number':
          return 'Number';
        case 'Integer':
          return 'BigInt';
      }
    }
  }, {
    key: "buildMongoose",
    value: function buildMongoose() {
      var relationMap = {
        otm: function otm(relation) {
          return "{ type: Schema.Types.ObjectId, ref: \"".concat(relation.name, "\" }");
        },
        mto: function mto(relation) {
          return "[{ type: Schema.Types.ObjectId, ref: '".concat(relation.name, "' }]");
        }
      };
      function buildRequired(required) {
        return "".concat(required != undefined ? "required: ".concat(required, ",") : '');
      }
      var values = [];
      for (var f in this.e.fields) {
        var field = this.e.fields[f];
        var type = field.type,
          required = field.required,
          enumeratorType = field.enumeratorType,
          relation = field.relation,
          name = field.name;
        var fieldName = name || f;
        if (type === 'relation') {
          // 1:1, 1:many, many:1, many:many
          // Need to support all the different relationships.
          // Guarding against null values for relationships
          var fn = relationMap[type];
          if (fn) {
            var item = "".concat(fieldName, ": {\n              ").concat(buildRequired(required), "\n              type: ").concat(fn(relation), ",\n            }");
            values.push(item);
          }
        } else if (type == 'enumerator' || type == 'enumeratorMulti') {
          var _item = "".concat(fieldName, ": {\n          ").concat(required != undefined ? "required: ".concat(required, ",") : '', "\n          type: [\n            ").concat(capitalize(enumeratorType), "\n          ],\n        }");
          values.push(_item);
        } else {
          // Because FE entities dont match hardcoded entities 100% yet.
          var _item2 = "".concat(fieldName, ": {\n          type: ").concat(this.getType(capitalize(type)), ",\n          ").concat(required != undefined ? "required: ".concat(required, ",") : '', "\n        }");
          values.push(_item2);
        }
      }
      return values.join(',');
    }
  }]);
  return ModelBuilder;
}();