function _slicedToArray(arr, i) { return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _unsupportedIterableToArray(arr, i) || _nonIterableRest(); }
function _nonIterableRest() { throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _iterableToArrayLimit(r, l) { var t = null == r ? null : "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (null != t) { var e, n, i, u, a = [], f = !0, o = !1; try { if (i = (t = t.call(r)).next, 0 === l) { if (Object(t) !== t) return; f = !1; } else for (; !(f = (e = i.call(t)).done) && (a.push(e.value), a.length !== l); f = !0); } catch (r) { o = !0, n = r; } finally { try { if (!f && null != t["return"] && (u = t["return"](), Object(u) !== u)) return; } finally { if (o) throw n; } } return a; } }
function _arrayWithHoles(arr) { if (Array.isArray(arr)) return arr; }
function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
import { capitalize, colors } from '../helpers.mjs';
export function buildOptions(obj) {
  var string = '{\n';
  for (var key in obj) {
    var newVal = typeof obj[key] === 'string' ? capitalize(obj[key]) : capitalize(obj[key].val);
    if (obj.hasOwnProperty(key)) {
      string += "".concat(key, ": '").concat(newVal, "',\n");
    }
  }
  return string += '}';
}
export function buildEntityFormInput(key, field) {
  switch (field.type) {
    case 'string':
      return "\n      <div class=\"item\">\n        <AdminFormField\n          type=\"text\"\n          name=\"".concat(key, "\"\n          label=\"").concat(field.label || field.name || '', "\"\n          placeholder=\"").concat(field.placeholder, "\"\n          :validation=\"searching ? '' : '").concat(field.required ? 'required' : '', "'\"\n        />\n      </div>");
    case 'enumerator':
      return "\n      <div class=\"item\">\n        <AdminFormField\n          name=\"".concat(key, "\"\n          type=\"select\"\n          label=\"").concat(field.label || field.name || '', "\"\n          placeholder=\"").concat(field.placeholder, "\"\n          :options=\"").concat(buildOptions(field.enumerators), "\"\n          :multiple=\"").concat(field.multiselect || 'searching', "\"\n          :validation=\"searching ? '' : '").concat(field.required ? 'required' : '', "'\"\n        />\n      </div>");
    case 'number':
      return "\n      <div class=\"item\">\n        <AdminFormField\n          name=\"".concat(key, "\"\n          type=\"number\"\n          min=\"").concat(field.min, "\"\n          max=\"").concat(field.max, "\"\n          label=\"").concat(field.label || field.name || '', "\"\n          placeholder=\"").concat(field.placeholder, "\"\n          :validation=\"searching ? '' : '").concat(field.required ? 'required' : '', "'\"\n          \n        />\n      </div>");
    case 'boolean':
      return "\n      <div class=\"item\">\n        <AdminFormField\n          name=\"".concat(key, "\"\n          type=\"select\"\n          label=\"").concat(field.label || field.name || '', "\"\n          placeholder=\"").concat(field.placeholder, "\"\n          :options=\"").concat(buildOptions(field.enumerators), "\"\n        />\n      </div>");
    case 'date':
      return "\n      <div class=\"item\">\n        <AdminFormField\n          name=\"".concat(key, "\"\n          type=\"select\"\n          :multiple=\"searching\"\n          label=\"").concat(field.label || field.name || '', "\"\n          :placeholder=\"searching ? 'Select house/houses' : 'Select placeholder'\"\n          :validation=\"searching ? '' : '").concat(field.required ? 'required' : '', "'\"\n          help=\"Select all that apply by holding command (macOS) or control (PC).\"\n        />\n      </div>");
    default:
      break;
  }
}
export function buildEntityFormInputs(e) {
  var keys = Object.keys(e.fields);
  var customSort = function customSort(a, b) {
    var typeA = e.fields[a].type === 'enumerator';
    var typeB = e.fields[b].type === 'enumerator';
    if (typeA === typeB) {
      return 0;
    }
    if (typeA) {
      return 1;
    }
    if (typeB) {
      return -1;
    }
  };
  keys.sort(customSort);
  return keys.map(function (key) {
    return buildEntityFormInput(key, e.fields[key]);
  }).join('');
}
export function buildEntityForm(e) {
  return "<script setup>\n    import { reset } from '@formkit/core'\n    const props = defineProps([\n      'searching',\n      'fetchFiltered".concat(capitalize(e.plural), "',\n      'createForm',\n      'clear',\n    ])\n    const { add").concat(capitalize(e.name), " } = use").concat(e.pluralL, "()\n\n    async function submit(fields) {\n      if (props.searching) {\n        await props.fetchFiltered").concat(capitalize(e.name), "s(fields)\n        return\n      }\n      const ").concat(e.name, " = add").concat(capitalize(e.name), "(fields)\n      if (").concat(e.name, ") {\n        reset('").concat(e.name, "Form')\n      }\n    }\n    </script>\n\n    <template>\n    <div class=\"relative\">\n      <FormKit\n        id=\"").concat(e.name, "Form\"\n        type=\"form\"\n        @submit=\"submit\"\n        :actions=\"false\"\n        #default=\"{ value }\"\n        :classes=\"{\n          help: 'dark:text-white',\n          message: 'text-red-500 dark:text-red-300 absolute',\n        }\"\n      >\n        <div\n          id=\"").concat(e.label, "\"\n          class=\"form-items-container grid grid-cols-4 gap-x-7 gap-y-7 px-3\"\n        >\n          ").concat(buildEntityFormInputs(e), "\n          </div>\n          <div class=\"flex flex-row space-x-1 mt-6\">\n            <FormKit\n              type=\"button\"\n              label=\"Clear\"\n              @click=\"clear\"\n              :classes=\"{\n                outer: 'bg-red-500 rounded basis-1/4',\n                input:\n                  'flex flex-grow justify-center text-white dark:text-white p-3',\n                wrapper: 'flex flex-grow text-center',\n              }\"\n            />\n            <FormKit\n              type=\"submit\"\n              :disabled=\"disabled\"\n              :classes=\"{\n                outer: 'bg-green-500 rounded basis-3/4',\n                input:\n                  'flex flex-grow justify-center text-white dark:text-white p-3',\n                wrapper: 'flex flex-grow text-center',\n              }\"\n            >\n              Submit\n            </FormKit>\n        </div>\n      </FormKit>\n      </div>\n    </template>");
}
export function buildForm(e) {
  return "<script setup>\n      const props = defineProps(['searching', 'fetchFiltered".concat(capitalize(e.plural), "', 'createForm'])\n      const num = ref(0)\n      const clearForm = () => {\n        num.value = num.value + 1\n      }\n      </script>\n      <template>\n        <div\n          class=\"w-100 dark:bg-neutral-950 p-3 main-container\"\n          :class=\"{ hidden: !searching && !createForm }\"\n        >\n          <TransitionGroup\n            name=\"fade-move\"\n            class=\"container\"\n          >\n            <div :key=\"num\">\n              <Admin").concat(e.pluralL, "EntityForm\n                :clear=\"clearForm\"\n                :searching=\"searching\"\n                :fetchFiltered").concat(e.pluralL, "=\"fetchFiltered").concat(e.pluralL, "\"\n              />\n            </div>\n          </TransitionGroup>\n        </div>\n      </template>");
}
export function buildTableRows(e) {
  var string = '';
  var _iterator = _createForOfIteratorHelper(e.tableFields),
    _step;
  try {
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var _e$fields$key;
      var key = _step.value;
      var fieldType = (_e$fields$key = e.fields[key]) === null || _e$fields$key === void 0 ? void 0 : _e$fields$key.type;
      if (key === 'email') {
        string += "\n      <th class=\"flex gap-3 px-3 py-4 font-normal text-gray-900\">\n      <div class=\"relative h-10 w-10\">\n        <img\n          :src=\"".concat(e.name, ".avatarUrl || 'https://i.pravatar.cc/150?img=4'\"\n          class=\"h-full rounded-full object-cover object-center\"\n        />\n        <span\n          class=\"absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white\"\n        />\n      </div>\n      <div class=\"text-sm\">\n        <span\n          v-text=\"").concat(e.name, ".firstName\"\n          class=\"font-medium text-gray-700 dark:text-white\"\n        />\n        <div>\n          <span\n            v-text=\"").concat(e.name, ".email\"\n            class=\"text-gray-400\"\n          />\n        </div>\n      </div>\n    </th>");
      } else if (key !== 'firstName') {
        if (fieldType == 'enumerator' && e.fields[key].multiselect) {
          string += "<td\n          class=\"px-6 py-4\"\n          v-if=\"".concat(e.name, ".").concat(key, "\"\n        >\n          <div class=\"flex justify-center gap-1\">\n            <span\n              v-for=\"(item, idx) of ").concat(e.name, ".").concat(key, "\"\n              v-text=\"item\"\n              class=\"inline-flex items-center gap-1 rounded-full px-2 py-1 text-xs font-semibold text-white\"\n              :class=\"get").concat(capitalize(key), "Color('bg', item)\"\n            />\n          </div>\n        </td>");
        } else if (fieldType == 'enumerator') {
          string += "<td\n          class=\"px-6 py-4\"\n          v-if=\"".concat(e.name, ".").concat(key, "\"\n        >\n          <span\n            class=\"inline-flex items-center gap-1 rounded-full bg-gray-100 dark:bg-slate-900 px-2 py-1 text-xs font-semibold\"\n            :class=\"get").concat(capitalize(key), "Color('text', ").concat(e.name, ".").concat(key, ")\"\n          >\n            <span\n              class=\"h-1.5 w-1.5 rounded-full\"\n              :class=\"get").concat(capitalize(key), "Color('bg', ").concat(e.name, ".").concat(key, ")\"\n            />\n            <span v-text=\"").concat(e.name, ".").concat(key, "\" />\n          </span>\n        </td>");
        } else {
          string += "\n        <td class=\"px-3 py-4\">\n          <div class=\"text-sm\">\n            <div\n              v-text=\"".concat(e.name, ".").concat(key, "\"\n              class=\"font-medium text-gray-700 dark:text-white\"\n            />\n          </div>\n        </td>");
        }
      }
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
  return string;
}
export function buildTabs(e, prop) {
  // [ ] Add custom enumerator color for each item.
  var houseKeys = Object.entries(e.fields[prop].enumerators);
  var keyMap = {};
  houseKeys.forEach(function (_ref, idx) {
    var _ref2 = _slicedToArray(_ref, 2),
      k = _ref2[0],
      v = _ref2[1];
    return keyMap[k] = colors[idx];
  });
  function makeKey(k, v) {
    return "".concat(k.toLowerCase(), ": `${field}-").concat(v.color ? v.color : keyMap[k], "-${weight}`,");
  }
  return "{".concat(houseKeys.map(function (_ref3) {
    var _ref4 = _slicedToArray(_ref3, 2),
      k = _ref4[0],
      v = _ref4[1];
    return makeKey(k, v);
  }).join(''), "}");
}
export function buildTableHeaders(e) {
  var string = '';
  var _iterator2 = _createForOfIteratorHelper(e.tableFields),
    _step2;
  try {
    for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
      var key = _step2.value;
      if (key == 'firstName') continue;
      string += "<th\n      scope=\"col\"\n      @click=\"toggleSort('".concat(key, "')\"\n      class=\"px-6 py-4 font-medium text-gray-500 dark:text-gray-600 truncate\"\n    >\n      ").concat(key, " <span v-text=\"getSortingIcon('").concat(key, "')\" />\n    </th>");
    }
  } catch (err) {
    _iterator2.e(err);
  } finally {
    _iterator2.f();
  }
  return string;
}
export var buildSortFields = function buildSortFields(e) {
  var string = '{';
  for (var key in e.fields) {
    if (Object.hasOwnProperty.call(e.fields, key)) {
      string += "".concat(key, ": ref('ASC'),");
    }
  }
  return string + '}';
};
export function buildEnumeratorHelpers(e) {
  var enums = e.tableFields.filter(function (name) {
    var _e$fields$name;
    return ((_e$fields$name = e.fields[name]) === null || _e$fields$name === void 0 ? void 0 : _e$fields$name.type) === 'enumerator';
  });
  return enums.map(function (item) {
    return "function get".concat(capitalize(item), "Color(field, key) {\n          ").concat(e.name == 'wizard' && item == 'house' ? 'key.toLowerCase()' : '', "\n          const weight = field == 'bg' ? 500 : 400\n          const kolors = ").concat(buildTabs(e, item), "\n            return {\n              [kolors[key]]: true,\n            }\n        }");
  }).join('');
}