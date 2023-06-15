// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },

  modules: [
    // '@nuxt/image',
    '@pinia/nuxt',
    '@nuxtjs/apollo',
    'nuxt-icon',
  ],

  apollo: {
    clients: {
      default: {
        httpEndpoint: 'http://localhost:8080/'
      }
    }
  },

  css: [
    '~/assets/scss/main.scss'
  ]
})
