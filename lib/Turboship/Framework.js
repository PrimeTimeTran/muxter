import fs from 'fs'
import path from 'path'
import fsExtra from 'fs-extra'
import Generator from './Generator.js'

export default class Framework {
  constructor(name, options, entities, zip) {
    this.name = name
    this.framework = frameworkMap[name]
    this.zip = zip
    this.entities = entities
    this.options = options
    this.options.frameworkName = name
  }

  createDirectories() {
    this.framework.rootDirectories.forEach((dir) => {
      this.zip.folder(`${this.name}/${dir}`)
    })
    return this.zip
  }

  zipBaseDirectory() {
    const basePath =
      '/Users/loi/Desktop/work/turboship/muxter/lib/Turboship/nuxt'
    getZippedFolderSync(basePath, this.zip)
    return this.zip
  }
  async build() {
    const entities = Object.values(this.entities)
    const generator = await new Generator(entities, this.options, this.zip)
    return await generator.buildGenesis()
  }

  setup() {
    const framework = frameworkMap[this.name]
    const root = '/tmp/turboship/' + framework.name
    try {
      fs.mkdirSync(root, { recursive: true })
      framework.rootDirectories.forEach((dir) => {
        const fullPath = `${root}/${dir}`
        try {
          fs.mkdirSync(fullPath, { recursive: true })
          log('Create: ', fullPath, 'yellow')
        } catch (err) {
        }
      })
    } catch (err) {
    }
  }
}

function getZippedFolderSync(dir, zip) {
  let allPaths = getFilePathsRecursiveSync(dir)
  zip.sync(() => {
    for (let filePath of allPaths) {
      let addPath = path.relative(path.join(dir, '..'), filePath)
      let data = fs.readFileSync(filePath)
      zip.file(addPath, data)
    }
  })
}

function getFilePathsRecursiveSync(dir) {
  var results = []
  let list = fs.readdirSync(dir)
  var pending = list.length
  if (!pending) return results

  for (let file of list) {
    file = path.resolve(dir, file)
    let stat = fs.statSync(file)
    if (stat && stat.isDirectory()) {
      let res = getFilePathsRecursiveSync(file)
      results = results.concat(res)
    } else {
      results.push(file)
    }
    if (!--pending) return results
  }

  return results
}

export const frameworkMap = {
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
      `
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
      `
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
      `
      },
      '[_id].get.': function (label) {
        return `export default defineEventHandler(async (event) => {
          try {
            return await ${label}.findOne({ _id: event.context.params?._id })
          } catch (error) {
            return error
          }
        })
      `
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
      `
      },
    },
  },
  flutter: {
    name: 'flutter',
    version: '3.8.0',
    rootDirectories: ['src'],
  },
}
