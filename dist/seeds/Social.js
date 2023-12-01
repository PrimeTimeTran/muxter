// https://www.bezkoder.com/mongodb-many-to-many-mongoose/#Mongoose_Many-to-Many_Relationship_example
export var Social = [{
  _id: 'fb80c35deae8c1d25f4acbbd',
  name: 'user',
  plural: 'users',
  label: 'User',
  pluralL: 'Users',
  attributes: [{
    name: '_id',
    type: 'string',
    _id: '5f6ab0bbfb54cf51242ddb6a',
    validators: [],
    validations: [],
    label: '_id'
  }, {
    name: 'email',
    type: 'string',
    _id: '0ca1c138ce4ddacdcbbc49d6',
    validators: ['email', 'unique'],
    validations: [],
    relation: {
      type: null,
      name: null
    },
    label: 'Email'
  }, {
    name: 'firstName',
    type: 'string',
    _id: '5aab0a1efa84976ab3afea9e',
    validators: [],
    validations: [],
    relation: {
      type: null,
      name: null
    },
    label: 'FirstName'
  }, {
    name: 'lastName',
    type: 'string',
    _id: '040e9eeeec2ae4eb4fd1946e',
    validators: [],
    validations: [],
    relation: {
      type: null,
      name: null
    },
    label: 'LastName'
  }, {
    name: 'age',
    type: 'number',
    _id: 'dcb9b448e5bce7c8bdea1ece',
    validators: [],
    validations: [],
    relation: {
      type: null,
      name: null
    },
    label: 'Age'
  }, {
    name: 'status',
    type: 'enumerator',
    _id: '077cb5ead63ef967d1adcc2c',
    validators: [],
    validations: [],
    options: 'open,closed,pending',
    relation: {
      type: null,
      name: null
    },
    label: 'Status'
  }, {
    validators: [],
    validations: [],
    name: 'avatarUrl',
    _id: '7cb7838708b53d78de6bfdee',
    relation: {
      type: null,
      name: null
    },
    type: 'string',
    label: 'AvatarUrl'
  }, {
    validators: [],
    validations: [],
    name: 'city',
    _id: 'a3aef9ecb114efde29c0aed6',
    relation: {
      type: null,
      name: null
    },
    type: 'string',
    label: 'City'
  }, {
    validators: [],
    validations: [],
    name: 'country',
    _id: 'fdbd3ba3d4f1bbbbc7cfcfca',
    relation: {
      type: null,
      name: null
    },
    type: 'string',
    label: 'Country'
  }, {
    validators: [],
    validations: [],
    name: 'dob',
    _id: 'dae869bbcacb1ba1defc6ae1',
    relation: {
      type: null,
      name: null
    },
    type: 'date',
    label: 'Dob'
  }, {
    validators: [],
    validations: [],
    name: 'status',
    _id: 'deaa69fd5793cf29f62da810',
    relation: {
      type: null,
      name: null
    },
    type: 'enumerator',
    options: 'pending,active,closed,deactivated,blocked',
    label: 'Status'
  }, {
    validators: [],
    validations: [],
    name: 'username',
    _id: 'c16ee76ee14ce9f8c818dca3',
    relation: {
      type: null,
      name: null
    },
    type: 'string',
    label: 'Username'
  }]
}, {
  name: 'post',
  label: 'Post',
  plural: 'posts',
  pluralL: 'Posts',
  attributes: [{
    validators: [],
    validations: [],
    type: 'text',
    name: 'body',
    _id: 'b2f7ba1d54e96efde13eb8cb',
    relation: {
      type: null,
      name: null
    },
    label: 'Body'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'user',
    _id: 'edc7cb110e4ddcabd5a56e9b',
    relation: {
      type: null,
      name: null
    },
    label: 'User'
  }, {
    validators: [],
    validations: [],
    type: 'otm',
    name: 'comments',
    _id: 'c95a6dabb57da6faed231683',
    relation: {
      type: null,
      name: null
    },
    label: 'Comments'
  }, {
    validators: [],
    validations: [],
    type: 'otm',
    name: 'reactions',
    _id: 'bcb7aaf6a9c84ec2d3c4fae1',
    relation: {
      type: null,
      name: null
    },
    label: 'Reactions'
  }, {
    validators: [],
    validations: [],
    type: 'otm',
    name: 'photos',
    _id: 'ee2dba55b09fabf3901ab6c7',
    relation: {
      type: null,
      name: null
    },
    label: 'Photos'
  }],
  _id: '59abcbce7aeedbbcd5d90b93'
}, {
  name: 'comment',
  label: 'Comment',
  plural: 'comments',
  attributes: [{
    validators: [],
    validations: [],
    type: 'text',
    name: 'body',
    _id: 'fe3dd5eceafdc7a6cdccc334',
    relation: {
      type: null,
      name: null
    },
    label: 'Body'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'user',
    _id: 'eca50236bd43c6ad2b975a2d',
    relation: {
      type: null,
      name: null
    },
    label: 'User'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'commentableId',
    _id: 'fd2cb3c1df7db98edc76af50',
    relation: {
      type: null,
      name: null
    },
    label: 'CommentableId'
  }, {
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'commentableType',
    _id: 'aa62baeb3f95cade5d9cd459',
    relation: {
      type: null,
      name: null
    },
    label: 'CommentableType'
  }],
  _id: '36f6b641c611311ad6d9d9b4'
}, {
  name: 'friendship',
  label: 'Friendship',
  plural: 'friendships',
  attributes: [{
    validators: [],
    validations: [],
    type: 'mto',
    name: 'friendee',
    _id: '0c1d99cbd9c65b3fc75b5dcb',
    relation: {
      type: null,
      name: null
    },
    label: 'Friendee'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'friender',
    _id: '48aceeaefd9fbbcebb8dadec',
    relation: {
      type: null,
      name: null
    },
    label: 'Friender'
  }, {
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'status',
    _id: '4efca2607c4b36f0fba7a462',
    relation: {
      type: null,
      name: null
    },
    label: 'Status'
  }],
  _id: '58884c95004bad8e56ddaecd'
}, {
  name: 'reaction',
  label: 'Reaction',
  plural: 'reactions',
  attributes: [{
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'type',
    _id: 'f8499edfb24acffab5dbbccc',
    relation: {
      type: null,
      name: null
    },
    label: 'Type'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'reactionableId',
    _id: '61da4cc07fe4e3eeca9fd24c',
    relation: {
      type: null,
      name: null
    },
    label: 'ReactionableId'
  }, {
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'reactionableType',
    _id: '3b59b198cd3e54ced00d7ad2',
    relation: {
      type: null,
      name: null
    },
    label: 'ReactionableType'
  }],
  _id: '7e0d6abf4ae4baa8aeb165ac'
}, {
  name: 'chat',
  label: 'Chat',
  plural: 'chats',
  attributes: [{
    validators: [],
    validations: [],
    type: 'string',
    name: 'name',
    _id: 'c24eb6fe35fcbacd464ec82f',
    relation: {
      type: null,
      name: null
    },
    label: 'Name'
  }, {
    validators: [],
    validations: [],
    type: 'otm',
    name: 'messages',
    _id: '95aadabdc4acebdd5497fa73',
    relation: {
      type: null,
      name: null
    },
    label: 'Messages'
  }, {
    validators: [],
    validations: [],
    type: 'otm',
    name: 'users',
    _id: 'efa1ecf6c3cc1c9c16eacaa7',
    relation: {
      type: null,
      name: null
    },
    label: 'Users'
  }, {
    validators: [],
    validations: [],
    name: 'userChats',
    _id: 'bf80be6ae277e4194ee12ebe',
    relation: {
      type: 'otm',
      name: 'userChat'
    },
    type: 'relation',
    label: 'UserChats'
  }],
  _id: 'cc5a2aa3335b281e4cfddd13'
}, {
  name: 'userChat',
  label: 'UserChat',
  plural: 'userChats',
  attributes: [{
    validators: [],
    validations: [],
    type: 'mto',
    name: 'user',
    _id: 'e1b664aad867c93f3c424aac',
    relation: {
      type: null,
      name: null
    },
    label: 'User'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'chat',
    _id: 'cfdedad036adb7c4208bb352',
    relation: {
      type: null,
      name: null
    },
    label: 'Chat'
  }, {
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'status',
    _id: 'aa4e53ba5ee20abb4d8a54f3',
    relation: {
      type: null,
      name: null
    },
    label: 'Status'
  }],
  _id: 'f23abf9b445ca5bd09d98dcf'
}, {
  name: 'message',
  label: 'Message',
  plural: 'messages',
  attributes: [{
    validators: [],
    validations: [],
    type: 'text',
    name: 'body',
    _id: 'bc7eda2aecbcefa0bdb90f2b',
    relation: {
      type: null,
      name: null
    },
    label: 'Body'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'chat',
    _id: '57c1afa1fa19af0fd2bcc2a7',
    relation: {
      type: null,
      name: null
    },
    label: 'Chat'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'user',
    _id: '70ebe756ecb1cd109efb5bae',
    relation: {
      type: null,
      name: null
    },
    label: 'User'
  }, {
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'status',
    _id: '3f246e1fbecc2230bfbffefe',
    relation: {
      type: null,
      name: null
    },
    label: 'Status'
  }],
  _id: 'e50f8b4361f8ffcab2bda9f9'
}, {
  name: 'referral',
  label: 'Referral',
  plural: 'referrals',
  attributes: [{
    validators: [],
    validations: [],
    type: 'mto',
    name: 'referee',
    _id: '8feede54fb71d66ab64eb92d',
    relation: {
      type: null,
      name: null
    },
    label: 'Referee'
  }, {
    validators: [],
    validations: [],
    type: 'mto',
    name: 'referer',
    _id: '64d1aec3ffebdf6baf2fbac2',
    relation: {
      type: null,
      name: null
    },
    label: 'Referer'
  }],
  _id: '6d4f05cfd294fc89218f99cb'
}, {
  name: 'attachment',
  label: 'Attachment',
  plural: 'attachments',
  attributes: [{
    validators: [],
    validations: [],
    type: 'mto',
    name: 'user',
    _id: '6a0458acd2eeabcb6a9dee9e',
    relation: {
      type: null,
      name: null
    },
    label: 'User'
  }, {
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'type',
    _id: '3efbfe06042bf63ffaf809b2',
    relation: {
      type: null,
      name: null
    },
    label: 'Type'
  }, {
    validators: [],
    validations: [],
    type: 'enumerator',
    name: 'destination',
    _id: 'd44677c1618adafae9bc13bd',
    relation: {
      type: null,
      name: null
    },
    label: 'Destination'
  }],
  _id: '3e6a34dbe0ba5a4fb09f30c6'
}];