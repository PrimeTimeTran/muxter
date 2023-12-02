export declare const encryptPassword: (password: string) => Promise<string>;
export declare const decryptPassword: (password: string, hash: string) => Promise<boolean>;
