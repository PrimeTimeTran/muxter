function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function ownKeys(e, r) { var t = Object.keys(e); if (Object.getOwnPropertySymbols) { var o = Object.getOwnPropertySymbols(e); r && (o = o.filter(function (r) { return Object.getOwnPropertyDescriptor(e, r).enumerable; })), t.push.apply(t, o); } return t; }
function _objectSpread(e) { for (var r = 1; r < arguments.length; r++) { var t = null != arguments[r] ? arguments[r] : {}; r % 2 ? ownKeys(Object(t), !0).forEach(function (r) { _defineProperty(e, r, t[r]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : ownKeys(Object(t)).forEach(function (r) { Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r)); }); } return e; }
function _defineProperty(obj, key, value) { key = _toPropertyKey(key); if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }
function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, _toPropertyKey(descriptor.key), descriptor); } }
function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, "prototype", { writable: false }); return Constructor; }
function _toPropertyKey(arg) { var key = _toPrimitive(arg, "string"); return _typeof(key) === "symbol" ? key : String(key); }
function _toPrimitive(input, hint) { if (_typeof(input) !== "object" || input === null) return input; var prim = input[Symbol.toPrimitive]; if (prim !== undefined) { var res = prim.call(input, hint || "default"); if (_typeof(res) !== "object") return res; throw new TypeError("@@toPrimitive must return a primitive value."); } return (hint === "string" ? String : Number)(input); }
import path from 'path';
import { capitalize } from '../helpers.mjs';
import { buildEnumeratorHelpers, buildTableHeaders, buildSortFields, buildTableRows, buildEntityForm as _buildEntityForm, buildForm as _buildForm } from './AdminHelpers.mjs';
export var AdminBuilder = /*#__PURE__*/function () {
  function AdminBuilder(entities, options, zip) {
    _classCallCheck(this, AdminBuilder);
    this.entities = entities;
    this.options = options;
    this.zip = zip;
    this.root = path.join('nuxt/components/Admin');
    this.buildAdminDirectories(zip);
  }
  _createClass(AdminBuilder, [{
    key: "buildAdminDirectories",
    value: function buildAdminDirectories(zip) {
      var _this = this;
      this.entities.map(function (e) {
        var name = "".concat(_this.root, "/").concat(e.pluralL);
        zip.folder(name);
      });
    }
  }, {
    key: "buildEntities",
    value: function buildEntities() {
      var _this2 = this;
      this.entities.map(function (e) {
        _this2.e = e;
        if (e.name !== 'wizard') {
          _this2.e.fields = {};
          var fields = {};
          var attributes = _this2.e.attributes;
          if (attributes) {
            attributes.forEach(function (f) {
              if (f.name !== '_id') {
                fields[f.name] = _objectSpread({}, f);
                var field = fields[f.name];
                delete field._id;
                if (f.type === 'enumerator' || f.type === 'enumeratorMulti') {
                  field.enumeratorType = 'string';
                  field.enumerators = {};
                  var options = f.options.split(',');
                  options.forEach(function (o) {
                    field.enumerators[o] = {
                      val: o,
                      color: null
                    };
                  });
                }
                field.label = f.label;
                field.type = f.type;
                field.placeholder = f.label;
              }
            });
          }
          _this2.e.tableFields = Object.keys(fields);
        }
        _this2.path = "".concat(_this2.root, "/").concat(e.label);
        _this2.buildIndexPage();
        _this2.buildTable();
        _this2.buildForm();
        _this2.buildEntityForm();
        _this2.buildEntityUseHook();
      });
    }
  }, {
    key: "buildIndexPage",
    value: function buildIndexPage() {
      var content = "\n      <script setup>\n        definePageMeta({\n          layout: 'admin-layout',\n        })\n\n        useHead({\n          title: '".concat(this.e.label, " | Turboship Admin',\n          meta: [{ name: 'description', content: 'Great admin panels' }],\n        })\n\n        let tab = ref(0)\n\n        const changeTab = (i) => {\n          tab.value = i\n        }\n\n        const activeClasses = (currentTab) => {\n          if (currentTab == tab.value)\n            return 'text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500 opacity-100 hover:opacity-75'\n        }\n\n        let searching = ref(false)\n\n        const toggleSearch = () => {\n          changeTab(0)\n          searching.value = !searching.value\n        }\n\n        const tabs = [\n          {\n            idx: 0,\n            label: 'Records',\n            component: 'table',\n          },\n          {\n            idx: 1,\n            label: 'Overview',\n            component: 'overview',\n          },\n          {\n            idx: 2,\n            label: 'Create/New',\n            component: 'form',\n          },\n          {\n            idx: 3,\n            label: 'Settings',\n            component: 'settings',\n          },\n        ]\n        </script>\n\n        <template>\n          <div class=\"flex flex-col min-w-full max-h-full overflow-y-none overflow-y-hidden\">\n            <div class=\"relative flex flex-col\">\n              <div\n                class=\"text-sm bg-white dark:bg-slate-950 w-screen z-10 text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700\"\n              >\n                <div class=\"flex\">\n                  <div class=\"mr-16\">\n                    <div\n                      @click=\"toggleSearch\"\n                      class=\"flex p-4 opacity-75 hover:opacity-100\"\n                    >\n                      <p class=\"mr-3 text-md\">").concat(this.e.label, "</p>\n                      <div>\n                        <FontAwesomeIcon\n                          class=\"text-gray-400 mr-2\"\n                          v-bind:icon=\"\n                            searching\n                              ? 'fa-solid fa-circle-xmark'\n                              : 'fa-solid fa-magnifying-glass'\n                          \"\n                        />\n                      </div>\n                    </div>\n                  </div>\n                  <div\n                    :key=\"tab\"\n                    @click=\"() => changeTab(tab.idx)\"\n                    v-for=\"tab of tabs\"\n                    class=\"p-4 border-b-2 border-transparent rounded-t-lg opacity-75 hover:opacity-100\"\n                    :class=\"activeClasses(tab.idx)\"\n                  >\n                    <span v-text=\"tab.label\" />\n                  </div>\n                </div>\n              </div>\n            </div>\n            <div\n              class=\"min-w-full min-h-full pt-2\"\n              :class=\"{\n                hidden: tab != 0,\n              }\"\n            >\n              <Admin").concat(this.e.pluralL, "Table :searching=\"searching\" />\n            </div>\n            <div\n              class=\"min-w-full min-h-full pt-1\"\n              :class=\"{\n                hidden: tab != 1,\n              }\"\n            >\n              <AdminWizardsOverview />\n            </div>\n            <div\n              class=\"min-w-full min-h-full pt-1\"\n              :class=\"{\n                hidden: tab != 2,\n              }\"\n            >\n              <Admin").concat(this.e.pluralL, "Form :createForm=\"true\" />\n            </div>\n            <div\n              class=\"min-w-full min-h-full pt-1\"\n              :class=\"{\n                hidden: tab != 3,\n              }\"\n            >\n              <h1>Contacts</h1>\n            </div>\n            <div\n              class=\"min-w-full min-h-full pt-1\"\n              :class=\"{\n                hidden: tab != 3,\n              }\"\n            >\n              <h1 class=\"text-gray-400\">Settings</h1>\n            </div>\n          </div>\n        </template>\n    ");
      return content;
    }
  }, {
    key: "buildTable",
    value: function buildTable() {
      var e = this.e;
      var content = "\n    <script setup>\n      const props = defineProps(['searching'])\n\n      const { ".concat(e.plural, ", sort, meta, fetchPage, fetchFiltered").concat(e.pluralL, " } = use").concat(e.pluralL, "()\n\n      const sortFields = reactive(").concat(buildSortFields(e), ")\n\n      function getSortingIcon(field) {\n        const order = sortFields[field]\n        return order === 'ASC' ? '\u25BC' : '\u25B2'\n      }\n\n      function toggleSort(field) {\n        sortFields[field] = sortFields[field] === 'ASC' ? 'DESC' : 'ASC'\n        sort(field, sortFields[field])\n      }\n      ").concat(buildEnumeratorHelpers(e), "\n      </script>\n      <template>\n        <div\n          class=\"flex flex-col overflow-scroll justify-center rounded-lg border border-gray-200 dark:border-gray-600 shadow-md pb-12\"\n        >\n          <Admin").concat(e.pluralL, "Form\n            :searching=\"searching\"\n            :fetchFiltered").concat(e.pluralL, "=\"fetchFiltered").concat(e.pluralL, "\"\n          />\n          <table\n            class=\"overflow-x-auto mb-12 border-collapse dark:text-white text-left text-sm text-gray-500 dark:bg-slate-950\"\n          >\n            <thead class=\"bg-gray-200 dark:bg-neutral-950\">\n              <tr class=\"dark:text-black\">\n                ").concat(buildTableHeaders(e), "\n              </tr>\n            </thead>\n            <tbody\n              class=\"divide-y divide-gray-300 border-t border-gray-300 dark:divide-gray-800 dark:border-gray-600\"\n            >\n              <tr\n                :key=\"").concat(e.name, "._id\"\n                v-for=\"").concat(e.name, " in ").concat(e.plural, "\"\n                class=\"hover:bg-gray-200 odd:bg-neutral-100 even:bg-neutral-50 dark:hover:bg-neutral-950 dark:border-t-gray-600 odd:dark:bg-neutral-950 even:dark:bg-neutral-950\"\n              >\n                ").concat(buildTableRows(e), "\n              </tr>\n            </tbody>\n          </table>\n          <AdminFormPagination :meta=\"meta\" :fetchPage=\"fetchPage\" />\n        </div>\n      </template>\n    ");
      return content;
    }
  }, {
    key: "buildForm",
    value: function buildForm() {
      var content = _buildForm(this.e);
      return content;
    }
  }, {
    key: "buildEntityForm",
    value: function buildEntityForm() {
      var content = _buildEntityForm(this.e);
      return content;
    }
  }, {
    key: "buildEntityUseHook",
    value: function buildEntityUseHook() {
      var apiUrl = "`${apiUrl}/".concat(this.e.plural, "`");
      var capitalized = capitalize(this.e.plural);
      var content = "\n    import { ref } from 'vue'\n    import { useFetch } from '@vueuse/core'\n\n    export function use".concat(capitalized, "() {\n      const { apiUrl } = useAPI()\n      const baseURL = ").concat(apiUrl, "\n      let ").concat(this.e.plural, " = ref([])\n      let params = ref('')\n      let meta = reactive({\n        page: ref(1),\n        limit: ref(10),\n        total: ref(0),\n        offset: ref(0),\n        pageCount: ref(0),\n        totalRecords: ref(0),\n      })\n\n      ").concat(this.generateAdd(), "\n      ").concat(this.generateOnMount(), "\n      ").concat(this.generateFetch(), "\n      ").concat(this.generatePaginationString(), "\n      ").concat(this.generateFetchPage(), "\n      ").concat(this.generateSort(), "\n      return {\n        ").concat(this.e.plural, ",\n        sort,\n        fetchPage,\n        meta,\n        add").concat(this.e.label, ",\n        fetchFiltered").concat(this.e.label, "s,\n      }\n    }");
      return content;
    }
    // buildEntityUseQueryHook() {
    //   const content = buildQueryHook(this.e)
    //   return content
    // }
  }, {
    key: "generateAdd",
    value: function generateAdd() {
      return "const add".concat(this.e.label, " = async (fields) => {\n      try {\n        const { data, error } = await useFetch(baseURL, {\n          method: 'POST',\n          headers: {\n            'Content-Type': 'application/json',\n          },\n          body: JSON.stringify(fields),\n        })\n        if (!error.value) {\n          const ").concat(this.e.name, " = JSON.parse(data.value)\n          ").concat(this.e.plural, ".value.push(").concat(this.e.name, ")\n          toastEm('").concat(this.e.label, " created')\n          return ").concat(this.e.name, "\n        }\n      } catch (error) {\n        console.error({ error })\n      }\n    }");
    }
  }, {
    key: "generateOnMount",
    value: function generateOnMount() {
      return "onBeforeMount(async () => {\n      const { data, error } = await useFetch(\n        baseURL + `?page=${meta.page}&limit=${meta.limit}`\n      )\n      if (!error.value) {\n        const val = JSON.parse(data.value)\n        Object.assign(meta, val.meta)\n        ".concat(this.e.plural, ".value = val?.data\n      }\n    })");
    }
  }, {
    key: "generateFetch",
    value: function generateFetch() {
      return "const fetchFiltered".concat(this.e.pluralL, " = async (fields) => {\n      meta.page = 1\n      const queryParams = new URLSearchParams(Object.entries(fields)).toString()\n      params.value = queryParams\n\n      const url = makeApiQueryString(\n        apiUrl + `/").concat(this.e.plural, "?page=${meta.page}&limit=${meta.limit}`,\n        fields\n      )\n      try {\n        let { data, error } = await useFetch(url)\n        if (!error.value) {\n          const val = JSON.parse(data.value)\n          meta.page = val.meta.page\n          meta.totalRecords = val.meta.totalRecords\n          Object.assign(meta, val.meta)\n          ").concat(this.e.plural, ".value = val?.data\n        } else {\n          console.error('Error fetching ").concat(this.e.plural, ":', error.value)\n        }\n      } catch (error) {\n        console.error('Unexpected error:', error)\n      }\n    }");
    }
  }, {
    key: "generatePaginationString",
    value: function generatePaginationString() {
      return "const getPaginationString = (diff) => {\n    let nextPage = meta.page + diff\n    if (diff == -10) nextPage = 1\n    if (diff == 10) nextPage = meta.pageCount\n    return [\n      `/".concat(this.e.plural, "?page=${nextPage}&limit=${meta.limit}${\n        params.value ? '&' + params.value : ''\n      }`,\n      nextPage,\n    ]}");
    }
  }, {
    key: "generateFetchPage",
    value: function generateFetchPage() {
      return "const fetchPage = async (diff) => {\n      let [str, nextPage] = getPaginationString(diff)\n\n      const url = makeApiQueryString(apiUrl + str, {})\n      try {\n        let { data, error } = await useFetch(url)\n        if (!error.value) {\n          const val = JSON.parse(data.value)\n          meta.page = nextPage\n          Object.assign(meta, val.meta)\n          ".concat(this.e.plural, ".value = val?.data\n        } else {\n          console.error('Error fetching ").concat(this.e.plural, ":', error.value)\n        }\n      } catch (error) {\n        console.error('Unexpected error:', error)\n      }\n    }");
    }
  }, {
    key: "generateSort",
    value: function generateSort() {
      return "\n      const sort = (field, direction) => {\n        if (direction === 'ASC') {\n          ".concat(this.e.plural, ".value = ").concat(this.e.plural, ".value.sort((a, b) =>\n            (a[field] ?? '') > (b[field] ?? '') ? 1 : -1\n          )\n        } else if (direction === 'DESC') {\n          ").concat(this.e.plural, ".value = ").concat(this.e.plural, ".value.sort((a, b) =>\n            (a[field] ?? '') > (b[field] ?? '') ? -1 : 1\n          )\n        }\n      }\n    ");
    }
  }], [{
    key: "buildAside",
    value: function buildAside(entities) {
      function buildAsideItems() {
        return entities.map(function (e) {
          return "<p\n          class=\"text-lg truncate text-gray-500 dark:text-white hover:text-green-400 dark:hover:text-green-400\"\n        >\n          <a href=\"/admin/".concat(e.plural, "\">").concat(e.label, "</a>\n        </p>");
        });
      }
      return "<script setup>\n      const { isOpen, toggleOpen } = useToggleOpen()\n      </script>\n\n      <template>\n        <aside\n          :class=\"isOpen ? 'w-64' : 'w-26'\"\n          class=\"hidden sm:flex overflow-y-scroll h-screen z-30 ease-in-out transition-all duration-300 bg-white dark:bg-neutral-950 border-r-2 dark:border-r-zinc-800\"\n        >\n          <div\n            class=\"flex px-3\"\n            @click=\"toggleOpen\"\n          >\n            <div :class=\"{ 'menu-trigger-open': isOpen }\">\n              <div\n                class=\"menu-link-wrapper bg-white dark:bg-neutral-950 border-t-2 border-t-gray-100 dark:border-t-zinc-800 w-26\"\n                :class=\"{ 'w-64': isOpen }\"\n              >\n                <div class=\"menu-link\">\n                  <span class=\"lines\"></span>\n                </div>\n              </div>\n              <div\n                v-if=\"isOpen\"\n                class=\"pt-20\"\n              >\n                ".concat(buildAsideItems().join(), "\n              </div>\n              <div\n                v-else\n                class=\"pt-20\"\n              >\n                <div\n                  class=\"flex flex-col items-middle justify-center dark:text-white space-y-12\"\n                >\n                  <FontAwesomeIcon\n                    size=\"2x\"\n                    class=\"text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400\"\n                    icon=\"fa-solid fa-bars\"\n                  />\n                  <FontAwesomeIcon\n                    size=\"2x\"\n                    class=\"text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400\"\n                    icon=\"fa-solid fa-blog\"\n                  />\n                  <FontAwesomeIcon\n                    size=\"2x\"\n                    class=\"text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400\"\n                    icon=\"fa-solid fa-hat-wizard\"\n                  />\n                  <FontAwesomeIcon\n                    size=\"2x\"\n                    class=\"text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400\"\n                    icon=\"fa-solid fa-user\"\n                  />\n                  <FontAwesomeIcon\n                    size=\"2x\"\n                    class=\"text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400\"\n                    icon=\"fa-solid fa-address-card\"\n                  />\n                </div>\n              </div>\n            </div>\n          </div>\n        </aside>\n      </template>\n\n      <style>\n      .menu-link-wrapper {\n        cursor: pointer;\n        position: fixed;\n        left: 0px;\n        bottom: 0px;\n        height: 50px;\n      }\n\n      .menu-link {\n        height: 100%;\n        width: 65px;\n      }\n\n      .lines {\n        -moz-transition: background 0.2s ease 0.4s;\n        -o-transition: background 0.2s ease 0.4s;\n        -webkit-transition: background 0.2s ease;\n        transition: background 0.2s ease 0.4s;\n        display: block;\n        width: 100%;\n        height: 2px;\n        background: #aaa;\n        -moz-transform-origin: 50% 50%;\n        -ms-transform-origin: 50% 50%;\n        -webkit-transform-origin: 50% 50%;\n        transform-origin: 50% 50%;\n        width: 60%;\n        margin: 0 20%;\n        position: relative;\n        top: 22px;\n      }\n\n      .lines:before,\n      .lines:after {\n        display: block;\n        width: 100%;\n        height: 2px;\n        background: #aaa;\n        -moz-transform-origin: 50% 50%;\n        -ms-transform-origin: 50% 50%;\n        -webkit-transform-origin: 50% 50%;\n        transform-origin: 50% 50%;\n        position: absolute;\n        left: 0;\n        content: '';\n        -moz-transition: -moz-transform 0.2s ease 0s, width 0.2s ease 0.2s,\n          top 0.2s ease 0.4s;\n        -o-transition: -o-transform 0.2s ease 0s, width 0.2s ease 0.2s,\n          top 0.2s ease 0.4s;\n        -webkit-transition: -webkit-transform 0.2s ease, width 0.2s ease,\n          top 0.2s ease;\n        -webkit-transition-delay: 0s, 0.2s, 0.4s;\n        transition: transform 0.2s ease 0s, width 0.2s ease 0.2s, top 0.2s ease 0.4s;\n        -moz-transform-origin: 0 50%;\n        -ms-transform-origin: 0 50%;\n        -webkit-transform-origin: 0 50%;\n        transform-origin: 0 50%;\n      }\n\n      .lines:before {\n        top: -10px;\n      }\n\n      .lines:after {\n        top: 10px;\n      }\n\n      .menu-trigger-open .lines {\n        -moz-transition: background 0.2s ease 0s;\n        -o-transition: background 0.2s ease 0s;\n        -webkit-transition: background 0.2s ease;\n        -webkit-transition-delay: 0s;\n        transition: background 0.2s ease 0s;\n      }\n\n      .menu-trigger-open .lines:before,\n      .menu-trigger-open .lines:after {\n        -moz-transition: top 0.2s ease 0s, width 0.2s ease 0.2s,\n          -moz-transform 0.2s ease 0.4s;\n        -o-transition: top 0.2s ease 0s, width 0.2s ease 0.2s,\n          -o-transform 0.2s ease 0.4s;\n        -webkit-transition: top 0.2s ease, width 0.2s ease,\n          -webkit-transform 0.2s ease;\n        -webkit-transition-delay: 0s, 0.2s, 0.4s;\n        transition: top 0.2s ease 0s, width 0.2s ease 0.2s, transform 0.2s ease 0.4s;\n        top: 0;\n        width: 50%;\n      }\n\n      .menu-trigger-open .lines:before {\n        -moz-transform: rotate3d(0, 0, 1, 45deg);\n        -webkit-transform: rotate3d(0, 0, 1, 45deg);\n        transform: rotate3d(0, 0, 1, 45deg);\n      }\n\n      .menu-trigger-open .lines:after {\n        -moz-transform: rotate3d(0, 0, 1, -45deg);\n        -webkit-transform: rotate3d(0, 0, 1, -45deg);\n        transform: rotate3d(0, 0, 1, -45deg);\n      }\n    </style>");
    }
  }]);
  return AdminBuilder;
}();