import { defineConfig } from "vitepress";

export const nl = defineConfig({
  lang: "nl-NL",

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
      message: "Uitgegeven onder de aGPL Licentie.",
      copyright: "Copyright © 2009-heden GRIP",
    },
  },
});

function sidebarMonitor2024() {
  return [{ link: `/1-home`, text: "Home" }];
}
