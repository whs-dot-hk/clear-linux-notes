// ==UserScript==
// @name Youtube subscribe
// @match https://www.youtube.com/*
// ==/UserScript==
const cancel = {};
const views = {};

function log(message) {
  console.log(message);
  return true;
}

document
  .querySelector("ytd-app")
  .addEventListener("yt-page-data-updated", function () {
    const subscribeButton = document.querySelector(
      "paper-button.ytd-subscribe-button-renderer"
    );

    const subscriptionText = subscribeButton.getAttribute("aria-label");

    if (window.location.pathname !== "/watch") {
      return;
    }

    (function subscribed() {
      return subscribeButton.hasAttribute("subscribed") && log("Subscribed!");
    })() ||
      (function cancelled() {
        return cancel[subscriptionText] && log("Cancelled!");
      })() ||
      (function debounce() {
        views[subscriptionText] |= 0;
        return (views[subscriptionText] += 1) % 2 !== 0 && log("Debounced!");
      })() ||
      (function subscribe() {
        if (confirm(subscriptionText)) {
          subscribeButton.click();
          console.log(subscriptionText.replace(/subscribe/i, "Subscribed"));
        } else {
          cancel[subscriptionText] = true;
        }
      })();
  });
