export function makeQueryString(fields) {
    return Object.keys(fields)
        .filter((key) => fields[key] !== undefined)
        .map((key) => key + '=' + fields[key])
        .join('&');
}
export function makeApiQueryString(url, fields) {
    return `${url}&${makeQueryString(fields)}`;
}
