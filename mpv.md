```sh
# Install libass
sudo swupd bundle-add devpkg-libass
# Link libegl
sudo ln -sfv /opt/nvidia/lib/libEGL.so.1.1.0 /usr/lib64/libEGL.so
# Build mpv
bazel build @mpv//:binary
```
