"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.buildEnumeratorHelpers = exports.buildSortFields = exports.buildTableHeaders = exports.buildTabs = exports.buildTableRows = exports.buildForm = exports.buildEntityForm = exports.buildEntityFormInputs = exports.buildEntityFormInput = exports.buildOptions = void 0;
const helpers_js_1 = require("../helpers.js");
function buildOptions(obj) {
    let string = '{\n';
    for (const key in obj) {
        const newVal = typeof obj[key] === 'string'
            ? (0, helpers_js_1.capitalize)(obj[key])
            : (0, helpers_js_1.capitalize)(obj[key].val);
        if (obj.hasOwnProperty(key)) {
            string += `${key}: '${newVal}',\n`;
        }
    }
    return (string += '}');
}
exports.buildOptions = buildOptions;
function buildEntityFormInput(key, field) {
    switch (field.type) {
        case 'string':
            return `
      <div class="item">
        <AdminFormField
          type="text"
          name="${key}"
          label="${field.label || field.name || ''}"
          placeholder="${field.placeholder}"
          :validation="searching ? '' : '${field.required ? 'required' : ''}'"
        />
      </div>`;
        case 'enumerator':
            return `
      <div class="item">
        <AdminFormField
          name="${key}"
          type="select"
          label="${field.label || field.name || ''}"
          placeholder="${field.placeholder}"
          :options="${buildOptions(field.enumerators)}"
          :multiple="${field.multiselect || 'searching'}"
          :validation="searching ? '' : '${field.required ? 'required' : ''}'"
        />
      </div>`;
        case 'number':
            return `
      <div class="item">
        <AdminFormField
          name="${key}"
          type="number"
          min="${field.min}"
          max="${field.max}"
          label="${field.label || field.name || ''}"
          placeholder="${field.placeholder}"
          :validation="searching ? '' : '${field.required ? 'required' : ''}'"
          
        />
      </div>`;
        case 'boolean':
            return `
      <div class="item">
        <AdminFormField
          name="${key}"
          type="select"
          label="${field.label || field.name || ''}"
          placeholder="${field.placeholder}"
          :options="${buildOptions(field.enumerators)}"
        />
      </div>`;
        case 'date':
            return `
      <div class="item">
        <AdminFormField
          name="${key}"
          type="select"
          :multiple="searching"
          label="${field.label || field.name || ''}"
          :placeholder="searching ? 'Select house/houses' : 'Select placeholder'"
          :validation="searching ? '' : '${field.required ? 'required' : ''}'"
          help="Select all that apply by holding command (macOS) or control (PC)."
        />
      </div>`;
        default:
            break;
    }
}
exports.buildEntityFormInput = buildEntityFormInput;
function buildEntityFormInputs(e) {
    const keys = Object.keys(e.fields);
    const customSort = (a, b) => {
        const typeA = e.fields[a].type === 'enumerator';
        const typeB = e.fields[b].type === 'enumerator';
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
    return keys
        .map((key) => {
        return buildEntityFormInput(key, e.fields[key]);
    })
        .join('');
}
exports.buildEntityFormInputs = buildEntityFormInputs;
function buildEntityForm(e) {
    return `<script setup>
    import { reset } from '@formkit/core'
    const props = defineProps([
      'searching',
      'fetchFiltered${e.pluralL}',
      'createForm',
      'clear',
    ])
    const { add${(0, helpers_js_1.capitalize)(e.name)} } = use${e.pluralL}()

    async function submit(fields) {
      if (props.searching) {
        await props.fetchFiltered${e.pluralL}(fields)
        return
      }
      const ${e.name} = add${(0, helpers_js_1.capitalize)(e.name)}(fields)
      if (${e.name}) {
        reset('${e.name}Form')
      }
    }
    </script>

    <template>
    <div class="relative">
      <FormKit
        id="${e.name}Form"
        type="form"
        @submit="submit"
        :actions="false"
        #default="{ value }"
        :classes="{
          help: 'dark:text-white',
          message: 'text-red-500 dark:text-red-300 absolute',
        }"
      >
        <div
          id="${e.label}"
          class="form-items-container grid grid-cols-4 gap-x-7 gap-y-7 px-3"
        >
          ${buildEntityFormInputs(e)}
          </div>
          <div class="flex flex-row space-x-1 mt-6">
            <FormKit
              type="button"
              label="Clear"
              @click="clear"
              :classes="{
                outer: 'bg-red-500 rounded basis-1/4',
                input:
                  'flex flex-grow justify-center text-white dark:text-white p-3',
                wrapper: 'flex flex-grow text-center',
              }"
            />
            <FormKit
              type="submit"
              :disabled="disabled"
              :classes="{
                outer: 'bg-green-500 rounded basis-3/4',
                input:
                  'flex flex-grow justify-center text-white dark:text-white p-3',
                wrapper: 'flex flex-grow text-center',
              }"
            >
              Submit
            </FormKit>
        </div>
      </FormKit>
      </div>
    </template>
    <style></style>
    `;
}
exports.buildEntityForm = buildEntityForm;
function buildForm(e) {
    return `<script setup>
    const props = defineProps(['searching', 'fetchFiltered${e.pluralL}', 'createForm'])
    const num = ref(0)
    const clearForm = () => {
      num.value = num.value + 1
    }
  </script>
  <template>
    <div
      class="w-100 dark:bg-neutral-950 p-3 main-container"
      :class="{ hidden: !searching && !createForm }"
    >
      <TransitionGroup
        name="fade-move"
        class="container"
      >
        <div :key="num">
          <Admin${e.pluralL}EntityForm
            :clear="clearForm"
            :searching="searching"
            :fetchFiltered${e.pluralL}="fetchFiltered${e.pluralL}"
          />
        </div>
      </TransitionGroup>
    </div>
  </template>`;
}
exports.buildForm = buildForm;
function buildTableRows(e) {
    var _a;
    let string = '';
    for (const key of e.tableFields) {
        const fieldType = (_a = e.fields[key]) === null || _a === void 0 ? void 0 : _a.type;
        if (key === 'email') {
            string += `
      <th class="flex gap-3 px-3 py-4 font-normal text-gray-900">
      <div class="relative h-10 w-10">
        <img
          :src="${e.name}.avatarUrl || 'https://i.pravatar.cc/150?img=4'"
          class="h-full rounded-full object-cover object-center"
        />
        <span
          class="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"
        />
      </div>
      <div class="text-sm">
        <span
          v-text="${e.name}.firstName"
          class="font-medium text-gray-700 dark:text-white"
        />
        <div>
          <span
            v-text="${e.name}.email"
            class="text-gray-400"
          />
        </div>
      </div>
    </th>`;
        }
        else if (key !== 'firstName') {
            if (fieldType == 'enumerator' && e.fields[key].multiselect) {
                string += `<td
          class="px-6 py-4"
          v-if="${e.name}.${key}"
        >
          <div class="flex justify-center gap-1">
            <span
              v-for="(item, idx) of ${e.name}.${key}"
              v-text="item"
              class="inline-flex items-center gap-1 rounded-full px-2 py-1 text-xs font-semibold text-white"
              :class="get${(0, helpers_js_1.capitalize)(key)}Color('bg', item)"
            />
          </div>
        </td>`;
            }
            else if (fieldType == 'enumerator') {
                string += `<td
          class="px-6 py-4"
          v-if="${e.name}.${key}"
        >
          <span
            class="inline-flex items-center gap-1 rounded-full bg-gray-100 dark:bg-slate-900 px-2 py-1 text-xs font-semibold"
            :class="get${(0, helpers_js_1.capitalize)(key)}Color('text', ${e.name}.${key})"
          >
            <span
              class="h-1.5 w-1.5 rounded-full"
              :class="get${(0, helpers_js_1.capitalize)(key)}Color('bg', ${e.name}.${key})"
            />
            <span v-text="${e.name}.${key}" />
          </span>
        </td>`;
            }
            else {
                string += `
        <td class="px-3 py-4">
          <div class="text-sm">
            <div
              v-text="${e.name}.${key}"
              class="font-medium text-gray-700 dark:text-white"
            />
          </div>
        </td>`;
            }
        }
    }
    return string;
}
exports.buildTableRows = buildTableRows;
function buildTabs(e, prop) {
    const houseKeys = Object.entries(e.fields[prop].enumerators);
    const keyMap = {};
    houseKeys.forEach(([k, v], idx) => (keyMap[k] = helpers_js_1.colors[idx]));
    function makeKey(k, v) {
        return `${k.toLowerCase()}: \`\${field}-${v.color ? v.color : keyMap[k]}-\${weight}\`,`;
    }
    return `{${houseKeys.map(([k, v]) => makeKey(k, v)).join('')}}`;
}
exports.buildTabs = buildTabs;
function buildTableHeaders(e) {
    let string = '';
    for (const key of e.tableFields) {
        if (key == 'firstName')
            continue;
        string += `<th
      scope="col"
      @click="toggleSort('${key}')"
      class="px-6 py-4 font-medium text-gray-500 dark:text-gray-600 truncate"
    >
      ${key} <span v-text="getSortingIcon('${key}')" />
    </th>`;
    }
    return string;
}
exports.buildTableHeaders = buildTableHeaders;
const buildSortFields = (e) => {
    let string = '{';
    for (const key in e.fields) {
        if (Object.hasOwnProperty.call(e.fields, key)) {
            string += `${key}: ref('ASC'),`;
        }
    }
    return string + '}';
};
exports.buildSortFields = buildSortFields;
function buildEnumeratorHelpers(e) {
    const enums = e.tableFields.filter((name) => {
        var _a;
        return ((_a = e.fields[name]) === null || _a === void 0 ? void 0 : _a.type) === 'enumerator';
    });
    return enums
        .map((item) => `function get${(0, helpers_js_1.capitalize)(item)}Color(field, key) {
          key = isNaN(key) ? key?.toString()?.toLowerCase() : key
          const weight = field == 'bg' ? 500 : 400
          const kolors = ${buildTabs(e, item)}
            return {
              [kolors[key]]: true,
            }
        }`)
        .join('');
}
exports.buildEnumeratorHelpers = buildEnumeratorHelpers;
