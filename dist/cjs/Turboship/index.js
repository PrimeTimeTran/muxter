"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const chalk_1 = __importDefault(require("chalk"));
const jszip_sync_1 = __importDefault(require("jszip-sync"));
const commander_1 = require("commander");
const Framework_js_1 = __importDefault(require("./Framework.js"));
const seeds_js_1 = __importDefault(require("../seeds/seeds.js"));
const helpers_js_1 = require("./helpers.js");
class Turboship {
    constructor(entities) {
        this.supportedFrameworks = ['flutter', 'nuxt', 'rn'];
        this.zip = new jszip_sync_1.default();
        this.entities = {};
        this.options = this.options();
        this.buildEntities(entities);
        this.setupFrameworks(entities);
    }
    options() {
        commander_1.program
            .option('-d, --debug', 'output extra debugging')
            .option('-l, --language <type>', 'language choice', 'js')
            .option('-b, --backend <type>', 'backend choice', 'nuxt')
            .option('-m, --mobile <type>', 'mobile choice', 'flutter')
            .option('-e, --entities <letters...>', 'entities included', 'user');
        commander_1.program.parse(process.argv);
        return commander_1.program.opts();
    }
    buildEntities(entities = []) {
        const entityTemplates = ['mint', 'bank', 'lms', 'social', 'pm', 'customer'];
        const keys = Object.values(this.options.entities);
        this.entities.wizard = seeds_js_1.default['lms'][0];
        const chosen = keys.filter((k) => entityTemplates.includes(k));
        chosen.forEach((name) => {
            const collection = seeds_js_1.default[name];
            collection.forEach((e) => {
                this.entities[e.name] = e;
            });
        });
        if (Object.keys(entities).length > 0) {
            entities === null || entities === void 0 ? void 0 : entities.forEach((e) => {
                this.entities[e.name] = e;
            });
        }
    }
    setupFrameworks() {
        const keys = [this.options.backend];
        const frameworks = keys.filter((k) => this.supportedFrameworks.includes(k));
        this.entities.wizard = seeds_js_1.default['lms'][0];
        for (let framework of frameworks) {
            const fw = new Framework_js_1.default(framework, this.options, this.entities, this.zip);
            fw.createDirectories();
            fw.zipBaseDirectory();
            fw.build();
        }
    }
    report() {
        const options = commander_1.program.opts();
        console.log('\n\n');
        if (options.debug)
            console.log(options);
        console.log('\n\n');
        console.log(chalk_1.default.green.underline('Run Details:'));
        if (options.language)
            console.log(chalk_1.default['green']('language'), `- ${options.language}`);
        if (options.backend)
            console.log(chalk_1.default['green']('backend'), `- ${options.backend}`);
        if (options.mobile)
            console.log(chalk_1.default['green']('mobile'), `- ${options.mobile}`);
        if (options.entities)
            console.log(chalk_1.default['green']('entities'), `- ${options.entities}`);
        console.log('\n\n');
        (0, helpers_js_1.prettify)(this.options.root);
    }
}
exports.default = Turboship;
