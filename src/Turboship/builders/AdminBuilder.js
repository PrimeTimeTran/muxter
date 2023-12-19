import path from 'path'
import { capitalize } from '../helpers.js'

export class AdminBuilder {
  constructor(entities, options, zip) {
    this.entities = entities
    this.options = options
    this.zip = zip
    this.root = path.join('nuxt/components/Admin')
    this.buildAdminDirectories(zip)
  }
  buildAdminDirectories(zip) {
    this.entities.map((e) => {
      const name = `${this.root}/${e.pluralL}`
      zip.folder(name)
    })
  }
  buildEntityUseHook() {
    const apiUrl = `\`\${apiUrl}/${this.e.plural}\``
    const capitalized = capitalize(this.e.plural)

    const content = `
    import { ref } from 'vue'
    import { useFetch } from '@vueuse/core'

    export function use${capitalized}() {
      const { apiUrl } = useAPI()
      const baseURL = ${apiUrl}
      let ${this.e.plural} = ref([])
      let params = ref('')
      let meta = reactive({
        page: ref(1),
        limit: ref(10),
        total: ref(0),
        offset: ref(0),
        pageCount: ref(0),
        totalRecords: ref(0),
      })

      ${this.generateAdd()}
      ${this.generateOnMount()}
      ${this.generateFetch()}
      ${this.generatePaginationString()}
      ${this.generateFetchPage()}
      ${this.generateSort()}
      return {
        ${this.e.plural},
        sort,
        fetchPage,
        meta,
        add${this.e.label},
        fetchFiltered${this.e.pluralL},
      }
    }`
    return content
  }
  generateAdd() {
    return `const add${this.e.label} = async (fields) => {
      try {
        const { data, error } = await useFetch(baseURL, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(fields),
        })
        if (!error.value) {
          const ${this.e.name} = JSON.parse(data.value)
          ${this.e.plural}.value.push(${this.e.name})
          toastEm('${this.e.label} created')
          return ${this.e.name}
        }
      } catch (error) {
        console.error({ error })
      }
    }`
  }
  generateOnMount() {
    return `onBeforeMount(async () => {
      const { data, error } = await useFetch(
        baseURL + \`?page=\${meta.page}&limit=\${meta.limit}\`
      )
      if (!error.value) {
        const val = JSON.parse(data.value)
        Object.assign(meta, val.meta)
        ${this.e.plural}.value = val?.data
      }
    })`
  }
  generateFetch() {
    return `const fetchFiltered${this.e.pluralL} = async (fields) => {
      meta.page = 1
      const queryParams = new URLSearchParams(Object.entries(fields)).toString()
      params.value = queryParams

      const url = makeApiQueryString(
        apiUrl + \`/${this.e.plural}?page=\${meta.page}&limit=\${meta.limit}\`,
        fields
      )
      try {
        let { data, error } = await useFetch(url)
        if (!error.value) {
          const val = JSON.parse(data.value)
          meta.page = val.meta.page
          meta.totalRecords = val.meta.totalRecords
          Object.assign(meta, val.meta)
          ${this.e.plural}.value = val?.data
        } else {
          console.error('Error fetching ${this.e.plural}:', error.value)
        }
      } catch (error) {
        console.error('Unexpected error:', error)
      }
    }`
  }
  generatePaginationString() {
    return `const getPaginationString = (diff) => {
    let nextPage = meta.page + diff
    if (diff == -10) nextPage = 1
    if (diff == 10) nextPage = meta.pageCount
    return [
      \`/${this.e.plural}?page=\${nextPage}&limit=\${meta.limit}\${
        params.value ? '&' + params.value : ''
      }\`,
      nextPage,
    ]}`
  }
  generateFetchPage() {
    return `const fetchPage = async (diff) => {
      let [str, nextPage] = getPaginationString(diff)

      const url = makeApiQueryString(apiUrl + str, {})
      try {
        let { data, error } = await useFetch(url)
        if (!error.value) {
          const val = JSON.parse(data.value)
          meta.page = nextPage
          Object.assign(meta, val.meta)
          ${this.e.plural}.value = val?.data
        } else {
          console.error('Error fetching ${this.e.plural}:', error.value)
        }
      } catch (error) {
        console.error('Unexpected error:', error)
      }
    }`
  }
  generateSort() {
    return `
      const sort = (field, direction) => {
        if (direction === 'ASC') {
          ${this.e.plural}.value = ${this.e.plural}.value.sort((a, b) =>
            (a[field] ?? '') > (b[field] ?? '') ? 1 : -1
          )
        } else if (direction === 'DESC') {
          ${this.e.plural}.value = ${this.e.plural}.value.sort((a, b) =>
            (a[field] ?? '') > (b[field] ?? '') ? -1 : 1
          )
        }
      }
    `
  }
}
