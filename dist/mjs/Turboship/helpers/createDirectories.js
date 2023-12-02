import fs from 'fs';
export function createDirectories(directoryPath) {
    try {
        fs.mkdirSync(directoryPath, { recursive: true });
        console.log(`Directory '${directoryPath}' created successfully.`);
    }
    catch (err) {
        if (err.code === 'EXIST') {
            console.log(`Directory '${directoryPath}' already exists.`);
        }
        else {
            console.error(`Error creating directory '${directoryPath}':`, err);
        }
    }
}
