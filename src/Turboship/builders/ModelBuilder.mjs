import path from 'path'
import { camelize, getType, capitalize } from '../helpers.mjs'

export class ModelBuilder {
  constructor(entities, options) {
    this.entities = entities
    this.options = options
    this.path = this.getModelPath()
  }
  getModelPath() {
    // Get the current working directory
    const currentWorkingDir = process.cwd()

    // Calculate the path to the Models directory
    return path.join(currentWorkingDir, 'src', 'Models')
  }
  buildEntities = () => {
    this.entities.map((e) => {
      this.e = e
      this.buildModel()
    })
  }

  buildTransformation(attributes) {
    const fields = {}
    if (attributes) {
      attributes.forEach((f) => {
        if (f.name !== '_id') {
          fields[f.name] = { ...f }
          delete fields[f.name]._id
          if (f.type === 'enumerator' || f.type === 'enumeratorMulti') {
            fields[f.name].enumeratorType = 'string'
            fields[f.name].enumerators = {}
            const options = f.options?.split(',')
            if (options) {
              options.forEach((o) => {
                fields[f.name].enumerators[o] = {
                  val: o,
                  color: null,
                }
              })
            }
          }
        }
      })
      this.e.fields = fields
      this.e.tableFields = Object.keys(fields)
    }
    return fields
  }

  buildModel = () => {
    const {
      e,
      options,
      e: { name, label, attributes },
    } = this
    let fields
    if (name == 'wizard') {
      fields = this.e.fields
    } else {
      fields = this.buildTransformation(attributes)
    }

    const [values, enumerators] = this.generateFields(fields, name)

    const buildImports = () => {
      if (options.typescript) {
        return `
        import { z } from 'zod'
        import { Model, Document } from 'mongoose'
        import { defineMongooseModel } from '#nuxt/mongoose'
        `
      }
      return `
      import mongoose, { Schema } from 'mongoose'
      `
    }
    const buildEntitySchema = () => {
      if (!options.typescript) return ''
      return `export const ${e.label}Schema = z.object({
        ${values}
      })`
    }
    const buildZodType = () => {
      if (!options.typescript) return ''
      return `export type ${label}Type = z.infer<typeof ${label}Schema>`
    }
    const buildNuxtMongoose = () => {
      if (options.typescript) {
        return `
        type Combined = ${label}Type & typeof Model & Document
        const ${name}: ${label}Type = {}
        export const ${label} = defineMongooseModel('${label}', {
          name: '${label}',
          schema: { ...${name} },
          options: {},
          hooks(schema) {
            schema.pre('find', function (this: Combined, next) {
              console.log('${label} hook pre find')
              next()
            })
            schema.post('find', function (docs, next) {
              console.log('${label} hook post find')
              next()
            })
          },
        })`
      }
      return `export const ${label} = mongoose.model('${label}', {
        ${this.buildMongoose(e)}
      })`
    }

    const content = `
      ${buildImports()}
      ${this.buildEnumerators(name, enumerators)}
      ${buildEntitySchema()}
      ${buildZodType()}
      ${buildNuxtMongoose()}
    `
    return content
  }

  generateFields = (fields, name) => {
    const keys = Object.keys(fields)
    const values = []
    const enumerators = []
    for (const key of keys) {
      const { type, required } = fields[key]
      if (type === 'enumerator' || type === 'enumeratorMulti') {
        let strings
        if (typeof fields[key].enumerators[0] !== 'string') {
          strings = Object.keys(fields[key].enumerators).map((k) => k)
        }
        enumerators.push({
          key,
          enumerators: strings || fields[key].enumerators,
        })
      }
      values.push(
        `${camelize(key)}: ${getType(name, type, key)}${
          !required ? '.optional()' : ''
        }`
      )
    }
    return [values, enumerators]
  }

  getType(type) {
    switch (type) {
      case 'Decimal':
        return 'Schema.Types.Decimal128'
      case 'Relation':
        return 'Schema.Types.ObjectId'
      case 'String':
        return 'String'
      case 'Boolean':
        return 'Boolean'
      case 'Date':
        return 'Date'
      case 'DateTime':
        return 'Date'
      case 'Number':
        return 'Number'
      case 'Integer':
        return 'BigInt'
    }
  }

  buildMongoose() {
    const relationMap = {
      otm: function (relation) {
        return `{ type: Schema.Types.ObjectId, ref: "${relation.name}" }`
      },
      mto: function (relation) {
        return `[{ type: Schema.Types.ObjectId, ref: '${relation.name}' }]`
      },
    }
    function buildRequired(required) {
      return `${required != undefined ? `required: ${required},` : ''}`
    }
    const values = []
    for (const f in this.e.fields) {
      const field = this.e.fields[f]
      const { type, required, enumeratorType, relation, name } = field
      const fieldName = name || f
      if (type === 'relation') {
        // 1:1, 1:many, many:1, many:many
        // Need to support all the different relationships.
        // Guarding against null values for relationships
        const fn = relationMap[type]
        if (fn) {
          let item = `${fieldName}: {
              ${buildRequired(required)}
              type: ${fn(relation)},
            }`
          values.push(item)
        }
      } else if (type == 'enumerator' || type == 'enumeratorMulti') {
        const item = `${fieldName}: {
          ${required != undefined ? `required: ${required},` : ''}
          type: [
            ${capitalize(enumeratorType)}
          ],
        }`
        values.push(item)
      } else {
        // Because FE entities dont match hardcoded entities 100% yet.
        const item = `${fieldName}: {
          type: ${this.getType(capitalize(type))},
          ${required != undefined ? `required: ${required},` : ''}
        }`
        values.push(item)
      }
    }
    return values.join(',')
  }

  buildEnumerators = (name, items) => {
    const enumeratorKeys = []
    for (const obj of items) {
      const strings = []
      for (const key in obj.enumerators) {
        const safe = Object.hasOwnProperty.call(obj.enumerators, key)
        if (safe) {
          const element = obj.enumerators[key]
          strings.push(`${element}: '${element}'`)
        }
      }
      let string = `
        ${obj.key}: {
          ${strings.join(',')}
        },
      `
      enumeratorKeys.push(string)
    }

    let keyValue = `export const ${name}Enumerators = {
    ${enumeratorKeys.join('')}
  }`

    return keyValue
  }
}
