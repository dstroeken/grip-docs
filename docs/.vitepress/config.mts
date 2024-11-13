import { defineConfig } from "vitepress";
import { generateRawHtmlFiles } from "./common";
import { nl } from "./nl";
import { en } from "./en";

export default defineConfig({
  title: "GRIP",
  description: "Documentatie van de GRIP instrumentaria",

  lastUpdated: true,
  cleanUrls: true,
  metaChunk: true,

  themeConfig: {
    search: {
      provider: "local",
    },
  },

  rewrites: {
    "nl/:rest*": ":rest*",
  },

  head: [["meta", { name: "robots", content: "noindex" }]],

  locales: {
    root: { label: "Nederlands", ...nl },
    en: { label: "English", ...en },
  },

  buildEnd: async (siteConfig) => {
    await generateRawHtmlFiles(siteConfig);
  },
});
