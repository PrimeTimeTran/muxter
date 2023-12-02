export const RealEstate: ({
    _id: string;
    name: string;
    plural: string;
    label: string;
    pluralL: string;
    attributes: ({
        name: string;
        type: string;
        _id: string;
        validators: string[];
        validations: never[];
        options?: undefined;
        relation?: undefined;
    } | {
        name: string;
        type: string;
        _id: string;
        validators: never[];
        validations: never[];
        options: string;
        relation?: undefined;
    } | {
        validators: never[];
        validations: never[];
        name: string;
        _id: string;
        relation: {
            type: null;
            name: null;
        };
        type: string;
        options?: undefined;
    } | {
        validators: never[];
        validations: never[];
        name: string;
        _id: string;
        relation: {
            type: null;
            name: null;
        };
        type: string;
        options: string;
    })[];
} | {
    name: string;
    label: string;
    plural: string;
    attributes: ({
        validators: never[];
        validations: never[];
        type: string;
        name: string;
        _id: string;
        relation?: undefined;
    } | {
        validators: never[];
        validations: never[];
        name: string;
        _id: string;
        relation: {
            type: string;
            name: string;
        };
        type: string;
    })[];
    _id: string;
    pluralL?: undefined;
})[];
