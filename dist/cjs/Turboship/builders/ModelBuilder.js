"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ModelBuilder = void 0;
const path_1 = __importDefault(require("path"));
const helpers_js_1 = require("../helpers.js");
class Type {
}
Type.enums = ['enumerator', 'enumeratorMulti'];
class ModelBuilder {
    constructor(entities, options) {
        this.buildEntities = () => {
            this.entities.map((e) => {
                this.e = e;
                this.buildModel();
            });
        };
        this.buildModel = () => {
            const { e, options, e: { name, label, attributes }, } = this;
            let fields;
            fields = this.buildTransformation(attributes);
            const [values, enumerators] = this.generateFields(fields, name);
            const buildImports = () => {
                if (options.typescript) {
                    return `
        import { z } from 'zod'
        import { Model, Document } from 'mongoose'
        import { defineMongooseModel } from '#nuxt/mongoose'
        import { Auditor } from './Audit/Audit'
        `;
                }
                return `
      import mongoose, { Schema } from 'mongoose'
      import { Auditor } from './Audit/Audit'
      `;
            };
            const buildEntitySchema = () => {
                if (options.typescript) {
                    return `export const ${e.label}Schema = z.object({
          ${values}
        })`;
                }
                return '';
            };
            const buildZodType = () => {
                if (options.typescript) {
                    return `export type ${label}Type = z.infer<typeof ${label}Schema>`;
                }
                return '';
            };
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
            Auditor.addHooks(schema)
            schema.pre('find', function (this: Combined, next) {
              console.log('${label} hook pre find')
              next()
            })
            schema.post('find', function (docs, next) {
              console.log('${label} hook post find')
              next()
            })
          },
        })`;
                }
                return `const ${name}Schema = new Schema({
          ${this.buildSchema(e)}
        })
        Auditor.addHooks(${name}Schema)
        export { ${name}Schema }
        export const ${label} = mongoose.model('${label}', ${name}Schema)
      `;
            };
            const content = `
      ${buildImports()}
      ${this.buildEnumerators(name, enumerators)}
      ${buildEntitySchema()}
      ${buildZodType()}
      ${buildNuxtMongoose()}
    `;
            return content;
        };
        this.generateFields = (fields, name) => {
            const keys = Object.keys(fields);
            const values = [];
            const enumerators = [];
            for (const key of keys) {
                const { type, required } = fields[key];
                if (Type.enums.includes(type)) {
                    let strings;
                    if (typeof fields[key].enumerators[0] !== 'string') {
                        strings = Object.keys(fields[key].enumerators).map((k) => k);
                    }
                    enumerators.push({
                        key,
                        enumerators: strings || fields[key].enumerators,
                    });
                }
                values.push(`${(0, helpers_js_1.camelize)(key)}: ${(0, helpers_js_1.getType)(name, type, key)}${!required ? '.optional()' : ''}`);
            }
            return [values, enumerators];
        };
        this.buildEnumerators = (name, items) => {
            const enumeratorKeys = [];
            for (const obj of items) {
                const strings = [];
                for (const key in obj.enumerators) {
                    const safe = Object.hasOwnProperty.call(obj.enumerators, key);
                    if (safe) {
                        const element = obj.enumerators[key];
                        strings.push(`${element}: '${element}'`);
                    }
                }
                let string = `
        ${obj.key}: {
          ${strings.join(',')}
        },
      `;
                enumeratorKeys.push(string);
            }
            let keyValue = `export const ${name}Enumerators = {
    ${enumeratorKeys.join('')}
  }`;
            return keyValue;
        };
        this.entities = entities;
        this.options = options;
        this.path = this.getModelPath();
    }
    getModelPath() {
        const currentWorkingDir = process.cwd();
        return path_1.default.join(currentWorkingDir, 'src', 'Models');
    }
    buildTransformation(attributes) {
        const fields = {};
        if (attributes) {
            attributes.forEach((f) => {
                var _a;
                if (f.name !== '_id') {
                    let field = {};
                    field = Object.assign({}, f);
                    delete field._id;
                    if (Type.enums.includes(field.type)) {
                        field.enumerators = {};
                        field.enumeratorType = 'string';
                        const options = (_a = field.options) === null || _a === void 0 ? void 0 : _a.split(',');
                        if (options) {
                            field.options = field.options;
                            options.forEach((o) => {
                                field.enumerators[o] = {
                                    val: o,
                                    color: null,
                                };
                            });
                        }
                    }
                    fields[f.name] = field;
                }
            });
            this.e.fields = fields;
            this.e.tableFields = Object.keys(fields);
        }
        return fields;
    }
    getType(type) {
        switch (type) {
            case 'Boolean':
                return 'Boolean';
            case 'String':
                return 'String';
            case 'Text':
                return 'String';
            case 'Boolean':
                return 'Boolean';
            case 'Date':
                return 'Date';
            case 'DateTime':
                return 'Date';
            case 'Number':
                return 'Number';
            case 'Integer':
                return 'BigInt';
            case 'Decimal':
                return 'Schema.Types.Decimal128';
            case 'Map':
                return 'Map';
            case 'Array':
                return '[]';
            case 'Relation':
                return 'Schema.Types.ObjectId';
        }
    }
    buildSchema() {
        function buildRequired(required) {
            return required ? `required: ${required},` : '';
        }
        const values = [];
        for (const f in this.e.fields) {
            const field = this.e.fields[f];
            const { type, required, enumeratorType, relation, name, options } = field;
            const fieldName = name || f;
            let item;
            if (type === 'relation') {
                item = '';
                let relationType = relation.type;
                if (relationType === 'mto' || relationType === 'oto') {
                    item = `${name}: { type: Schema.Types.ObjectId, ref: '${(0, helpers_js_1.capitalize)(name)}', ${buildRequired(required)} }`;
                }
                else {
                    item = `${name}: [{ type: Schema.Types.ObjectId, ref: '${(0, helpers_js_1.capitalize)(name)}' }]`;
                }
            }
            else if (Type.enums.includes(type)) {
                function getEnumType(t) {
                    const name = (0, helpers_js_1.capitalize)(enumeratorType);
                    return t === 'enumerator' ? name : `[${name}]`;
                }
                item = `${fieldName}: {
          ${buildRequired(required)}
          type: ${getEnumType(type)},
          enum: [${options.split(',').map((i) => `'${i.trim()}'`)}]
        }`;
            }
            else {
                let kind = this.getType((0, helpers_js_1.capitalize)(type));
                item = `${fieldName}: {
          type: ${kind},
          ${kind === 'Map' ? 'of: String,' : ''}
          ${buildRequired(required)}
        }`;
            }
            values.push(item);
        }
        return values.join(',');
    }
}
exports.ModelBuilder = ModelBuilder;
