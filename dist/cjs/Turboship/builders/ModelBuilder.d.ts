export class ModelBuilder {
    constructor(entities: any, options: any);
    entities: any;
    options: any;
    path: string;
    getModelPath(): string;
    buildEntities: () => void;
    e: any;
    buildTransformation(attributes: any): {};
    buildModel: () => string;
    generateFields: (fields: any, name: any) => (string[] | {
        key: string;
        enumerators: any;
    }[])[];
    getType(type: any): "Schema.Types.Decimal128" | "Schema.Types.ObjectId" | "String" | "Boolean" | "Date" | "Number" | "BigInt" | undefined;
    buildMongoose(): string;
    buildEnumerators: (name: any, items: any) => string;
}
