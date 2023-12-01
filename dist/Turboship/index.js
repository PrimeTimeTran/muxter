"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _chalk = _interopRequireDefault(require("chalk"));
var _jszipSync = _interopRequireDefault(require("jszip-sync"));
var _commander = require("commander");
var _Framework = _interopRequireDefault(require("./Framework.js"));
var _seeds = _interopRequireDefault(require("../seeds/seeds.js"));
var _helpers = require("./helpers.js");
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }
// 1. Make Turboship wrap JSZip
// Have Turboship use JSZip to build source files, generate zip, return it
// Impossible to format?

class Turboship {
  supportedFrameworks = ['flutter', 'nuxt', 'rn'];
  constructor(entities) {
    this.zip = new _jszipSync.default();
    this.entities = {};
    this.options = this.options();
    this.buildEntities(entities);
    this.setupFrameworks(entities);
  }
  options() {
    _commander.program.option('-d, --debug', 'output extra debugging').option('-l, --language <type>', 'language choice', 'js').option('-b, --backend <type>', 'backend choice', 'nuxt').option('-m, --mobile <type>', 'mobile choice', 'flutter').option('-e, --entities <letters...>', 'entities included', 'user');
    _commander.program.parse(process.argv);
    return _commander.program.opts();
  }
  buildEntities(entities = []) {
    const entityTemplates = ['mint', 'bank', 'lms', 'social', 'pm', 'customer'];
    const keys = Object.values(this.options.entities);
    this.entities.wizard = _seeds.default['lms'][0];
    const chosen = keys.filter(k => entityTemplates.includes(k));
    chosen.forEach(name => {
      const collection = _seeds.default[name];
      collection.forEach(e => {
        this.entities[e.name] = e;
      });
    });
    if (Object.keys(entities).length > 0) {
      entities == null || entities.forEach(e => {
        this.entities[e.name] = e;
      });
    }
  }
  setupFrameworks() {
    const keys = [this.options.backend];
    const frameworks = keys.filter(k => this.supportedFrameworks.includes(k));
    this.entities.wizard = _seeds.default['lms'][0];
    for (let framework of frameworks) {
      const fw = new _Framework.default(framework, this.options, this.entities, this.zip);
      fw.createDirectories();
      fw.zipBaseDirectory();
      fw.build();
    }
  }
  report() {
    const options = _commander.program.opts();
    console.log('\n\n');
    if (options.debug) console.log(options);
    console.log('\n\n');
    console.log(_chalk.default.green.underline('Run Details:'));
    if (options.language) console.log(_chalk.default['green']('language'), `- ${options.language}`);
    if (options.backend) console.log(_chalk.default['green']('backend'), `- ${options.backend}`);
    if (options.mobile) console.log(_chalk.default['green']('mobile'), `- ${options.mobile}`);
    if (options.entities) console.log(_chalk.default['green']('entities'), `- ${options.entities}`);
    console.log('\n\n');
    (0, _helpers.prettify)(this.options.root);
  }
}
exports.default = Turboship;