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
            this.zip.folder(`${this.name}/${dir}`);
        });
        return this.zip;
    }
    zipBaseDirectory() {
        let basePath = `/var/task/node_modules/@primetimetran/muxter/src/Turboship/nuxt`;
        if (false) {
            basePath = `/Users/loi/Desktop/work/turboship/muxter/src/Turboship/nuxt`;
        }
        // 12/2/23 - 2.12
        //   Local netlify dev server files dl no problem
        //
        //
        //
        //
        //
        console.log({
            basePath,
            current: process.cwd(),
        });
        getZippedFolderSync(basePath, this.zip);
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
function getZippedFolderSync(dir, zip) {
    let allPaths = getFilePathsRecursiveSync(dir);
    zip.sync(() => {
        for (let filePath of allPaths) {
            let addPath = path_1.default.relative(path_1.default.join(dir, '..'), filePath);
            let data = fs_1.default.readFileSync(filePath);
            zip.file(addPath, data);
        }
    });
}
function getFilePathsRecursiveSync(dir) {
    console.log({
        dir,
    });
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
exports.frameworkMap = {
    nuxt: {
        name: 'nuxt',
        version: '3.8.0',
        rootDirectories: [
            'components',
            'composables',
            'content',
            'layouts',
            'pages',
            'plugins',
            'server',
            'utils',
            // Must be lowercase
            'server/models',
            'server/API',
            // Must be plural
            'server/Utils',
            'components/Admin',
            'components/The/Navbar',
        ],
        adminUIFiles: ['EntityForm.vue', 'Form.vue', 'Table.vue'],
        adminBuildMethodMap: {
            'Form.vue': 'buildForm',
            'Table.vue': 'buildTable',
            'EntityForm.vue': 'buildEntityForm',
        },
        adminGlobals: [
            './components/Admin/Form/Field.vue',
            './components/Admin/Form/Pagination.vue',
        ],
        apiFiles: [
            'index.get.',
            'index.post.',
            '[_id].delete.',
            '[_id].get.',
            '[_id].put.',
        ],
        apiContent: {
            'index.get.': function (label) {
                return `export default defineEventHandler(async (e) => {
          let { limit, page } = e.context
          let params = getQuery(e)
          const query = buildQuery(params)
          const pipeline = buildPipeline(query, page, limit)
          const results = await ${label}.aggregate(pipeline)

          const { data, totalCount } = results[0]

          const response = {
            meta: {
              page,
              pageCount: Math.ceil(parseInt(totalCount[0].total) / limit),
              totalCount: totalCount.length > 0 ? totalCount[0].total : 0,
            },
            data,
          }
          return response
        })
      `;
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
        rootDirectories: ['src'],
    },
};
