export class AdminBuilder {
    static buildAside(entities: any): string;
    constructor(entities: any, options: any, zip: any);
    entities: any;
    options: any;
    zip: any;
    root: any;
    buildAdminDirectories(zip: any): void;
    buildEntities(): void;
    e: any;
    path: string | undefined;
    buildIndexPage(): string;
    buildTable(): string;
    buildForm(): string;
    buildEntityForm(): string;
    buildEntityUseHook(): string;
    generateAdd(): string;
    generateOnMount(): string;
    generateFetch(): string;
    generatePaginationString(): string;
    generateFetchPage(): string;
    generateSort(): string;
}
//# sourceMappingURL=AdminBuilder.d.ts.map