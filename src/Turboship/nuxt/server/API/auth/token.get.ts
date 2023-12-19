export default defineEventHandler(async (e) => {
  const token = jwtSign({ foo: 'bar' })

  const verified = jwtVerify(token)

  return {
    token,
    verified,
  }
})
