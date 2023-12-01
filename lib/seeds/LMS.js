// https://www.bezkoder.com/mongodb-many-to-many-mongoose/#Mongoose_Many-to-Many_Relationship_example
export const LMS = [
  {
    name: 'wizard',
    label: 'Wizard',
    plural: 'wizards',
    pluralL: 'Wizards',
    tableFields: [
      'email',
      'firstName',
      'lastName',
      'house',
      'topSpells',
      'bookAppearances',
      'city',
      'country',
      'jobTitle',
      'industry',
      'patronus',
      'potions',
      'charms',
      'apparition',
      'dada',
      'gender',
      'fanScore',
    ],
    fields: {
      email: {
        label: 'Email',
        type: 'string',
        required: true,
        placeholder: 'hp87@hogwarts.com',
      },
      firstName: {
        label: 'First Name',
        type: 'string',
        required: true,
        placeholder: 'Harry',
      },
      lastName: {
        label: 'Last Name',
        type: 'string',
        required: true,
        placeholder: 'Potter',
      },
      house: {
        required: true,
        multiselect: false,
        type: 'enumerator',
        label: 'House',
        enumeratorType: 'string',
        placeholder: 'Select House',
        enumerators: {
          gryffindor: {
            val: 'Gryffindor',
            color: 'red',
          },
          slytherin: {
            val: 'Slytherin',
            color: 'green',
          },
          hufflepuff: {
            val: 'Hufflepuff',
            color: 'pink',
          },
          ravenclaw: {
            val: 'Ravenclaw',
            color: 'purple',
          },
          unknown: {
            val: 'Unknown',
            color: 'yellow',
          },
        },
      },
      city: {
        label: 'City',
        type: 'string',
        required: true,
        placeholder: 'London',
      },
      country: {
        label: 'Country',
        type: 'string',
        required: true,
        placeholder: 'United Kingdom',
      },
      jobTitle: {
        label: 'Role',
        type: 'string',
        required: true,
        placeholder: 'Auror',
      },
      industry: {
        label: 'Industry',
        type: 'string',
        required: true,
        placeholder: 'Defense',
      },
      patronus: {
        label: 'Patronus',
        type: 'string',
        required: true,
        placeholder: 'Stag',
      },
      potions: {
        min: 0,
        max: 10,
        label: 'Potions',
        type: 'number',
        required: true,
        placeholder: '10',
      },
      charms: {
        min: 0,
        max: 10,
        label: 'Charms',
        type: 'number',
        required: true,
        placeholder: '10',
      },
      dada: {
        min: 0,
        max: 10,
        label: 'D.A.D.A',
        type: 'number',
        required: true,
        placeholder: '10',
      },
      gender: {
        type: 'boolean',
        label: 'Gender',
        required: true,
        multiselect: false,
        placeholder: 'Select a gender',
        enumerators: {
          m: 'Male',
          f: 'Female',
        },
      },
      apparition: {
        type: 'boolean',
        label: 'Apparate?',
        multiselect: false,
        placeholder: 'Select apparition',
        enumerators: {
          true: 'Yes',
          false: 'No',
        },
      },
      fanScore: {
        type: 'number',
        default: 10,
        label: 'Fan Score',
        required: false,
        placeholder: '10',
      },
      avatarUrl: {
        label: 'Avatar',
        type: 'string',
        required: true,
        placeholder: 'https://mypic.com',
      },
      topSpells: {
        required: true,
        type: 'enumerator',
        label: 'Top Spells',
        multiselect: true,
        enumeratorType: 'string',
        placeholder: 'Select One',
        enumeratorColors: [],
        colorsGrouped: true,
        enumerators: {
          jinxes: {
            val: 'jinxes',
          },
          hexes: {
            val: 'hexes',
          },
          charms: {
            val: 'charms',
          },
          curses: {
            val: 'curses',
          },
          spells: {
            val: 'spells',
          },
          counters: {
            val: 'counters',
          },
          healing: {
            val: 'healing',
          },
          transfigurations: {
            val: 'transfigurations',
          },
        },
      },
      bookAppearances: {
        required: true,
        type: 'enumerator',
        multiselect: true,
        label: 'Book Appearances',
        enumeratorType: 'string',
        placeholder: 'Select Multiple',
        enumeratorColors: [],
        colorsGrouped: false,
        enumerators: {
          1: {
            val: '1',
          },
          2: {
            val: '2',
          },
          3: {
            val: '3',
          },
          4: {
            val: '4',
          },
          5: {
            val: '5',
          },
          6: {
            val: '6',
          },
          7: {
            val: '7',
          },
          8: {
            val: '8',
          },
        },
      },
    },
  },
]
