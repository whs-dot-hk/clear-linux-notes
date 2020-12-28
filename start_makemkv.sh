bazel build @makemkv-bin//:binary
bazel build @makemkv-oss//:binary

rm -rf makemkv

mkdir makemkv

find -L bazel-bin/*/makemkv-*/binary -type f -and \( -name libdriveio.so.0 -or -name libmakemkv.so.1 -or -name libmmbd.so.0 -or -name makemkv -or -name makemkvcon \) -exec cp {} makemkv \;

cd makemkv

chmod a+w makemkvcon
patchelf --set-rpath . makemkvcon

./makemkv
