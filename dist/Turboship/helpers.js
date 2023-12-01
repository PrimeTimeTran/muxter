"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.camelize = camelize;
exports.colors = exports.capitalize = void 0;
exports.fileExt = fileExt;
exports.getType = getType;
exports.log = void 0;
exports.makeDirRecursive = makeDirRecursive;
exports.prettify = prettify;
exports.writeToFile = writeToFile;
exports.zipUp = zipUp;
var _fs = _interopRequireDefault(require("fs"));
var _path = _interopRequireDefault(require("path"));
var _chalk = _interopRequireDefault(require("chalk"));
var _child_process = require("child_process");
var _archiver = _interopRequireDefault(require("archiver"));
function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }
const log = (field, val, color = 'green') => console.log(_chalk.default[color](field) + val);
exports.log = log;
function fileExt(options) {
  return options.typescript ? 'ts' : 'js';
}
function writeToFile(name, content) {
  log('Create: ', name);
  _fs.default.writeFile(name, content, err => {
    if (err) {
      console.error(err);
    }
  });
}
const capitalize = word => {
  const firstLetter = word == null ? void 0 : word.charAt(0);
  const firstLetterCap = firstLetter.toUpperCase();
  const remainingLetters = word.slice(1);
  const capitalizedWord = firstLetterCap + remainingLetters;
  return capitalizedWord;
};
exports.capitalize = capitalize;
async function prettify(root) {
  const tmp = _path.default.join('/tmp/turboship/nuxt');
  const cmd = `npx prettier --write "${tmp}/**/*.{ts,js,vue}"`;
  await (0, _child_process.exec)(cmd, (prettierError, prettierStdout) => {
    if (prettierError) {
      console.error(`Error running prettier: ${prettierError}`);
      return;
    }
    log('Cleaned: ', 'by Prettier', 'magenta');
    zipUp(root);
  });
}
function zipUp(root) {
  const folderPath = _path.default.join('/tmp/turboship');
  const outputZipFilePath = '/tmp/muxter.zip';
  const output = _fs.default.createWriteStream(outputZipFilePath);
  const archive = (0, _archiver.default)('zip', {
    zlib: {
      level: 9
    } // Compression level (0-9)
  });
  output.on('close', () => {
    console.log(`Zip file created: ${outputZipFilePath}`);
  });
  output.on('end', () => {
    console.log('Data has been drained');
  });
  archive.on('warning', err => {
    if (err) {
      console.error(`Warning while zipping: ${err}`);
    }
  });
  archive.on('error', err => {
    console.error(`Error while zipping: ${err}`);
    throw err;
  });
  archive.pipe(output);

  // Add the entire folder and its contents to the zip file
  archive.directory(folderPath, false);
  archive.finalize();
}
function camelize(str) {
  return str.replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) {
    return index === 0 ? word.toLowerCase() : word.toUpperCase();
  }).replace(/\s+/g, '');
}
function getType(name, type, key) {
  switch (type) {
    case 'string':
      return 'z.string()';
    case 'boolean':
      return 'z.boolean()';
    case 'number':
      return 'z.number()';
    case 'date':
      return 'z.date()';
    case 'datetime':
      return 'z.string().datetime()';
    case 'enumerator':
      return `z.array(z.nativeEnum(${name}Enumerators.${key}))`;
    default:
      break;
  }
}
const colors = exports.colors = ['red', 'pink', 'purple', 'green', 'indigo', 'blue', 'teal', 'yellow', 'teal'];
function makeDirRecursive(fullPath) {
  _fs.default.mkdirSync(fullPath, {
    recursive: true
  }, err => {
    if (err) {} else {
      log('Create: ', fullPath, 'yellow');
    }
  });
}