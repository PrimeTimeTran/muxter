import fs from 'fs';
import path from 'path';
import chalk from 'chalk';
import { exec } from 'child_process';
import archiver from 'archiver';
export const log = (field, val, color = 'green') => console.log(chalk[color](field) + val);
export function fileExt(options) {
    return options.typescript ? 'ts' : 'js';
}
export function writeToFile(name, content) {
    log('Create: ', name);
    fs.writeFile(name, content, (err) => {
        if (err) {
            console.error(err);
        }
    });
}
export const capitalize = (word) => {
    try {
        const firstLetter = word?.charAt(0);
        const firstLetterCap = firstLetter.toUpperCase();
        const remainingLetters = word.slice(1);
        const capitalizedWord = firstLetterCap + remainingLetters;
        return capitalizedWord;
    }
    catch (error) {
        console.log({
            error,
            message: 'Only strings can be capitalized. Related entity missing.',
        });
        return word;
    }
};
export async function prettify(root) {
    const tmp = path.join('/tmp/turboship/nuxt');
    const cmd = `npx prettier --write "${tmp}/**/*.{ts,js,vue}"`;
    await exec(cmd, (prettierError, prettierStdout) => {
        if (prettierError) {
            console.error(`Error running prettier: ${prettierError}`);
            return;
        }
        log('Cleaned: ', 'by Prettier', 'magenta');
        zipUp();
    });
}
export function zipUp() {
    const folderPath = path.join('/tmp/turboship');
    const outputZipFilePath = '/tmp/muxter.zip';
    const output = fs.createWriteStream(outputZipFilePath);
    const archive = archiver('zip', {
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
export function camelize(str) {
    return str
        .replace(/(?:^\w|[A-Z]|\b\w)/g, function (word, index) {
        return index === 0 ? word.toLowerCase() : word.toUpperCase();
    })
        .replace(/\s+/g, '');
}
export function getType(name, type, key) {
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
export const colors = [
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
export function makeDirRecursive(fullPath) {
    fs.mkdirSync(fullPath, { recursive: true }, (err) => {
        if (err) {
        }
        else {
            log('Create: ', fullPath, 'yellow');
        }
    });
}
