import fs from 'fs';
export function createDirectories(directoryPath) {
  try {
    fs.mkdirSync(directoryPath, {
      recursive: true
    });
    console.log("Directory '".concat(directoryPath, "' created successfully."));
  } catch (err) {
    if (err.code === 'EXIST') {
      console.log("Directory '".concat(directoryPath, "' already exists."));
    } else {
      console.error("Error creating directory '".concat(directoryPath, "':"), err);
    }
  }
}