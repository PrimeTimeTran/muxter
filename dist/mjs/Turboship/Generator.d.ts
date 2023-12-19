export default class Generator {
    constructor(e: any, options: any, zip: any);
    entities: any;
    options: any;
    zip: any;
    root: string;
    buildGenesis(): Promise<any>;
    buildAdminUI(entities: any, options: any, zip: any): void;
    buildModels(entities: any, options: any, zip: any): void;
    buildRoutes(routes: any, entities: any, options: any, zip: any): void;
}
