"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createDirectories = void 0;
const fs_1 = __importDefault(require("fs"));
function createDirectories(directoryPath) {
    try {
        fs_1.default.mkdirSync(directoryPath, { recursive: true });
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
exports.createDirectories = createDirectories;
