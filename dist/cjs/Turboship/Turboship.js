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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Turboship = void 0;
const chalk_1 = __importDefault(require("chalk"));
const jszip_sync_1 = __importDefault(require("jszip-sync"));
const commander_1 = require("commander");
const Framework_js_1 = __importDefault(require("./Framework.js"));
const helpers_js_1 = require("./helpers.js");
class Turboship {
    constructor(entities) {
        this.supportedFrameworks = ['flutter', 'nuxt', 'rn'];
        this.zip = new jszip_sync_1.default();
        this.entities = {};
        this.options = this.options();
        this.buildEntities(entities);
        this.generate(entities);
    }
    options() {
        commander_1.program
            .option('-d, --debug', 'output extra debugging')
            .option('-l, --language <type>', 'language choice', 'js')
            .option('-b, --backend <type>', 'backend choice', 'nuxt')
            .option('-m, --mobile <type>', 'mobile choice', 'flutter')
            .option('-e, --entities <letters...>', 'entities included', 'user');
        commander_1.program.parse(process.argv);
        let options = commander_1.program.opts();
        options.isDev = false;
        options.logLevelDebug = false;
        return options;
    }
    buildEntities(entities = []) {
        if (Object.keys(entities).length > 0) {
            entities === null || entities === void 0 ? void 0 : entities.forEach((e) => {
                this.entities[e.name] = e;
            });
        }
    }
    generate() {
        return __awaiter(this, void 0, void 0, function* () {
            // Fixed race condition by adding an await
            const keys = [this.options.backend, this.options.mobile];
            const frameworks = keys.filter((k) => this.supportedFrameworks.includes(k));
            try {
                for (let framework of frameworks) {
                    if (this.options.logLevelDebug)
                        console.log('generate: ', framework);
                    const fw = new Framework_js_1.default(framework, this.options, this.entities, this.zip);
                    fw.createDirectories();
                    fw.zipBaseDirectory();
                    yield fw.build();
                }
            }
            catch (error) {
                console.log({
                    error,
                    error: 'generate',
                });
            }
        });
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
exports.Turboship = Turboship;
