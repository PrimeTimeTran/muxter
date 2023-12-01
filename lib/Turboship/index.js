import fs from 'fs'
import path from 'path'
import chalk from 'chalk'
import JSZip from 'jszip-sync'
import { program } from 'commander'

import Framework from './Framework.js'
import seeds from '../seeds/seeds.js'
import { prettify } from './helpers.js'

// 1. Make Turboship wrap JSZip
// Have Turboship use JSZip to build source files, generate zip, return it
// Impossible to format?

export default class Turboship {
  supportedFrameworks = ['flutter', 'nuxt', 'rn']
  constructor(entities) {
    this.zip = new JSZip()
    this.entities = {}
    this.options = this.options()
    this.buildEntities(entities)
    this.setupFrameworks()
  }

  options() {
    program
      .option('-d, --debug', 'output extra debugging')
      .option('-l, --language <type>', 'language choice', 'js')
      .option('-b, --backend <type>', 'backend choice', 'nuxt')
      .option('-m, --mobile <type>', 'mobile choice', 'flutter')
      .option('-e, --entities <letters...>', 'entities included', 'user')
    program.parse(process.argv)
    return program.opts()
  }

  buildEntities(entities = []) {
    const entityTemplates = ['mint', 'bank', 'lms', 'social', 'pm', 'customer']
    const keys = Object.values(this.options.entities)
    keys[0] = 'mint'

    const chosen = keys.filter((k) => entityTemplates.includes(k))
    chosen.forEach((name) => {
      const collection = seeds[name]
      collection.forEach((e) => {
        this.entities[e.name] = e
      })
    })
    if (Object.keys(entities).length > 0) {
      entities?.forEach((e) => {
        this.entities[e.name] = e
      })
    }
  }

  setupFrameworks() {
    const keys = [this.options.backend, this.options.mobile]
    const frameworks = keys.filter((k) => this.supportedFrameworks.includes(k))
    frameworks.forEach((framework) => {
      const fw = new Framework(framework, this.options, this.zip)
      fw.createDirectories()
      fw.zipBaseDirectory()
      fw.build()
    })
  }

  report() {
    const options = program.opts()
    console.log('\n\n')
    if (options.debug) console.log(options)
    console.log('\n\n')
    console.log(chalk.green.underline('Run Details:'))
    if (options.language)
      console.log(chalk['green']('language'), `- ${options.language}`)
    if (options.backend)
      console.log(chalk['green']('backend'), `- ${options.backend}`)
    if (options.mobile)
      console.log(chalk['green']('mobile'), `- ${options.mobile}`)
    if (options.entities)
      console.log(chalk['green']('entities'), `- ${options.entities}`)
    console.log('\n\n')
    prettify(this.options.root)
  }
}

function getZippedFolderSync(dir) {
  let allPaths = getFilePathsRecursiveSync(dir)

  let zip = new JSZip()
  let zipped = zip.sync(() => {
    for (let filePath of allPaths) {
      let addPath = path.relative(path.join(dir, '..'), filePath)
      // let addPath = path.relative(dir, filePath) // use this instead if you don't want the source folder itself in the zip

      let data = fs.readFileSync(filePath)
      zip.file(addPath, data)
    }
    let data = null
    zip.generateAsync({ type: 'nodebuffer' }).then((content) => {
      data = content
    })
    return data
  })
  return zipped
}

// returns a flat array of absolute paths of all files recursively contained in the dir
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
