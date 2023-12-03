"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ModelBuilder = void 0;
const path_1 = __importDefault(require("path"));
const helpers_js_1 = require("../helpers.js");
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
            if (name == 'wizard') {
                fields = this.e.fields;
            }
            else {
                fields = this.buildTransformation(attributes);
            }
            const [values, enumerators] = this.generateFields(fields, name);
            const buildImports = () => {
                if (options.typescript) {
                    return `
        import { z } from 'zod'
        import { Model, Document } from 'mongoose'
        import { defineMongooseModel } from '#nuxt/mongoose'
        `;
                }
                return `
      import mongoose, { Schema } from 'mongoose'
      `;
            };
            const buildEntitySchema = () => {
                if (!options.typescript)
                    return '';
                return `export const ${e.label}Schema = z.object({
        ${values}
      })`;
            };
            const buildZodType = () => {
                if (!options.typescript)
                    return '';
                return `export type ${label}Type = z.infer<typeof ${label}Schema>`;
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
                return `export const ${label} = mongoose.model('${label}', {
        ${this.buildMongoose(e)}
      })`;
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
                if (type === 'enumerator' || type === 'enumeratorMulti') {
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
        // Get the current working directory
        const currentWorkingDir = process.cwd();
        // Calculate the path to the Models directory
        return path_1.default.join(currentWorkingDir, 'src', 'Models');
    }
    buildTransformation(attributes) {
        const fields = {};
        if (attributes) {
            attributes.forEach((f) => {
                var _a;
                if (f.name !== '_id') {
                    fields[f.name] = Object.assign({}, f);
                    delete fields[f.name]._id;
                    if (f.type === 'enumerator' || f.type === 'enumeratorMulti') {
                        fields[f.name].enumeratorType = 'string';
                        fields[f.name].enumerators = {};
                        const options = (_a = f.options) === null || _a === void 0 ? void 0 : _a.split(',');
                        if (options) {
                            options.forEach((o) => {
                                fields[f.name].enumerators[o] = {
                                    val: o,
                                    color: null,
                                };
                            });
                        }
                    }
                }
            });
            this.e.fields = fields;
            this.e.tableFields = Object.keys(fields);
        }
        return fields;
    }
    getType(type) {
        switch (type) {
            case 'Decimal':
                return 'Schema.Types.Decimal128';
            case 'Relation':
                return 'Schema.Types.ObjectId';
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
            case 'Map':
                return 'Map';
            case 'Integer':
                return 'BigInt';
        }
    }
    buildMongoose() {
        function getRelationType(name) {
            return `{ type: Schema.Types.ObjectId, ref: "${(0, helpers_js_1.capitalize)(name)}" }`;
        }
        const relationMap = {
            otm: function (relation) {
                return `[${getRelationType(relation.name)}]`;
            },
            oto: function (relation) {
                return `${getRelationType(relation.name)}`;
            },
            mto: function (relation) {
                return `${getRelationType(relation.name)}`;
            },
            mtm: function (relation) {
                return `[${getRelationType(relation.name)}]`;
            },
        };
        function buildRequired(required) {
            return `${required != undefined ? `required: ${required},` : ''}`;
        }
        const values = [];
        for (const f in this.e.fields) {
            const field = this.e.fields[f];
            const { type, required, enumeratorType, relation, name } = field;
            const fieldName = name || f;
            if (type === 'relation') {
                const fn = relationMap[relation.type];
                if (fn) {
                    let item = `${fieldName}: {
              ${buildRequired(required)}
              type: ${fn(relation)},
            }`;
                    values.push(item);
                }
            }
            else if (type == 'enumerator' || type == 'enumeratorMulti') {
                function getEnumType(t) {
                    if (t === 'enumerator')
                        return `${(0, helpers_js_1.capitalize)(enumeratorType)}`;
                    if (t === 'enumeratorMulti')
                        return `[${(0, helpers_js_1.capitalize)(enumeratorType)}]`;
                }
                const item = `${fieldName}: {
          ${required != undefined ? `required: ${required},` : ''}
          type: ${getEnumType(type)},
        }`;
                values.push(item);
            }
            else {
                // Because FE entities dont match hardcoded entities 100% yet.
                const item = `${fieldName}: {
          type: ${this.getType((0, helpers_js_1.capitalize)(type))},
          ${required != undefined ? `required: ${required},` : ''}
        }`;
                values.push(item);
            }
        }
        return values.join(',');
    }
}
exports.ModelBuilder = ModelBuilder;
// let shown = false
