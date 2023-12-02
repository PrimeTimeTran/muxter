export const Delivery: {
    _id: string;
    name: string;
    plural: string;
    label: string;
    pluralL: string;
    attributes: ({
        name: string;
        type: string;
        _id: string;
        validators: never[];
        validations: never[];
        label: string;
        relation?: undefined;
        options?: undefined;
    } | {
        name: string;
        type: string;
        _id: string;
        validators: string[];
        validations: never[];
        relation: {
            type: null;
            name: null;
        };
        label: string;
        options?: undefined;
    } | {
        name: string;
        type: string;
        _id: string;
        validators: never[];
        validations: never[];
        options: string;
        relation: {
            type: null;
            name: null;
        };
        label: string;
    })[];
}[];
//# sourceMappingURL=Delivery.d.ts.map