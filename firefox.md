```sh
sh start_firefox.sh
```

# Plugins
## Privacy
* https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete
* https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers
* https://addons.mozilla.org/en-US/firefox/addon/ublock-origin
* https://addons.mozilla.org/en-US/firefox/addon/umatrix
* https://addons.mozilla.org/en-US/firefox/addon/user-agent-string-switcher

## Others
* https://addons.mozilla.org/en-US/firefox/addon/greasemonkey
* https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser

# Cookie autodelete
```
Settings > Enable support for firefox's container tabs
```

| Site | Keep cookie |
| --- | --- |
| Youtube | `__Secure-3PAPISID`, `__Secure-3PSID` and `__Secure-3PSIDCC` |

# Ublock origin rules
https://github.com/gorhill/uBlock/wiki/Blocking-mode:-hard-mode

```txt
* * 1p-script block
* * 3p block
* * 3p-frame block
* * 3p-script block
* * inline-script block
```

## Youtube
```txt
www.youtube.com google.com * noop
www.youtube.com googlevideo.com * noop
www.youtube.com youtube.com * noop
www.youtube.com www.youtube.com * noop
www.youtube.com ytimg.com * noop
```

## Github
```txt
github.com githubassets.com * noop
```

# Umatrix rules
```txt
youtube.com googlevideo.com xhr allow
```

# User.js
```
about:profiles > Open directory (root directory)
```

https://github.com/arkenfox/user.js

# Tor
https://www.torproject.org/download
