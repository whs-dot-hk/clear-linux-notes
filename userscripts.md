# Userscripts

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
