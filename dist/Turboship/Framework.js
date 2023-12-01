"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.frameworkMap = exports.default = void 0;
var _fs = _interopRequireDefault(require("fs"));
var _path = _interopRequireDefault(require("path"));
var _url = require("url");
var _Generator = _interopRequireDefault(require("./Generator.js"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }
const _filename = (0, _url.fileURLToPath)(import.meta.url);
const _dirname = _path.default.dirname(_filename);
class Framework {
  constructor(name, options, entities, zip) {
    this.name = name;
    this.framework = frameworkMap[name];
    this.zip = zip;
    this.entities = entities;
    this.options = options;
    this.options.frameworkName = name;
  }
  createDirectories() {
    this.framework.rootDirectories.forEach(dir => {
      this.zip.folder(`${this.name}/${dir}`);
    });
    return this.zip;
  }
  zipBaseDirectory() {
    const basePath = `${_dirname}/nuxt`;
    getZippedFolderSync(basePath, this.zip);
    return this.zip;
  }
  async build() {
    const entities = Object.values(this.entities);
    const generator = await new _Generator.default(entities, this.options, this.zip);
    return await generator.buildGenesis();
  }
  setup() {
    const framework = frameworkMap[this.name];
    const root = '/tmp/turboship/' + framework.name;
    try {
      _fs.default.mkdirSync(root, {
        recursive: true
      });
      framework.rootDirectories.forEach(dir => {
        const fullPath = `${root}/${dir}`;
        try {
          _fs.default.mkdirSync(fullPath, {
            recursive: true
          });
          log('Create: ', fullPath, 'yellow');
        } catch (err) {}
      });
    } catch (err) {}
  }
}
exports.default = Framework;
function getZippedFolderSync(dir, zip) {
  let allPaths = getFilePathsRecursiveSync(dir);
  zip.sync(() => {
    for (let filePath of allPaths) {
      let addPath = _path.default.relative(_path.default.join(dir, '..'), filePath);
      let data = _fs.default.readFileSync(filePath);
      zip.file(addPath, data);
    }
  });
}
function getFilePathsRecursiveSync(dir) {
  var results = [];
  let list = _fs.default.readdirSync(dir);
  var pending = list.length;
  if (!pending) return results;
  for (let file of list) {
    file = _path.default.resolve(dir, file);
    let stat = _fs.default.statSync(file);
    if (stat && stat.isDirectory()) {
      let res = getFilePathsRecursiveSync(file);
      results = results.concat(res);
    } else {
      results.push(file);
    }
    if (! --pending) return results;
  }
  return results;
}
const frameworkMap = exports.frameworkMap = {
  nuxt: {
    name: 'nuxt',
    version: '3.8.0',
    rootDirectories: ['components', 'composables', 'content', 'layouts', 'pages', 'plugins', 'server', 'utils',
    // Must be lowercase
    'server/models', 'server/API',
    // Must be plural
    'server/Utils', 'components/Admin', 'components/The/Navbar'],
    adminUIFiles: ['EntityForm.vue', 'Form.vue', 'Table.vue'],
    adminBuildMethodMap: {
      'Form.vue': 'buildForm',
      'Table.vue': 'buildTable',
      'EntityForm.vue': 'buildEntityForm'
    },
    adminGlobals: ['./components/Admin/Form/Field.vue', './components/Admin/Form/Pagination.vue'],
    apiFiles: ['index.get.', 'index.post.', '[_id].delete.', '[_id].get.', '[_id].put.'],
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
      }
    }
  },
  flutter: {
    name: 'flutter',
    version: '3.8.0',
    rootDirectories: ['src']
  }
};