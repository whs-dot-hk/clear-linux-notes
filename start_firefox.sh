bazel build @ffmpeg//:firefox_library

LD_LIBRARY_PATH=$(find -L bazel-out -type d -path **/copy_firefox_*/*/lib | sed -e ':x ; N ; s/\n/:/g ; bx') firefox
