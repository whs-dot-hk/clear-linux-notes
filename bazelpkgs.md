# Bazelpkgs

## Patchelf
```sh
bazel build @patchelf//:binary
```

```sh
export PATH=$PATH:$(pwd)/bazel-bin/external/patchelf/binary/bin
```

## Sshpass
```sh
bazel build @sshpass//:binary
```

```sh
export PATH=$PATH:$(pwd)/bazel-bin/external/sshpass/binary/bin
```

## Rsync
```sh
bazel build @rsync//:binary
```

```sh
export PATH=$PATH:$(pwd)/bazel-bin/external/rsync/binary/bin
```
