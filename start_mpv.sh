export PATH=$PATH:$HOME/.local/bin

bazel build @mpv//:binary

bazel-bin/external/mpv/binary/bin/mpv $@
