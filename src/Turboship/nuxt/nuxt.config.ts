// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  plugins: ['~/plugins/fontawesome.ts'],
  css: ['@fortawesome/fontawesome-svg-core/styles.css'],
  formkit: {
    autoImport: true,
  },
  runtimeConfig: {
    public: {
      apiUrl: process.env.API_URL || 'https://turboship.ltran.net/api',
    },
  },
  modules: ['@nuxtjs/tailwindcss', '@nuxt/content', 'nuxt-mongoose', '@nuxtjs/color-mode', '@formkit/nuxt'],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  content: {
    documentDriven: true,
    api: {
      baseURL: '/api/_my_content',
    },
    highlight: {
      preload: ['dart', 'python', 'javascript', 'js', 'typescript', 'ts', 'vue'],
      theme: {
        light: 'github-light',
        default: 'github-dark',
      },
    },
  },
  build: {
    transpile: [
      '@fortawesome/vue-fontawesome',
      '@fortawesome/free-regular-svg-icons',
      '@fortawesome/free-solid-svg-icons',
      '@fortawesome/fontawesome-free',
      '@fortawesome/fontawesome-svg-core',
      '@fortawesome/pro-solid-svg-icons',
      '@fortawesome/pro-regular-svg-icons',
      '@fortawesome/pro-light-svg-icons',
      '@fortawesome/free-brands-svg-icons',
    ],
  },
})
