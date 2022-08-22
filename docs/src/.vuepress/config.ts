import { defaultTheme } from "@vuepress/theme-default";
import { searchPlugin } from "@vuepress/plugin-search";
import { nprogressPlugin } from "@vuepress/plugin-nprogress";
import { pwaPlugin } from "@vuepress/plugin-pwa";

module.exports = {
  base: "/ios-training/",
  locales: {
    "/": {
      lang: "en-US", // this will be set as the lang attribute on <html>
      title: "iOS Training",
      description: "iOS training docs",
    },

    "/fr/": {
      lang: "fr-FR",
      title: "Formation iOS",
      description: "Support de formation iOS",
    },
  },
  head: [
    ["link", { rel: "icon", href: "/ios-training/favicon.ico" }],
    ["link", { rel: "manifest", href: "/ios-training/manifest.webmanifest" }],
    ["meta", { name: "theme-color", content: "#2176d6" }],
  ],
  theme: defaultTheme({
    logo: "/logo.png",
    repo: "worldline/ios-training",
    locales: {
      "/": {
        selectLanguageName: "English",
        sidebar: [
          "/",
          "/presentation/",
          "/swift-part1/",
          "/swift-part2/",
          "/ui-development/",
          "/api-communication/",
          "/persist-data/",
          "/mini-project/",
          "/to-go-further/",
        ],
      },

      "/fr/": {
        selectLanguageName: "Français",
        sidebar: [
          "/fr/",
          "/fr/presentation/",
          "/fr/swift-part1/",
          "/fr/swift-part2/",
          "/fr/ui-development/",
          "/fr/api-communication/",
          "/fr/persist-data/",
          "/fr/mini-project/",
          "/fr/to-go-further/",
        ],
      },
    },
  }),
  plugins: [
    searchPlugin({
      locales: {
        "/": {
          placeholder: "Search",
        },
        "/fr/": {
          placeholder: "Rechercher",
        },
      },
    }),
    nprogressPlugin(),
    pwaPlugin({}),
  ],
};
