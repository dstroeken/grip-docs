import { createContentLoader } from "vitepress";
import fs from "fs-extra";
import path from "path";
import { fileURLToPath } from "url";

const { join } = path;

const debug = false;

export async function generateRawHtmlFiles(siteConfig) {
  const files = await createContentLoader("**/*.md", { render: true }).load();

  const rootUrl = fileURLToPath(import.meta.url);
  const rootDir = join(path.dirname(rootUrl), "..");

  await Promise.all(
    files.map(async (file) => {
      let targetUrl = path.join(siteConfig.outDir, `${file.url}.raw.html`);

      const logUrl = targetUrl.replace(rootDir, "");
      try {
        await fs.ensureDir(path.dirname(targetUrl));
        fs.writeFileSync(targetUrl, file.html);
        if (debug) {
          siteConfig.logger.info(`File written successfully: ${logUrl}`);
        }
      } catch (err) {
        siteConfig.logger.error(`Error writing file: ${logUrl}`, err);
        console.error(err);
      }
    })
  ).then(() =>
    siteConfig.logger.info(
      `${files.length} raw html companions have been created.`
    )
  );
}
