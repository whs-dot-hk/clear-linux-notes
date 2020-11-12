load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def keepassxc_deps():
    http_file(
        name = "libX11",
        downloaded_file_path = "libX11-1.6.12-1.fc33.x86_64.rpm",
        sha256 = "f710fd960d25f3b1055220e96fd9fba179dc1187f5b2f506dfda84dbefd74932",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libX11-1.6.12-1.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libX11-devel",
        downloaded_file_path = "libX11-devel-1.6.12-1.fc33.x86_64.rpm",
        sha256 = "71d1d393d8b79be0391527415cff9717887c8009fb44f389659aaf0e8e38afac",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libX11-devel-1.6.12-1.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libXau",
        downloaded_file_path = "libXau-1.0.9-4.fc33.x86_64.rpm",
        sha256 = "c0bb5ee144010e8aee39f658a5a47ec8690af69172399ec05726360945f1674f",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libXau-1.0.9-4.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libargon2",
        downloaded_file_path = "libargon2-20171227-5.fc33.x86_64.rpm",
        sha256 = "f87a7db3ba17f6cd201de31b73768c93b4679bee33a97507723dc0eaed373f50",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libargon2-20171227-5.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libargon2-devel",
        downloaded_file_path = "libargon2-devel-20171227-5.fc33.x86_64.rpm",
        sha256 = "15210ba00fe757e0ccf9611e1db08a3d1a1e384bc81b5579532af99fba26bb4a",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libargon2-devel-20171227-5.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libgcrypt",
        downloaded_file_path = "libgcrypt-1.8.6-4.fc33.x86_64.rpm",
        sha256 = "708f335842ca133b3c2405ac9cc802954b2d115782e92cce857ed145949378df",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgcrypt-1.8.6-4.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libgcrypt-devel",
        downloaded_file_path = "libgcrypt-devel-1.8.6-4.fc33.x86_64.rpm",
        sha256 = "3ae76e2053fd25be37a36f1a0510d07a2ba722c654b9bd84551900e0d2f56dba",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgcrypt-devel-1.8.6-4.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libglvnd",
        downloaded_file_path = "libglvnd-1.3.2-2.fc33.x86_64.rpm",
        sha256 = "e528aeef96783b2dbdf920888fc11638e924a4c3286fa6615d8f4ee933825839",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libglvnd-1.3.2-2.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libglvnd-glx",
        downloaded_file_path = "libglvnd-glx-1.3.2-2.fc33.x86_64.rpm",
        sha256 = "a383adf80e7d8cbd692107fb246b80d4ba11c646314db585005793b36fac6938",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libglvnd-glx-1.3.2-2.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libgpg-error",
        downloaded_file_path = "libgpg-error-1.37-2.fc33.x86_64.rpm",
        sha256 = "3cae9778f31e53edbb057889cefcc82d854c908c08b62afaf187523729f10aa0",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgpg-error-1.37-2.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libgpg-error-devel",
        downloaded_file_path = "libgpg-error-devel-1.37-2.fc33.x86_64.rpm",
        sha256 = "5928bb6e7fba39f3a9f59dc9921f90560691cee80a524f31091ec338871e05c5",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgpg-error-devel-1.37-2.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libsodium",
        downloaded_file_path = "libsodium-1.0.18-6.fc33.x86_64.rpm",
        sha256 = "a5bc56ddb5741fed340cf635715489d43d276cb2cce92aa7d9147fa490a737b5",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libsodium-1.0.18-6.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libsodium-devel",
        downloaded_file_path = "libsodium-devel-1.0.18-6.fc33.x86_64.rpm",
        sha256 = "ed3cd6a91ad44713c2156e63d10a409d1994930590fc6fa48824947f77f84808",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libsodium-devel-1.0.18-6.fc33.x86_64.rpm"],
    )

    http_file(
        name = "libxcb",
        downloaded_file_path = "libxcb-1.13.1-5.fc33.x86_64.rpm",
        sha256 = "9df24baef091f324f92cb117429007e54488a0f4456c65402f4fec1fce1ddf9e",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libxcb-1.13.1-5.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qrencode-devel",
        downloaded_file_path = "qrencode-devel-4.0.2-6.fc33.x86_64.rpm",
        sha256 = "48a0ac8d4fc784d36f9961131ec94e5221b226408070cd9558706abb6b3515da",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qrencode-devel-4.0.2-6.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qrencode-libs",
        downloaded_file_path = "qrencode-libs-4.0.2-6.fc33.x86_64.rpm",
        sha256 = "edac6ebce4c4b01843b09d55bed7dfdb08f1b9cad2e631bdcc2692df859c7a31",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qrencode-libs-4.0.2-6.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qt5-linguist",
        downloaded_file_path = "qt5-linguist-5.15.1-1.fc33.x86_64.rpm",
        sha256 = "32430727443725e89e391eac8f6f8729d8b3fc63482fc0d8414ba59b2aa4afe1",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-linguist-5.15.1-1.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qt5-qtbase",
        downloaded_file_path = "qt5-qtbase-5.15.1-5.fc33.x86_64.rpm",
        sha256 = "b8804e45772575b3312d6b43b5bcd2eb31e9098dbf20667083e80deeb4cb961b",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-5.15.1-5.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qt5-qtbase-devel",
        downloaded_file_path = "qt5-qtbase-devel-5.15.1-5.fc33.x86_64.rpm",
        sha256 = "ef2eaee50ee1febcd5adefa0f785bbe9320077024cabae38338495ccec498213",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-devel-5.15.1-5.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qt5-qtbase-gui",
        downloaded_file_path = "qt5-qtbase-gui-5.15.1-5.fc33.x86_64.rpm",
        sha256 = "2ba7250c3d924fffc1fbc43ba32f0a8dd518cadd7120fa177bb4af09840eceb6",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-gui-5.15.1-5.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qt5-qtbase-private-devel",
        downloaded_file_path = "qt5-qtbase-private-devel-5.15.1-5.fc33.x86_64.rpm",
        sha256 = "f4536d29409660cae8e7f69438f44062963fa9eccfae5600a85bd3d6375dfe2b",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-private-devel-5.15.1-5.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qt5-qtsvg",
        downloaded_file_path = "qt5-qtsvg-5.15.1-1.fc33.x86_64.rpm",
        sha256 = "63bbfc604a82f045742a023da61e24172e03534384aa97388f51dcbb434720e2",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtsvg-5.15.1-1.fc33.x86_64.rpm"],
    )

    http_file(
        name = "qt5-qtsvg-devel",
        downloaded_file_path = "qt5-qtsvg-devel-5.15.1-1.fc33.x86_64.rpm",
        sha256 = "c293fe8d6c63034f6314269ec91bd55d3990ffd0c140592e5883d957e5bdb458",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtsvg-devel-5.15.1-1.fc33.x86_64.rpm"],
    )

    http_file(
        name = "xorg-x11-proto-devel",
        downloaded_file_path = "xorg-x11-proto-devel-2019.1-4.fc33.noarch.rpm",
        sha256 = "0786c326ca082b48eccc89abc12d4498c65d196b19f7237452d29b0640cb4125",
        urls = ["https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/x/xorg-x11-proto-devel-2019.1-4.fc33.noarch.rpm"],
    )
