"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AdminBuilder = void 0;
const path_1 = __importDefault(require("path"));
const helpers_js_1 = require("../helpers.js");
const AdminHelpers_js_1 = require("./AdminHelpers.js");
class AdminBuilder {
    constructor(entities, options, zip) {
        this.entities = entities;
        this.options = options;
        this.zip = zip;
        this.root = path_1.default.join('nuxt/components/Admin');
        this.buildAdminDirectories(zip);
    }
    buildAdminDirectories(zip) {
        this.entities.map((e) => {
            const name = `${this.root}/${e.pluralL}`;
            zip.folder(name);
        });
    }
    buildEntities() {
        this.entities.map((e) => {
            this.e = e;
            if (e.name !== 'wizard') {
                this.e.fields = {};
                const fields = {};
                const attributes = this.e.attributes;
                if (attributes) {
                    attributes.forEach((f) => {
                        if (f.name !== '_id') {
                            fields[f.name] = Object.assign({}, f);
                            const field = fields[f.name];
                            delete field._id;
                            if (f.type === 'enumerator' || f.type === 'enumeratorMulti') {
                                field.enumeratorType = 'string';
                                field.enumerators = {};
                                const options = f.options.split(',');
                                options.forEach((o) => {
                                    field.enumerators[o] = {
                                        val: o,
                                        color: null,
                                    };
                                });
                            }
                            field.label = f.label;
                            field.type = f.type;
                            field.placeholder = f.label;
                        }
                    });
                }
                this.e.tableFields = Object.keys(fields);
            }
            this.path = `${this.root}/${e.label}`;
            this.buildIndexPage();
            this.buildTable();
            this.buildForm();
            this.buildEntityForm();
            this.buildEntityUseHook();
        });
    }
    static buildAside(entities) {
        function buildAsideItems() {
            return entities.map((e) => {
                return `<p
          class="text-lg truncate text-gray-500 dark:text-white hover:text-green-400 dark:hover:text-green-400"
        >
          <a href="/admin/${e.plural}">${e.label}</a>
        </p>`;
            });
        }
        return `<script setup>
      const { isOpen, toggleOpen } = useToggleOpen()
      </script>

      <template>
        <aside
          :class="isOpen ? 'w-64' : 'w-26'"
          class="hidden sm:flex overflow-y-scroll h-screen z-30 ease-in-out transition-all duration-300 bg-white dark:bg-neutral-950 border-r-2 dark:border-r-zinc-800"
        >
          <div
            class="flex px-3"
            @click="toggleOpen"
          >
            <div :class="{ 'menu-trigger-open': isOpen }">
              <div
                class="menu-link-wrapper bg-white dark:bg-neutral-950 border-t-2 border-t-gray-100 dark:border-t-zinc-800 w-26"
                :class="{ 'w-64': isOpen }"
              >
                <div class="menu-link">
                  <span class="lines"></span>
                </div>
              </div>
              <div
                v-if="isOpen"
                class="pt-20"
              >
                ${buildAsideItems().join()}
              </div>
              <div
                v-else
                class="pt-20"
              >
                <div
                  class="flex flex-col items-middle justify-center dark:text-white space-y-12"
                >
                  <FontAwesomeIcon
                    size="2x"
                    class="text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400"
                    icon="fa-solid fa-bars"
                  />
                  <FontAwesomeIcon
                    size="2x"
                    class="text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400"
                    icon="fa-solid fa-blog"
                  />
                  <FontAwesomeIcon
                    size="2x"
                    class="text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400"
                    icon="fa-solid fa-hat-wizard"
                  />
                  <FontAwesomeIcon
                    size="2x"
                    class="text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400"
                    icon="fa-solid fa-user"
                  />
                  <FontAwesomeIcon
                    size="2x"
                    class="text-gray-400 dark:text-white hover:text-green-400 dark:hover:text-green-400"
                    icon="fa-solid fa-address-card"
                  />
                </div>
              </div>
            </div>
          </div>
        </aside>
      </template>

      <style>
      .menu-link-wrapper {
        cursor: pointer;
        position: fixed;
        left: 0px;
        bottom: 0px;
        height: 50px;
      }

      .menu-link {
        height: 100%;
        width: 65px;
      }

      .lines {
        -moz-transition: background 0.2s ease 0.4s;
        -o-transition: background 0.2s ease 0.4s;
        -webkit-transition: background 0.2s ease;
        transition: background 0.2s ease 0.4s;
        display: block;
        width: 100%;
        height: 2px;
        background: #aaa;
        -moz-transform-origin: 50% 50%;
        -ms-transform-origin: 50% 50%;
        -webkit-transform-origin: 50% 50%;
        transform-origin: 50% 50%;
        width: 60%;
        margin: 0 20%;
        position: relative;
        top: 22px;
      }

      .lines:before,
      .lines:after {
        display: block;
        width: 100%;
        height: 2px;
        background: #aaa;
        -moz-transform-origin: 50% 50%;
        -ms-transform-origin: 50% 50%;
        -webkit-transform-origin: 50% 50%;
        transform-origin: 50% 50%;
        position: absolute;
        left: 0;
        content: '';
        -moz-transition: -moz-transform 0.2s ease 0s, width 0.2s ease 0.2s,
          top 0.2s ease 0.4s;
        -o-transition: -o-transform 0.2s ease 0s, width 0.2s ease 0.2s,
          top 0.2s ease 0.4s;
        -webkit-transition: -webkit-transform 0.2s ease, width 0.2s ease,
          top 0.2s ease;
        -webkit-transition-delay: 0s, 0.2s, 0.4s;
        transition: transform 0.2s ease 0s, width 0.2s ease 0.2s, top 0.2s ease 0.4s;
        -moz-transform-origin: 0 50%;
        -ms-transform-origin: 0 50%;
        -webkit-transform-origin: 0 50%;
        transform-origin: 0 50%;
      }

      .lines:before {
        top: -10px;
      }

      .lines:after {
        top: 10px;
      }

      .menu-trigger-open .lines {
        -moz-transition: background 0.2s ease 0s;
        -o-transition: background 0.2s ease 0s;
        -webkit-transition: background 0.2s ease;
        -webkit-transition-delay: 0s;
        transition: background 0.2s ease 0s;
      }

      .menu-trigger-open .lines:before,
      .menu-trigger-open .lines:after {
        -moz-transition: top 0.2s ease 0s, width 0.2s ease 0.2s,
          -moz-transform 0.2s ease 0.4s;
        -o-transition: top 0.2s ease 0s, width 0.2s ease 0.2s,
          -o-transform 0.2s ease 0.4s;
        -webkit-transition: top 0.2s ease, width 0.2s ease,
          -webkit-transform 0.2s ease;
        -webkit-transition-delay: 0s, 0.2s, 0.4s;
        transition: top 0.2s ease 0s, width 0.2s ease 0.2s, transform 0.2s ease 0.4s;
        top: 0;
        width: 50%;
      }

      .menu-trigger-open .lines:before {
        -moz-transform: rotate3d(0, 0, 1, 45deg);
        -webkit-transform: rotate3d(0, 0, 1, 45deg);
        transform: rotate3d(0, 0, 1, 45deg);
      }

      .menu-trigger-open .lines:after {
        -moz-transform: rotate3d(0, 0, 1, -45deg);
        -webkit-transform: rotate3d(0, 0, 1, -45deg);
        transform: rotate3d(0, 0, 1, -45deg);
      }
    </style>`;
    }
    buildIndexPage() {
        const content = `
      <script setup>
        definePageMeta({
          layout: 'admin-layout',
        })

        useHead({
          title: '${this.e.label} | Turboship Admin',
          meta: [{ name: 'description', content: 'Great admin panels' }],
        })

        let tab = ref(0)

        const changeTab = (i) => {
          tab.value = i
        }

        const activeClasses = (currentTab) => {
          if (currentTab == tab.value)
            return 'text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500 opacity-100 hover:opacity-75'
        }

        let searching = ref(false)

        const toggleSearch = () => {
          changeTab(0)
          searching.value = !searching.value
        }

        const tabs = [
          {
            idx: 0,
            label: 'Records',
            component: 'table',
          },
          {
            idx: 1,
            label: 'Overview',
            component: 'overview',
          },
          {
            idx: 2,
            label: 'Create/New',
            component: 'form',
          },
          {
            idx: 3,
            label: 'Settings',
            component: 'settings',
          },
        ]
        </script>

        <template>
          <div class="flex flex-col min-w-full max-h-full overflow-y-none overflow-y-hidden">
            <div class="relative flex flex-col">
              <div
                class="text-sm bg-white dark:bg-slate-950 w-screen z-10 text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700"
              >
                <div class="flex">
                  <div class="mr-16">
                    <div
                      @click="toggleSearch"
                      class="flex p-4 opacity-75 hover:opacity-100"
                    >
                      <p class="mr-3 text-md">${this.e.label}</p>
                      <div>
                        <FontAwesomeIcon
                          class="text-gray-400 mr-2"
                          v-bind:icon="
                            searching
                              ? 'fa-solid fa-circle-xmark'
                              : 'fa-solid fa-magnifying-glass'
                          "
                        />
                      </div>
                    </div>
                  </div>
                  <div
                    :key="tab"
                    @click="() => changeTab(tab.idx)"
                    v-for="tab of tabs"
                    class="p-4 border-b-2 border-transparent rounded-t-lg opacity-75 hover:opacity-100"
                    :class="activeClasses(tab.idx)"
                  >
                    <span v-text="tab.label" />
                  </div>
                </div>
              </div>
            </div>
            <div
              class="min-w-full min-h-full pt-2"
              :class="{
                hidden: tab != 0,
              }"
            >
              <Admin${this.e.pluralL}Table :searching="searching" />
            </div>
            <div
              class="min-w-full min-h-full pt-1"
              :class="{
                hidden: tab != 1,
              }"
            >
              <AdminWizardsOverview />
            </div>
            <div
              class="min-w-full min-h-full pt-1"
              :class="{
                hidden: tab != 2,
              }"
            >
              <Admin${this.e.pluralL}Form :createForm="true" />
            </div>
            <div
              class="min-w-full min-h-full pt-1"
              :class="{
                hidden: tab != 3,
              }"
            >
              <h1>Contacts</h1>
            </div>
            <div
              class="min-w-full min-h-full pt-1"
              :class="{
                hidden: tab != 3,
              }"
            >
              <h1 class="text-gray-400">Settings</h1>
            </div>
          </div>
        </template>
    `;
        return content;
    }
    buildTable() {
        const e = this.e;
        const content = `
    <script setup>
      const props = defineProps(['searching'])

      const { ${e.plural}, sort, meta, fetchPage, fetchFiltered${e.pluralL} } = use${e.pluralL}()

      const sortFields = reactive(${(0, AdminHelpers_js_1.buildSortFields)(e)})

      function getSortingIcon(field) {
        const order = sortFields[field]
        return order === 'ASC' ? '▼' : '▲'
      }

      function toggleSort(field) {
        sortFields[field] = sortFields[field] === 'ASC' ? 'DESC' : 'ASC'
        sort(field, sortFields[field])
      }
      ${(0, AdminHelpers_js_1.buildEnumeratorHelpers)(e)}
      </script>
      <template>
        <div
          class="flex flex-col overflow-scroll justify-center rounded-lg border border-gray-200 dark:border-gray-600 shadow-md pb-12"
        >
          <Admin${e.pluralL}Form
            :searching="searching"
            :fetchFiltered${e.pluralL}="fetchFiltered${e.pluralL}"
          />
          <table
            class="overflow-x-auto mb-12 border-collapse dark:text-white text-left text-sm text-gray-500 dark:bg-slate-950"
          >
            <thead class="bg-gray-200 dark:bg-neutral-950">
              <tr class="dark:text-black">
                ${(0, AdminHelpers_js_1.buildTableHeaders)(e)}
              </tr>
            </thead>
            <tbody
              class="divide-y divide-gray-300 border-t border-gray-300 dark:divide-gray-800 dark:border-gray-600"
            >
              <tr
                :key="${e.name}._id"
                v-for="${e.name} in ${e.plural}"
                class="hover:bg-gray-200 odd:bg-neutral-100 even:bg-neutral-50 dark:hover:bg-neutral-950 dark:border-t-gray-600 odd:dark:bg-neutral-950 even:dark:bg-neutral-950"
              >
                ${(0, AdminHelpers_js_1.buildTableRows)(e)}
              </tr>
            </tbody>
          </table>
          <AdminFormPagination :meta="meta" :fetchPage="fetchPage" />
        </div>
      </template>
    `;
        return content;
    }
    buildForm() {
        const content = (0, AdminHelpers_js_1.buildForm)(this.e);
        return content;
    }
    buildEntityForm() {
        const content = (0, AdminHelpers_js_1.buildEntityForm)(this.e);
        return content;
    }
    buildEntityUseHook() {
        const apiUrl = `\`\${apiUrl}/${this.e.plural}\``;
        const capitalized = (0, helpers_js_1.capitalize)(this.e.plural);
        const content = `
    import { ref } from 'vue'
    import { useFetch } from '@vueuse/core'

    export function use${capitalized}() {
      const { apiUrl } = useAPI()
      const baseURL = ${apiUrl}
      let ${this.e.plural} = ref([])
      let params = ref('')
      let meta = reactive({
        page: ref(1),
        limit: ref(10),
        total: ref(0),
        offset: ref(0),
        pageCount: ref(0),
        totalRecords: ref(0),
      })

      ${this.generateAdd()}
      ${this.generateOnMount()}
      ${this.generateFetch()}
      ${this.generatePaginationString()}
      ${this.generateFetchPage()}
      ${this.generateSort()}
      return {
        ${this.e.plural},
        sort,
        fetchPage,
        meta,
        add${this.e.label},
        fetchFiltered${this.e.label}s,
      }
    }`;
        return content;
    }
    // buildEntityUseQueryHook() {
    //   const content = buildQueryHook(this.e)
    //   return content
    // }
    generateAdd() {
        return `const add${this.e.label} = async (fields) => {
      try {
        const { data, error } = await useFetch(baseURL, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(fields),
        })
        if (!error.value) {
          const ${this.e.name} = JSON.parse(data.value)
          ${this.e.plural}.value.push(${this.e.name})
          toastEm('${this.e.label} created')
          return ${this.e.name}
        }
      } catch (error) {
        console.error({ error })
      }
    }`;
    }
    generateOnMount() {
        return `onBeforeMount(async () => {
      const { data, error } = await useFetch(
        baseURL + \`?page=\${meta.page}&limit=\${meta.limit}\`
      )
      if (!error.value) {
        const val = JSON.parse(data.value)
        Object.assign(meta, val.meta)
        ${this.e.plural}.value = val?.data
      }
    })`;
    }
    generateFetch() {
        return `const fetchFiltered${this.e.pluralL} = async (fields) => {
      meta.page = 1
      const queryParams = new URLSearchParams(Object.entries(fields)).toString()
      params.value = queryParams

      const url = makeApiQueryString(
        apiUrl + \`/${this.e.plural}?page=\${meta.page}&limit=\${meta.limit}\`,
        fields
      )
      try {
        let { data, error } = await useFetch(url)
        if (!error.value) {
          const val = JSON.parse(data.value)
          meta.page = val.meta.page
          meta.totalRecords = val.meta.totalRecords
          Object.assign(meta, val.meta)
          ${this.e.plural}.value = val?.data
        } else {
          console.error('Error fetching ${this.e.plural}:', error.value)
        }
      } catch (error) {
        console.error('Unexpected error:', error)
      }
    }`;
    }
    generatePaginationString() {
        return `const getPaginationString = (diff) => {
    let nextPage = meta.page + diff
    if (diff == -10) nextPage = 1
    if (diff == 10) nextPage = meta.pageCount
    return [
      \`/${this.e.plural}?page=\${nextPage}&limit=\${meta.limit}\${
        params.value ? '&' + params.value : ''
      }\`,
      nextPage,
    ]}`;
    }
    generateFetchPage() {
        return `const fetchPage = async (diff) => {
      let [str, nextPage] = getPaginationString(diff)

      const url = makeApiQueryString(apiUrl + str, {})
      try {
        let { data, error } = await useFetch(url)
        if (!error.value) {
          const val = JSON.parse(data.value)
          meta.page = nextPage
          Object.assign(meta, val.meta)
          ${this.e.plural}.value = val?.data
        } else {
          console.error('Error fetching ${this.e.plural}:', error.value)
        }
      } catch (error) {
        console.error('Unexpected error:', error)
      }
    }`;
    }
    generateSort() {
        return `
      const sort = (field, direction) => {
        if (direction === 'ASC') {
          ${this.e.plural}.value = ${this.e.plural}.value.sort((a, b) =>
            (a[field] ?? '') > (b[field] ?? '') ? 1 : -1
          )
        } else if (direction === 'DESC') {
          ${this.e.plural}.value = ${this.e.plural}.value.sort((a, b) =>
            (a[field] ?? '') > (b[field] ?? '') ? -1 : 1
          )
        }
      }
    `;
    }
}
exports.AdminBuilder = AdminBuilder;
