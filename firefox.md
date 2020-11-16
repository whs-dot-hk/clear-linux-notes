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
* https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers
* https://addons.mozilla.org/en-US/firefox/addon/noscript
* https://addons.mozilla.org/en-US/firefox/addon/ublock-origin
* https://addons.mozilla.org/en-US/firefox/addon/umatrix

## User.js
https://github.com/arkenfox/user.js