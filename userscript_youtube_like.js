// ==UserScript==
// @name Youtube like
// @match https://www.youtube.com/*
// ==/UserScript==
document
  .querySelector("ytd-app")
  .addEventListener("yt-page-data-updated", function () {
    const likeButton = document.querySelector(
      "ytd-menu-renderer.ytd-video-primary-info-renderer > div:nth-child(2) > ytd-toggle-button-renderer:nth-child(1) > a:nth-child(1)"
    );

    const likeButtonIcon = document.querySelector(
      "ytd-menu-renderer.ytd-video-primary-info-renderer > div:nth-child(2) > ytd-toggle-button-renderer:nth-child(1) > a:nth-child(1) > yt-icon-button:nth-child(1)"
    );

    const videoTitle = document.querySelector(
      "yt-formatted-string.ytd-video-primary-info-renderer:nth-child(1)"
    ).textContent;

    if (window.location.pathname !== "/watch") {
      return;
    }

    (function liked() {
      return (
        likeButtonIcon.classList.contains("style-default-active") &&
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
