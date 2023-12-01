export function makeQueryString(fields: Record<string, any>) {
  return Object.keys(fields)
    .filter((key) => fields[key] !== undefined)
    .map((key) => key + '=' + fields[key])
    .join('&')
}

export function makeApiQueryString(url: string, fields: Record<string, any>) {
  return `${url}&${makeQueryString(fields)}`
}
