export const Social: ({
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
} | {
    name: string;
    label: string;
    plural: string;
    pluralL: string;
    attributes: ({
        validators: never[];
        validations: never[];
        type: string;
        name: string;
        _id: string;
        relation: {
            type: null;
            name: null;
        };
        label: string;
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
        label: string;
    })[];
    _id: string;
})[];
