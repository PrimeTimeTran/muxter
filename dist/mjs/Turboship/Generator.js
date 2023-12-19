import { frameworkMap } from './Framework.js';
import { ModelBuilder } from './builders/ModelBuilder.js';
export default class Generator {
    constructor(e, options, zip) {
        this.entities = e;
        this.options = options;
        this.zip = zip;
        this.root = `${this.options.root}${this.options.backend}`;
    }
    async buildGenesis() {
        const name = this.options.frameworkName;
        if (name === 'nuxt') {
            const routes = frameworkMap[this.options.backend].apiFiles;
            this.buildRoutes(routes, this.entities, this.options, this.zip);
            this.buildModels(this.entities, this.options, this.zip);
            this.buildAdminUI(this.entities, this.options, this.zip);
        }
        return this.zip;
    }
    buildAdminUI(entities, options, zip) {
        try {
            let content = frameworkMap[options.backend].buildGlobalMeta(entities);
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
            const backend = new ModelBuilder(entities, options);
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
                        const content = frameworkMap[options.backend]['apiContent'][r](e.label);
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
