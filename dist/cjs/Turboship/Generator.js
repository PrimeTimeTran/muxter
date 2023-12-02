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
const index_js_1 = require("./builders/index.js");
class Generator {
    constructor(e, options, zip) {
        this.entities = e;
        this.options = options;
        this.zip = zip;
        this.root = `${this.options.root}${this.options.backend}`;
    }
    buildGenesis() {
        return __awaiter(this, void 0, void 0, function* () {
            if (!backends.includes(this.options.frameworkName))
                return;
            const routes = Framework_js_1.frameworkMap[this.options.backend].apiFiles;
            buildRoutes(routes, this.entities, this.options, this.zip);
            buildModels(this.entities, this.options, this.zip);
            buildAdminUI(this.entities, this.options, this.zip);
            return this.zip;
        });
    }
}
exports.default = Generator;
function buildAdminUI(entities, options, zip) {
    entities.map((e) => __awaiter(this, void 0, void 0, function* () {
        const admin = new index_js_1.AdminBuilder(entities, options, zip);
        admin.e = e;
        let fullPath = `nuxt/components/Admin/${e.pluralL}`;
        Framework_js_1.frameworkMap[options.backend].adminUIFiles.forEach((fileName) => {
            const content = admin[Framework_js_1.frameworkMap[options.backend].adminBuildMethodMap[fileName]]();
            let name = `${fullPath}/${fileName}`;
            zip.file(name, content);
        });
        fullPath = `nuxt/pages/Administrator/${e.pluralL}`;
        let content = admin.buildIndexPage();
        let name = `${fullPath}/index.vue`;
        zip.file(name, content);
        content = admin.buildEntityUseHook();
        name = `nuxt/composables/use${capitalize(e.plural)}.${options.language}`;
        zip.file(name, content);
    }));
    const content = index_js_1.AdminBuilder.buildAside(entities);
    let name = `nuxt/components/Admin/Aside.vue`;
    zip.file(name, content);
}
function buildModels(entities, options, zip) {
    const backend = new index_js_1.ModelBuilder(entities, options);
    entities.map((e) => {
        let fullPath = `nuxt/server/models`;
        backend.e = e;
        const content = backend.buildModel();
        const name = `${fullPath}/${e.label}.model.${options.language}`;
        zip.file(name, content);
    });
}
function buildRoutes(routes, entities, options, zip) {
    zip.sync(() => {
        for (let e of entities) {
            const fullPath = `/server/API/${e.plural}`;
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
const backends = ['nuxt'];
const capitalize = (word) => {
    const firstLetter = word === null || word === void 0 ? void 0 : word.charAt(0);
    const firstLetterCap = firstLetter.toUpperCase();
    const remainingLetters = word.slice(1);
    const capitalizedWord = firstLetterCap + remainingLetters;
    return capitalizedWord;
};
