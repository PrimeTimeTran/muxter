import chalk from 'chalk';
import JSZip from 'jszip-sync';
import { program } from 'commander';
import Framework from './Framework.js';
import { prettify } from './helpers.js';
export default class Turboship {
    supportedFrameworks = ['flutter', 'nuxt', 'rn'];
    constructor(entities) {
        this.zip = new JSZip();
        this.entities = {};
        this.options = this.options();
        this.buildEntities(entities);
        this.generate(entities);
    }
    options() {
        program
            .option('-d, --debug', 'output extra debugging')
            .option('-l, --language <type>', 'language choice', 'js')
            .option('-b, --backend <type>', 'backend choice', 'nuxt')
            .option('-m, --mobile <type>', 'mobile choice', 'flutter')
            .option('-e, --entities <letters...>', 'entities included', 'user');
        program.parse(process.argv);
        let options = program.opts();
        options.isDev = false;
        options.logLevelDebug = false;
        return options;
    }
    buildEntities(entities = []) {
        if (Object.keys(entities).length > 0) {
            entities?.forEach((e) => {
                this.entities[e.name] = e;
            });
        }
    }
    async generate() {
        // Fixed race condition by adding an await
        const keys = [this.options.backend, this.options.mobile];
        const frameworks = keys.filter((k) => this.supportedFrameworks.includes(k));
        try {
            for (let framework of frameworks) {
                if (this.options.logLevelDebug)
                    console.log('generate: ', framework);
                const fw = new Framework(framework, this.options, this.entities, this.zip);
                fw.createDirectories();
                fw.zipBaseDirectory();
                await fw.build();
            }
        }
        catch (error) {
            console.log({
                error,
                error: 'generate',
            });
        }
    }
    report() {
        const options = program.opts();
        console.log('\n\n');
        if (options.debug)
            console.log(options);
        console.log('\n\n');
        console.log(chalk.green.underline('Run Details:'));
        if (options.language)
            console.log(chalk['green']('language'), `- ${options.language}`);
        if (options.backend)
            console.log(chalk['green']('backend'), `- ${options.backend}`);
        if (options.mobile)
            console.log(chalk['green']('mobile'), `- ${options.mobile}`);
        if (options.entities)
            console.log(chalk['green']('entities'), `- ${options.entities}`);
        console.log('\n\n');
        prettify(this.options.root);
    }
}
export { Turboship };
