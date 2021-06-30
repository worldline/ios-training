module.exports = {
  base: "/ios-training/",
  locales: {
    "/": {
      lang: "en-US",// this will be set as the lang attribute on <html>
      title: "iOS Training",
      description: "iOS training docs"
    }/*,

    "/fr/": {
      lang: "fr-FR",
      title: "Formation iOS",
      description: "Support de formation iOS"
    }*/
  },

  head: [
    ['meta', { name: 'theme-color', content: '#C3002F' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }]
  ],

  /**
   * Theme configuration, here is the default theme configuration for VuePress.
   *
   * ref：https://v1.vuepress.vuejs.org/theme/default-theme-config.html
   */
  themeConfig: {
    repo: '',
    editLinks: false,
    docsDir: '',
    editLinkText: '',
    lastUpdated: false,
    nav: [],
    locales: {
      "/": {
        selectText: "Language",
        label: "English",
        sidebar: [
          "/",
          "/presentation/",
          "/tooling/",
          "/to-go-further/",
          "/ecosystem/"
        ]
      } /*,

      "/fr/": {
        selectText: "Langue",
        label: "Français",
        sidebar: [
          "/fr/",
          "/fr/presentation/",
          "/fr/outillage/",
          "/fr/typescript/",
          "/fr/rxjs/",
          "fr/premiers-pas/",
          "fr/composants/",
          "fr/routage/",
          "fr/services/",
          "fr/formulaires/",
          "fr/ecosysteme/",
          "fr/aller-plus-loin/"
        ]
      }*/
    }
  },

  /**
   * Apply plugins，ref：https://v1.vuepress.vuejs.org/zh/plugin/
   */
  plugins: [
    'vuepress-plugin-global-toc'
  ]
}
