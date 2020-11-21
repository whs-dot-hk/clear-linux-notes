# Firefox

## Run firefox
```sh
bazel build @ffmpeg//:library
```

```sh
LD_LIBRARY_PATH=$(find -L bazel-out -type d -path **/copy_*/*/lib | sed -e ':a;N;$!ba;s|\n|:|g') firefox
```
or
```sh
source <(echo alias firefox='"'"LD_LIBRARY_PATH=\$(find -L `pwd`/bazel-out -type d -path **/copy_*/*/lib | sed -e ':a;N;\$!ba;s|\n|:|g') /usr/bin/firefox"'"')
firefox
```

## Plugins
* https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete
* https://addons.mozilla.org/en-US/firefox/addon/decentraleyes
* https://addons.mozilla.org/en-US/firefox/addon/https-everywhere
* https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers
* https://addons.mozilla.org/en-US/firefox/addon/noscript
* https://addons.mozilla.org/en-US/firefox/addon/ublock-origin
* https://addons.mozilla.org/en-US/firefox/addon/umatrix

## Cookie autodelete
| Site | Keep cookie |
| --- | --- |
| Youtube | `__Secure-3PAPISID`, `__Secure-3PSID`, `__Secure-3PSIDCC` |

## Umatrix rules
```txt
youtube.com googlevideo.com xhr allow
```

## User.js
https://github.com/arkenfox/user.js

## Tor
https://www.torproject.org/download
