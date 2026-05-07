// Aliases chrome.browserAction -> chrome.action so the bundled
// webextension-polyfill (pre-MV3) keeps mapping existing
// browser.browserAction.* calls onto the MV3 chrome.action API.
// Must be loaded BEFORE browser-polyfill.min.js.
(function () {
  if (typeof chrome !== "undefined" && chrome.action && !chrome.browserAction) {
    try {
      chrome.browserAction = chrome.action;
    } catch (_e) {
      // Read-only in some environments — calls will fall through to action.
    }
  }
})();
