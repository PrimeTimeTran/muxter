export class AdminBuilder {
    constructor(entities: any, options: any, zip: any);
    entities: any;
    options: any;
    zip: any;
    root: string;
    buildAdminDirectories(zip: any): void;
    buildEntityUseHook(): string;
    generateAdd(): string;
    generateOnMount(): string;
    generateFetch(): string;
    generatePaginationString(): string;
    generateFetchPage(): string;
    generateSort(): string;
}
