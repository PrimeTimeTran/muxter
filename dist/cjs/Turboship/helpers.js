"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.makeDirRecursive = exports.colors = exports.getType = exports.camelize = exports.zipUp = exports.prettify = exports.capitalize = exports.writeToFile = exports.fileExt = exports.log = void 0;
const fs_1 = __importDefault(require("fs"));
const path_1 = __importDefault(require("path"));
const chalk_1 = __importDefault(require("chalk"));
const child_process_1 = require("child_process");
const archiver_1 = __importDefault(require("archiver"));
const log = (field, val, color = 'green') => console.log(chalk_1.default[color](field) + val);
exports.log = log;
function fileExt(options) {
    return options.typescript ? 'ts' : 'js';
}
exports.fileExt = fileExt;
function writeToFile(name, content) {
    (0, exports.log)('Create: ', name);
    fs_1.default.writeFile(name, content, (err) => {
        if (err) {
            console.error(err);
        }
    });
}
exports.writeToFile = writeToFile;
const capitalize = (word) => {
    const firstLetter = word === null || word === void 0 ? void 0 : word.charAt(0);
    const firstLetterCap = firstLetter.toUpperCase();
    const remainingLetters = word.slice(1);
    const capitalizedWord = firstLetterCap + remainingLetters;
    return capitalizedWord;
};
exports.capitalize = capitalize;
function prettify(root) {
    return __awaiter(this, void 0, void 0, function* () {
        const tmp = path_1.default.join('/tmp/turboship/nuxt');
        const cmd = `npx prettier --write "${tmp}/**/*.{ts,js,vue}"`;
        yield (0, child_process_1.exec)(cmd, (prettierError, prettierStdout) => {
            if (prettierError) {
                console.error(`Error running prettier: ${prettierError}`);
                return;
            }
            (0, exports.log)('Cleaned: ', 'by Prettier', 'magenta');
            zipUp(root);
        });
    });
}
exports.prettify = prettify;
function zipUp(root) {
    const folderPath = path_1.default.join('/tmp/turboship');
    const outputZipFilePath = '/tmp/muxter.zip';
    const output = fs_1.default.createWriteStream(outputZipFilePath);
    const archive = (0, archiver_1.default)('zip', {
        zlib: { level: 9 }, // Compression level (0-9)
    });
    output.on('close', () => {
        console.log(`Zip file created: ${outputZipFilePath}`);
    });
    output.on('end', () => {
        console.log('Data has been drained');
    });
    archive.on('warning', (err) => {
        if (err) {
            console.error(`Warning while zipping: ${err}`);
        }
    });
    archive.on('error', (err) => {
        console.error(`Error while zipping: ${err}`);
        throw err;
    });
    archive.pipe(output);
    // Add the entire folder and its contents to the zip file
    archive.directory(folderPath, false);
    archive.finalize();
}
exports.zipUp = zipUp;
function camelize(str) {
    return str
        .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) {
        return index === 0 ? word.toLowerCase() : word.toUpperCase();
    })
        .replace(/\s+/g, '');
}
exports.camelize = camelize;
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
exports.getType = getType;
exports.colors = [
    'red',
    'pink',
    'purple',
    'green',
    'indigo',
    'blue',
    'teal',
    'yellow',
    'teal',
];
function makeDirRecursive(fullPath) {
    fs_1.default.mkdirSync(fullPath, { recursive: true }, (err) => {
        if (err) {
        }
        else {
            (0, exports.log)('Create: ', fullPath, 'yellow');
        }
    });
}
exports.makeDirRecursive = makeDirRecursive;
