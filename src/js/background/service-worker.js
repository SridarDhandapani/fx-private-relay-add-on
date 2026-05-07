// MV3 entry point. Aliases chrome.browserAction -> chrome.action so the
// bundled webextension-polyfill (pre-MV3) maps the existing
// browser.browserAction.* calls onto the MV3 chrome.action API.
if (typeof chrome !== "undefined" && chrome.action && !chrome.browserAction) {
  chrome.browserAction = chrome.action;
}

importScripts(
  "/js/libs/browser-polyfill.min.js",
  "/js/shared/utils.js",
  "/js/background/background.js",
  "/js/background/context-menu.js"
);
