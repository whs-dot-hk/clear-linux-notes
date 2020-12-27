bazel build @mpv//:binary

bazel build @smplayer//:binary

mpv_path=`pwd`/bazel-bin/external/mpv/binary/bin

smplayer=bazel-bin/external/smplayer/binary/bin/smplayer

PATH=$PATH:$mpv_path $smplayer
