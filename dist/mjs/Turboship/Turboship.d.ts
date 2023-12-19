export default class Turboship {
    constructor(entities: any);
    supportedFrameworks: string[];
    zip: any;
    entities: {};
    options(): import("commander").OptionValues;
    buildEntities(entities?: any[]): void;
    generate(): Promise<void>;
    report(): void;
}
