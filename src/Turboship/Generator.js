import { frameworkMap } from './Framework.js'
import { ModelBuilder, AdminBuilder } from './builders/index.js'

export default class Generator {
  constructor(e, options, zip) {
    this.entities = e
    this.options = options
    this.zip = zip
    this.root = `${this.options.root}${this.options.backend}`
  }

  async buildGenesis() {
    if (!backends.includes(this.options.frameworkName)) return
    const routes = frameworkMap[this.options.backend].apiFiles
    buildRoutes(routes, this.entities, this.options, this.zip)
    buildModels(this.entities, this.options, this.zip)
    buildAdminUI(this.entities, this.options, this.zip)
    return this.zip
  }
}

function buildAdminUI(entities, options, zip) {
  entities.map(async (e) => {
    const admin = new AdminBuilder(entities, options, zip)
    admin.e = e

    let fullPath = `nuxt/components/Admin/${e.pluralL}`

    frameworkMap[options.backend].adminUIFiles.forEach((fileName) => {
      const content =
        admin[frameworkMap[options.backend].adminBuildMethodMap[fileName]]()
      let name = `${fullPath}/${fileName}`
      zip.file(name, content)
    })

    fullPath = `nuxt/pages/Administrator/${e.pluralL}`

    let content = admin.buildIndexPage()
    let name = `${fullPath}/index.vue`
    zip.file(name, content)

    content = admin.buildEntityUseHook()
    name = `nuxt/composables/use${capitalize(e.plural)}.${options.language}`
    zip.file(name, content)
  })
  const content = AdminBuilder.buildAside(entities)
  let name = `nuxt/components/Admin/Aside.vue`
  zip.file(name, content)
}

function buildModels(entities, options, zip) {
  const backend = new ModelBuilder(entities, options)
  entities.map((e) => {
    let fullPath = `nuxt/server/models`
    backend.e = e
    const content = backend.buildModel()
    const name = `${fullPath}/${e.label}.model.${options.language}`
    zip.file(name, content)
  })
}

function buildRoutes(routes, entities, options, zip) {
  zip.sync(() => {
    for (let e of entities) {
      const fullPath = `/server/API/${e.plural}`
      for (let r of routes) {
        const fileName = r + options.language
        const content = frameworkMap[options.backend]['apiContent'][r](e.label)
        const name = `nuxt${fullPath}/${fileName}`
        zip.file(name, content)
      }
      zip.generateAsync({ type: 'nodebuffer' }).then((content) => {})
    }
    zip.generateAsync({ type: 'nodebuffer' }).then((content) => {})
  })
}

const backends = ['nuxt']

const capitalize = (word) => {
  const firstLetter = word?.charAt(0)
  const firstLetterCap = firstLetter.toUpperCase()
  const remainingLetters = word.slice(1)
  const capitalizedWord = firstLetterCap + remainingLetters
  return capitalizedWord
}
