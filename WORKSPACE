load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")

http_archive(
   name = "rules_foreign_cc",
   strip_prefix = "whs_rules_foreign_cc-master",
   url = "https://github.com/whs-dot-hk/whs_rules_foreign_cc/archive/master.zip",
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
    build_file = "@//:BUILD.waf.mpv",
    remote = "https://github.com/mpv-player/mpv.git",
)

http_file(
    name = "waf",
    downloaded_file_path = "waf",
    executable = True,
    urls = ["https://waf.io/waf-2.0.21"],
)

http_archive(
    name = "makemkv-oss",
    build_file = "@//:BUILD.configure.makemkv_oss",
    sha256 = "82d062d4844d17901293f65dce40e63ae1084fd81accd6913427eda9b2c43fe3",
    strip_prefix = "makemkv-oss-1.15.4",
    urls = ["https://www.makemkv.com/download/makemkv-oss-1.15.4.tar.gz"],
)

http_archive(
    name = "makemkv-bin",
    build_file = "@//:BUILD.make.makemkv_bin",
    sha256 = "45eba7e61a7b467b1fe8de722fa890d556e19f3fc02a7b7f8d846ac8e2badb9a",
    strip_prefix = "makemkv-bin-1.15.4",
    urls = ["https://www.makemkv.com/download/makemkv-bin-1.15.4.tar.gz"],
)

http_archive(
    name = "smplayer",
    build_file = "@//:BUILD.smplayer",
    strip_prefix = "smplayer-20.4.2",
    urls = ["https://downloads.sourceforge.net/smplayer/smplayer-20.4.2.tar.bz2"],
)

http_archive(
    name = "lua52",
    build_file = "@//:BUILD.lua52",
    patch_args = [
        "-p1",
    ],
    patches = [
        "//:0001-Fedora-lua-patch.patch",
    ],
    strip_prefix = "lua-5.2.4",
    urls = ["https://www.lua.org/ftp/lua-5.2.4.tar.gz"],
)

load("//:deps.bzl", "keepassxc_deps")

keepassxc_deps()
