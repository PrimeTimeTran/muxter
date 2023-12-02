export const LMS: {
    name: string;
    label: string;
    plural: string;
    pluralL: string;
    tableFields: string[];
    fields: {
        email: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        firstName: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        lastName: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        house: {
            required: boolean;
            multiselect: boolean;
            type: string;
            label: string;
            enumeratorType: string;
            placeholder: string;
            enumerators: {
                gryffindor: {
                    val: string;
                    color: string;
                };
                slytherin: {
                    val: string;
                    color: string;
                };
                hufflepuff: {
                    val: string;
                    color: string;
                };
                ravenclaw: {
                    val: string;
                    color: string;
                };
                unknown: {
                    val: string;
                    color: string;
                };
            };
        };
        city: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        country: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        jobTitle: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        industry: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        patronus: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        potions: {
            min: number;
            max: number;
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        charms: {
            min: number;
            max: number;
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        dada: {
            min: number;
            max: number;
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        gender: {
            type: string;
            label: string;
            required: boolean;
            multiselect: boolean;
            placeholder: string;
            enumerators: {
                m: string;
                f: string;
            };
        };
        apparition: {
            type: string;
            label: string;
            multiselect: boolean;
            placeholder: string;
            enumerators: {
                true: string;
                false: string;
            };
        };
        fanScore: {
            type: string;
            default: number;
            label: string;
            required: boolean;
            placeholder: string;
        };
        avatarUrl: {
            label: string;
            type: string;
            required: boolean;
            placeholder: string;
        };
        topSpells: {
            required: boolean;
            type: string;
            label: string;
            multiselect: boolean;
            enumeratorType: string;
            placeholder: string;
            enumeratorColors: never[];
            colorsGrouped: boolean;
            enumerators: {
                jinxes: {
                    val: string;
                };
                hexes: {
                    val: string;
                };
                charms: {
                    val: string;
                };
                curses: {
                    val: string;
                };
                spells: {
                    val: string;
                };
                counters: {
                    val: string;
                };
                healing: {
                    val: string;
                };
                transfigurations: {
                    val: string;
                };
            };
        };
        bookAppearances: {
            required: boolean;
            type: string;
            multiselect: boolean;
            label: string;
            enumeratorType: string;
            placeholder: string;
            enumeratorColors: never[];
            colorsGrouped: boolean;
            enumerators: {
                1: {
                    val: string;
                };
                2: {
                    val: string;
                };
                3: {
                    val: string;
                };
                4: {
                    val: string;
                };
                5: {
                    val: string;
                };
                6: {
                    val: string;
                };
                7: {
                    val: string;
                };
                8: {
                    val: string;
                };
            };
        };
    };
}[];
//# sourceMappingURL=LMS.d.ts.map