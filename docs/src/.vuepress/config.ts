import { pwaPlugin } from "@vuepress/plugin-pwa";
import { searchPlugin } from "@vuepress/plugin-search";
import { defineUserConfig } from "vuepress";
import { defaultTheme } from "@vuepress/theme-default";
import { mediumZoomPlugin } from "@vuepress/plugin-medium-zoom";
import { mdEnhancePlugin } from "vuepress-plugin-md-enhance";
import { viteBundler } from "@vuepress/bundler-vite";

export default defineUserConfig({
  bundler: viteBundler({
    viteOptions: {},
    vuePluginOptions: {},
  }),
  base: "/ios-training/",
  shouldPrefetch: false,
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
    pwaPlugin({}),
    mediumZoomPlugin({}),
    mdEnhancePlugin({
      imgLazyload: true,
      imgSize: true,
      figure: true,
      imgMark: true,
    }),
  ],
});
