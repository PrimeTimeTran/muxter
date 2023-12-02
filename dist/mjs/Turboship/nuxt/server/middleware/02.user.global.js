export default defineEventHandler(async (e) => {
    const user = jwtVerify(e.context.token);
    if (user) {
        const id = user.userId;
        const me = await User.findById(id).exec();
        e.context.user = me;
    }
});
