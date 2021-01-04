# Userscripts

## Simple youtube like
```js
// ==UserScript==
// @name Simple youtube like
// @match https://www.youtube.com/*
// ==/UserScript==
document
  .querySelector("ytd-app")
  .addEventListener("yt-page-data-updated", function () {
    const likeButton = document.querySelector(
      "ytd-toggle-button-renderer.style-scope:nth-child(1)"
    );
    const videoTitle = document.querySelector(
      "yt-formatted-string.ytd-video-primary-info-renderer:nth-child(1)"
    ).textContent;

    if (window.location.pathname !== "/watch") {
      return;
    }

    (function liked() {
      return (
        likeButton.classList.contains("style-default-active") &&
        (function log() {
          console.log("Liked!");
          return true;
        })()
      );
    })() ||
      (function like() {
        likeButton.click();
        console.log(`Liked! ${videoTitle}`);
      })();
  });
```

## Whs big centered tempature
```js
// ==UserScript==
// @name Whs big centered tempature
// @match https://t.whs.hk/*
// ==/UserScript==
window.onload = () =>
  (document.querySelector("body").style.cssText =
    "display: flex; justify-content: center; align-items: center; height: 100%; font-size: 128;");
```
