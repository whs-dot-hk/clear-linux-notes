load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

http_archive(
   name = "rules_foreign_cc",
   strip_prefix = "whs_rules_foreign_cc-master",
   url = "https://github.com/whs-dot-hk/whs_rules_foreign_cc/archive/master.zip",
   sha256 = "98ab624a111597aaba4954f22d2b3e6b6e5b49023fc0cee6a9c27d08888af97e",
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

new_git_repository(
    name = "mpv",
    branch = "master",
    build_file = "@//:BUILD.mpv",
    remote = "https://github.com/mpv-player/mpv.git",
)

http_file(
    name = "waf",
    urls = ["https://waf.io/waf-2.0.21"],
    executable = True,
    downloaded_file_path = "waf",
)

load("//:deps.bzl", "keepassxc_deps")

keepassxc_deps()
