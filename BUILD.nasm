load("@rules_foreign_cc//tools/build_defs:configure.bzl", "configure_make")

filegroup(
    name = "all",
    srcs = glob(["**"]),
)

configure_make(
    name = "binary",
    configure_options = [
        "CFLAGS='-Dredacted=\"redacted\"'",
    ],
    lib_source = ":all",
    binaries = [
        "nasm",
    ],
)

filegroup(
    name = "nasm",
    srcs = [":binary"],
    output_group = "nasm",
    visibility = ["//visibility:public"],
)
