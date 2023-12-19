export default class Framework {
    constructor(name: any, options: any, entities: any, zip: any);
    name: any;
    framework: any;
    zip: any;
    entities: any;
    options: any;
    createDirectories(): any;
    zipBaseDirectory(): any;
    build(): Promise<any>;
}
export namespace frameworkMap {
    namespace nuxt {
        let name: string;
        let version: string;
        let adminUIFiles: string[];
        let apiFiles: string[];
        function buildGlobalMeta(entities: any): string;
        let rootDirectories: string[];
        let apiContent: {
            'index.get.': (label: any) => string;
            'index.post.': (label: any) => string;
            '[_id].delete.': (label: any) => string;
            '[_id].get.': (label: any) => string;
            '[_id].put.': (label: any) => string;
        };
    }
    namespace flutter {
        let name_1: string;
        export { name_1 as name };
        let version_1: string;
        export { version_1 as version };
        let rootDirectories_1: string[];
        export { rootDirectories_1 as rootDirectories };
    }
}
