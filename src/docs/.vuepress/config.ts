import { defaultTheme } from "@vuepress/theme-default";

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
    ["meta", { name: "theme-color", content: "#3366ff" }],
    ["meta", { name: "apple-mobile-web-app-capable", content: "yes" }],
    [
      "meta",
      { name: "apple-mobile-web-app-status-bar-style", content: "black" },
    ],
  ],

  theme: defaultTheme({
    locales: {
      "/": {
        selectLanguageName: "English",
        sidebar: [
          "/",
          "/presentation/",
          "/swift/",
          "/ui-development/",
          "/api-communication/",
          "/persist-data/",
          "/to-go-further/",
          "/ecosystem/",
        ],
      },

      "/fr/": {
        selectLanguageName: "Français",
        sidebar: [
          "/fr/",
          "/fr/presentation/",
          "/fr/outillage/",
          "/fr/swift/",
          "/fr/pour-aller-plus-loin/",
          "/fr/ecosysteme/",
        ],
      },
    },
  }),
  plugins: [],
};
