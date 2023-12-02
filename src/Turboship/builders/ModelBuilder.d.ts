export class ModelBuilder {
    constructor(entities: any, options: any);
    entities: any;
    options: any;
    path: any;
    getModelPath(): any;
    buildEntities: () => void;
    e: any;
    buildTransformation(attributes: any): {};
    buildModel: () => string;
    generateFields: (fields: any, name: any) => (string[] | {
        key: string;
        enumerators: any;
    }[])[];
    getType(type: any): "Number" | "Schema.Types.Decimal128" | "Schema.Types.ObjectId" | "String" | "Boolean" | "Date" | "BigInt" | undefined;
    buildMongoose(): string;
    buildEnumerators: (name: any, items: any) => string;
}
//# sourceMappingURL=ModelBuilder.d.ts.map