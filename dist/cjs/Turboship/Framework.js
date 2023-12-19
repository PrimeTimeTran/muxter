"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.frameworkMap = void 0;
const fs_1 = __importDefault(require("fs"));
const path_1 = __importDefault(require("path"));
const Generator_js_1 = __importDefault(require("./Generator.js"));
const helpers_js_1 = require("./helpers.js");
class Framework {
    constructor(name, options, entities, zip) {
        this.name = name;
        this.framework = exports.frameworkMap[name];
        this.zip = zip;
        this.entities = entities;
        this.options = options;
        this.options.frameworkName = name;
    }
    createDirectories() {
        this.framework.rootDirectories.forEach((dir) => {
            if (this.options.logLevelDebug)
                console.log(`building ${dir}`);
            this.zip.folder(`${this.name}/${dir}`);
        });
        return this.zip;
    }
    zipBaseDirectory() {
        const isDeveloping = false;
        const name = this.options.frameworkName;
        let basePath = '/var/task/node_modules/@primetimetran/muxter/src/Turboship/';
        if (isDeveloping) {
            basePath =
                '/Users/loi/Desktop/work/turboship/web/netlify/functions/build-muxter/Turboship/';
        }
        basePath += name;
        getZippedFolderSync(basePath, this.zip, this.options);
        return this.zip;
    }
    build() {
        return __awaiter(this, void 0, void 0, function* () {
            const entities = Object.values(this.entities);
            const generator = yield new Generator_js_1.default(entities, this.options, this.zip);
            return yield generator.buildGenesis();
        });
    }
}
exports.default = Framework;
function getZippedFolderSync(dir, zip, options) {
    console.log('getZippedFolderSync');
    let allPaths = getFilePathsRecursiveSync(dir);
    zip.sync(() => {
        for (let filePath of allPaths) {
            if (options.logLevelDebug)
                console.log(`building ${filePath}`);
            let addPath = path_1.default.relative(path_1.default.join(dir, '..'), filePath);
            let data = fs_1.default.readFileSync(filePath);
            zip.file(addPath, data);
        }
    });
}
function getFilePathsRecursiveSync(dir) {
    var results = [];
    if (!dir)
        return results;
    let list = fs_1.default.readdirSync(dir);
    var pending = list.length;
    if (!pending)
        return results;
    for (let file of list) {
        file = path_1.default.resolve(dir, file);
        let stat = fs_1.default.statSync(file);
        if (stat && stat.isDirectory()) {
            let res = getFilePathsRecursiveSync(file);
            results = results.concat(res);
        }
        else {
            results.push(file);
        }
        if (!--pending)
            return results;
    }
    return results;
}
function buildSidebarItems(entities) {
    return entities
        .map((e) => e.name != 'user' ? `{ path: '${e.plural}', label: '${e.pluralL}' },` : '')
        .join('');
}
function buildEntities(entities) {
    return entities.map((e) => `'${e.plural}',`).join('');
}
function buildEntityDefinition(e) {
    function setupAttributes() {
        e.fields = {};
        const fields = {};
        const attributes = e.attributes;
        if (attributes) {
            attributes.forEach((f) => {
                if (f.name !== '_id') {
                    fields[f.name] = Object.assign({}, f);
                    const field = fields[f.name];
                    delete field._id;
                    field.label = f.label;
                    field.type = f.type;
                    field.placeholder = f.label;
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
                }
            });
        }
    }
    setupAttributes();
    return `${e.plural}: {
    ${e.attributes.map((a) => `
      ${a.name}: {
        type: '${a.type}',
        label: '${a.label}',
        placeholder: '${a.placeholder ? a.placeholder : ''}',
        ${(0, helpers_js_1.buildOptions)(a)}
      } 
    `)}
  }`;
}
function buildEntitiesDefinitions(entities) {
    return entities.map((e) => buildEntityDefinition(e));
}
exports.frameworkMap = {
    nuxt: {
        name: 'nuxt',
        version: '3.8.0',
        adminUIFiles: ['EntityForm.vue', 'Form.vue', 'Table.vue'],
        apiFiles: [
            'index.get.',
            'index.post.',
            '[_id].delete.',
            '[_id].get.',
            '[_id].put.',
        ],
        buildGlobalMeta: (entities) => {
            return `import _ from 'lodash'
        import { ClockIcon, ChartPieIcon, UserGroupIcon } from '@heroicons/vue/20/solid'

        export class GlobalState { 
          static entityNames = ['auditlogs', ${buildEntities(entities)}]
          static entityCols(entityName) {
            // Sort cols => primitives, enums, relations
            // Add empty & _id cols to the start for ellipsis & checkbox respectively
            let thisEntity = this.entities[entityName]
            let attributes = Object.keys(thisEntity).filter((a) => a !== '_id')
            attributes = Object.entries(thisEntity)
              .map(([k, v]) => ({ name: k, ...v }))
              .filter((a) => a.name !== '_id')
            attributes = Type.sortOnType(attributes)
            return [{ name: '', type: '' }, { name: '_id', type: 'string' }, ...attributes]
          }
          static sidebar = [
            { path: 'dashboard', label: 'Dashboard', icon: ChartPieIcon },
            { path: 'auditlogs', label: 'Audit Logs', icon: ClockIcon },
            { path: 'users', label: 'Users', icon: UserGroupIcon },
            ${buildSidebarItems(entities)}
          ]
          static entities = {
            ${buildEntitiesDefinitions(entities)}
          }
        `;
        },
        rootDirectories: [
            'components',
            'composables',
            'content',
            'layouts',
            'pages',
            'pages/Administrator',
            'plugins',
            'server',
            'utils',
            // Must be lowercase
            'server/models',
            'server/API',
            // Must be plural
            'server/Utils',
            'components/Admin',
            'components/Admin/Entity',
            'components/Admin/The',
            'components/The/Navbar',
        ],
        apiContent: {
            'index.get.': function (label) {
                return `import _ from 'lodash'
          export default defineEventHandler(async (e) => {
            try {
              let { limit, page } = e.context
              let params = getQuery(e)
              const query = buildQuery(params)
              const pipeline = buildPipeline(query, page, limit)
              const results = await ${label}.aggregate(pipeline)
              let { data, totalCount, pageCount } = results[0]
              if (!_.isEmpty(totalCount) && totalCount[0]) {
                // pageCount = Math.ceil(parseInt(totalCount[0].total) / limit)
                totalCount = totalCount.length > 0 ? totalCount[0].total : 0
              }
              const response = {
                meta: {
                  page,
                  pageCount: pageCount,
                  totalCount: totalCount,
                },
                data,
              }
              return response
            } catch (error) {
              console.log({
                error,
              })
            }
          })`;
            },
            'index.post.': function (label) {
                return `export default defineEventHandler(async (event) => {
          const body = await readBody(event)
          try {
            return await new ${label}(body).save()
          } catch (error) {
            return error
          }
        })
      `;
            },
            '[_id].delete.': function (label) {
                return ` export default defineEventHandler(async (event) => {
          try {
            return await ${label}.findOneAndDelete({ _id: event.context.params?._id })
          }
          catch (error) {
            return error
          }
        })
      `;
            },
            '[_id].get.': function (label) {
                return `export default defineEventHandler(async (event) => {
          try {
            return await ${label}.findOne({ _id: event.context.params?._id })
          } catch (error) {
            return error
          }
        })
      `;
            },
            '[_id].put.': function (label) {
                return `export default defineEventHandler(async (event) => {
          const body = await readBody(event)
          try {
            return await ${label}.findOneAndUpdate(
              { _id: event.context.params?._id },
              body,
              { new: true }
            )
          } catch (error) {
            return error
          }
        })
      `;
            },
        },
    },
    flutter: {
        name: 'flutter',
        version: '3.8.0',
        rootDirectories: ['lib'],
    },
};
