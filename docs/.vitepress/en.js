import { defineConfig } from "vitepress";

export const en = defineConfig({
  lang: "en-GB",

  themeConfig: {
    nav: [
      {
        text: "Monitor",
        link: "/monitor/2024/",
        activeMatch: "/monitor/*",
      },
    ],
    sidebar: {
      "/monitor/2024/": {
        base: "/monitor/2024",
        items: sidebarMonitor2024(),
      },
    },

    footer: {
      message: "Released under the aGPL License.",
      copyright: "Copyright © 2009-present GRIP",
    },
  },
});

function sidebarMonitor2024() {
  return [{ link: `/1-home`, text: "Home" }];
}
