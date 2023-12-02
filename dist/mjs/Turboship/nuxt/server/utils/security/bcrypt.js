import bcrypt from 'bcryptjs';
export const encryptPassword = async (password) => {
    return await bcrypt.hash(password, 10);
};
export const decryptPassword = async (password, hash) => {
    return await bcrypt.compare(password, hash);
};
