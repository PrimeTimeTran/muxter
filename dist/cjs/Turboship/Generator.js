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
Object.defineProperty(exports, "__esModule", { value: true });
const Framework_js_1 = require("./Framework.js");
const ModelBuilder_js_1 = require("./builders/ModelBuilder.js");
class Generator {
    constructor(e, options, zip) {
        this.entities = e;
        this.options = options;
        this.zip = zip;
        this.root = `${this.options.root}${this.options.backend}`;
    }
    buildGenesis() {
        return __awaiter(this, void 0, void 0, function* () {
            const name = this.options.frameworkName;
            if (name === 'nuxt') {
                const routes = Framework_js_1.frameworkMap[this.options.backend].apiFiles;
                this.buildRoutes(routes, this.entities, this.options, this.zip);
                this.buildModels(this.entities, this.options, this.zip);
                this.buildAdminUI(this.entities, this.options, this.zip);
            }
            return this.zip;
        });
    }
    buildAdminUI(entities, options, zip) {
        try {
            let content = Framework_js_1.frameworkMap[options.backend].buildGlobalMeta(entities);
            let name = `nuxt/utils/Global.js`;
            zip.file(name, content + '}');
        }
        catch (error) {
            console.log({
                error: 'Error: buildAdminUI',
            });
        }
    }
    buildModels(entities, options, zip) {
        try {
            const backend = new ModelBuilder_js_1.ModelBuilder(entities, options);
            entities.map((e) => {
                let fullPath = `nuxt/server/models`;
                backend.e = e;
                const content = backend.buildModel();
                const name = `${fullPath}/${e.label}.model.${options.language}`;
                zip.file(name, content);
            });
        }
        catch (error) {
            console.log({
                error: 'Error: buildModels',
            });
        }
    }
    buildRoutes(routes, entities, options, zip) {
        try {
            zip.sync(() => {
                for (let e of entities) {
                    const fullPath = `/server/API/${e.plural}`;
                    console.log('fullPath');
                    for (let r of routes) {
                        const fileName = r + options.language;
                        const content = Framework_js_1.frameworkMap[options.backend]['apiContent'][r](e.label);
                        const name = `nuxt${fullPath}/${fileName}`;
                        zip.file(name, content);
                    }
                    zip.generateAsync({ type: 'nodebuffer' }).then((content) => { });
                }
                zip.generateAsync({ type: 'nodebuffer' }).then((content) => { });
            });
        }
        catch (error) {
            console.log({
                error: 'Error: buildRoutes',
            });
        }
    }
}
exports.default = Generator;
