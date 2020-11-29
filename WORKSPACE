load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_foreign_cc",
    patch_args = [
        "-p1",
    ],
    patch_tool = "/usr/bin/patch",
    patches = [
        "//:0001-Add-attribure-prefix_script-and-example.patch",
    ],
    strip_prefix = "rules_foreign_cc-d54c78ab86b40770ee19f0949db9d74a831ab9f0",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/d54c78ab86b40770ee19f0949db9d74a831ab9f0.zip",
)

load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

new_git_repository(
    name = "x264",
    branch = "master",
    build_file = "@//:BUILD.x264",
    remote = "https://code.videolan.org/videolan/x264.git",
)

new_git_repository(
    name = "ffmpeg",
    branch = "master",
    build_file = "@//:BUILD.ffmpeg",
    remote = "https://git.ffmpeg.org/ffmpeg.git",
)

new_git_repository(
    name = "patchelf",
    branch = "master",
    build_file = "@//:BUILD.patchelf",
    remote = "https://github.com/NixOS/patchelf.git",
)

new_git_repository(
    name = "keepassxc",
    branch = "master",
    build_file = "@//:BUILD.keepassxc",
    remote = "https://github.com/keepassxreboot/keepassxc.git",
)

http_archive(
    name = "sshpass",
    build_file = "@//:BUILD.sshpass",
    strip_prefix = "sshpass-1.06",
    urls = ["https://sourceforge.net/projects/sshpass/files/sshpass/1.06/sshpass-1.06.tar.gz"],
)

http_archive(
    name = "rsync",
    build_file = "@//:BUILD.rsync",
    strip_prefix = "rsync-3.2.3",
    urls = ["https://download.samba.org/pub/rsync/src/rsync-3.2.3.tar.gz"],
)

new_git_repository(
    name = "nv_codec_headers",
    branch = "master",
    build_file = "@//:BUILD.nv_codec_headers",
    remote = "https://git.videolan.org/git/ffmpeg/nv-codec-headers.git",
)

load("//:deps.bzl", "keepassxc_deps")

keepassxc_deps()
