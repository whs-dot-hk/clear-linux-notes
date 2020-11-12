keepassxc_dependencies_rpms = [
    "@libX11//file",
    "@libX11-devel//file",
    "@libXau//file",
    "@libargon2//file",
    "@libargon2-devel//file",
    "@libgcrypt//file",
    "@libgcrypt-devel//file",
    "@libglvnd//file",
    "@libglvnd-glx//file",
    "@libgpg-error//file",
    "@libgpg-error-devel//file",
    "@libsodium//file",
    "@libsodium-devel//file",
    "@libxcb//file",
    "@qrencode-devel//file",
    "@qrencode-libs//file",
    "@qt5-linguist//file",
    "@qt5-qtbase//file",
    "@qt5-qtbase-devel//file",
    "@qt5-qtbase-gui//file",
    "@qt5-qtbase-private-devel//file",
    "@qt5-qtsvg//file",
    "@qt5-qtsvg-devel//file",
    "@xorg-x11-proto-devel//file",
]

genrule(
    name = "keepassxc-dependencies",
    srcs = keepassxc_dependencies_rpms,
    outs = [
        "keepassxc_dependencies.tar.gz",
    ],
    cmd = "\n".join(
        ["rpm2cpio $(location %s) | cpio -idu --quiet" % rpm for rpm in keepassxc_dependencies_rpms] + [
            "tar -czf $@ usr",
        ],
    ),
    visibility = ["//visibility:public"],
)
