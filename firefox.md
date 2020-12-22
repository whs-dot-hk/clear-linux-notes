```sh
sh start_firefox.sh
```

# Build firefox
```sh
bazel build @ffmpeg//:firefox_library
```

# Run firefox
```sh
LD_LIBRARY_PATH=$(find -L bazel-out -type d -path **/copy_firefox_*/*/lib | sed -e ':x ; N ; s/\n/:/g ; bx') firefox
```
or
```sh
source <(echo alias firefox='"'"LD_LIBRARY_PATH=\$(find -L `pwd`/bazel-out -type d -path **/copy_firefox_*/*/lib | sed -e ':x ; N ; s/\n/:/g ; bx') /usr/bin/firefox"'"')
firefox
```

# Plugins
* https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete
* https://addons.mozilla.org/en-US/firefox/addon/decentraleyes
* https://addons.mozilla.org/en-US/firefox/addon/https-everywhere
* https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers
* https://addons.mozilla.org/en-US/firefox/addon/noscript
* https://addons.mozilla.org/en-US/firefox/addon/ublock-origin
* https://addons.mozilla.org/en-US/firefox/addon/umatrix

# Cookie autodelete
| Site | Keep cookie |
| --- | --- |
| Youtube | `__Secure-3PAPISID`, `__Secure-3PSID` and `__Secure-3PSIDCC` |

# Umatrix rules
```txt
youtube.com googlevideo.com xhr allow
```

# User.js
https://github.com/arkenfox/user.js

# Tor
https://www.torproject.org/download
