export const siteData = JSON.parse("{\"base\":\"/ios-training/\",\"lang\":\"en-US\",\"title\":\"\",\"description\":\"\",\"head\":[[\"meta\",{\"name\":\"theme-color\",\"content\":\"#3366ff\"}],[\"meta\",{\"name\":\"apple-mobile-web-app-capable\",\"content\":\"yes\"}],[\"meta\",{\"name\":\"apple-mobile-web-app-status-bar-style\",\"content\":\"black\"}]],\"locales\":{\"/\":{\"lang\":\"en-US\",\"title\":\"iOS Training\",\"description\":\"iOS training docs\"},\"/fr/\":{\"lang\":\"fr-FR\",\"title\":\"Formation iOS\",\"description\":\"Support de formation iOS\"}}}")

if (import.meta.webpackHot) {
  import.meta.webpackHot.accept()
  if (__VUE_HMR_RUNTIME__.updateSiteData) {
    __VUE_HMR_RUNTIME__.updateSiteData(siteData)
  }
}

if (import.meta.hot) {
  import.meta.hot.accept(({ siteData }) => {
    __VUE_HMR_RUNTIME__.updateSiteData(siteData)
  })
}
