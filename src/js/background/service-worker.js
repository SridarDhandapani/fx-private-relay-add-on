// MV3 background entry point. Loads the polyfill and existing scripts
// via importScripts so the service worker has the same globals the
// previous event-page background expected.
importScripts(
  "/js/libs/browser-polyfill.min.js",
  "/js/shared/utils.js",
  "/js/background/background.js",
  "/js/background/context-menu.js"
);
