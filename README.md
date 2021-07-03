# Bazelpkgs
| Name | Command |
| --- | --- |
| Firefox | `sh start_firefox.sh` |
| Makemkv | `sh start_makemkv.sh` |
| Mpv | `sh start_mpv.sh [youtube url]` |
| Smplayer | `sh start_smplayer.sh` |

# Pip
```sh
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
source ~/.bashrc
```
| Name | Command | Remarks |
| --- | --- | --- |
| Ansible | `pip install --user --upgrade ansible` | |
| Borgmatic | `pip install --user --upgrade borgmatic` | [Install borg](#user-content-install-borg) |

# Ansible
```sh
sudo mkdir -p /usr/local/bin
```

| Name | Command |
| --- | --- |
| Awscli | `sh install_awscli.sh [ext]` |
| Bazel | `sh install_bazel.sh` |
| Borg | <div id="install-borg">`sh install_borg.sh`</div> |
| Hugo | `sh install_hugo.sh` |

# Flatpak
```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

| Name | Command |
| --- | --- |
| LibreOffice | `flatpak install --or-update flathub org.libreoffice.LibreOffice` |
| Runescape | `flatpak install --or-update -y flathub com.jagex.RuneScape` |
| Steam | `flatpak install --or-update -y flathub com.valvesoftware.Steam` |

# Swupd
| Name | Command |
| --- | --- |
| Chess | `sudo swupd bundle-add gnome-chess` |

## Weak password

```sh
cp /usr/share/pam.d/common-password .
sed -i 's|use_authtok$||' common-password
sudo cp common-password /etc/pam.d
rm common-password
```

## Docker
```sh
sudo usermod -aG docker whs
```

## Git
```sh
git config --global user.name whs
git config --global user.email hswongac@gmail.com
```

## Keepassxc
### Download dependencies
```sh
rm -rf $HOME/my_keepassxc
mkdir $HOME/my_keepassxc
cd $HOME/Downloads
urls=(
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libICE-1.0.10-4.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libSM-1.2.3-6.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libX11-1.6.12-1.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libX11-devel-1.6.12-1.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libX11-xcb-1.6.12-1.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libXau-1.0.9-4.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libargon2-20171227-5.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libargon2-devel-20171227-5.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgcrypt-1.8.6-4.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgcrypt-devel-1.8.6-4.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libglvnd-1.3.2-2.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libglvnd-glx-1.3.2-2.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgpg-error-1.37-2.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libgpg-error-devel-1.37-2.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libsodium-1.0.18-6.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libsodium-devel-1.0.18-6.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/l/libxcb-1.13.1-5.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qrencode-devel-4.0.2-6.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qrencode-libs-4.0.2-6.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-linguist-5.15.1-1.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-5.15.1-5.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-devel-5.15.1-5.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-gui-5.15.1-5.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtbase-private-devel-5.15.1-5.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtsvg-5.15.1-1.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtsvg-devel-5.15.1-1.fc33.x86_64.rpm # build
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtx11extras-5.15.1-1.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/q/qt5-qtx11extras-devel-5.15.1-1.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/x/xcb-util-0.4.0-16.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/x/xcb-util-image-0.4.0-16.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/x/xcb-util-keysyms-0.4.0-14.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/x/xcb-util-renderutil-0.3.9-17.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/x/xcb-util-wm-0.4.1-19.fc33.x86_64.rpm
  https://nrt.edge.kernel.org/fedora-buffet/fedora/linux/development/33/Everything/x86_64/os/Packages/x/xorg-x11-proto-devel-2019.1-4.fc33.noarch.rpm # build
)
for url in ${urls[@]}
do
file=$(basename $url)
[[ -f $file ]] || curl -O $url
rpm2cpio $file | (cd $HOME/my_keepassxc; cpio -iduv)
done
patchelf --set-rpath $HOME/my_keepassxc/usr/lib64 $HOME/my_keepassxc/usr/lib64/qt5/bin/lrelease
```

### Build keepassxc
```sh
cd $HOME/keepassxc
rm -rf build
mkdir build
cd build
cmake -DWITH_XC_ALL=OFF -DCMAKE_PREFIX_PATH=$HOME/my_keepassxc/usr -DWITH_XC_DOCS=OFF ..
grep -rl lX11 . | xargs sed -i 's|-lX11|'$HOME'/my_keepassxc/usr/lib64/libX11.so.6|g'
make -j8
```
or
```sh
bazel build @keepassxc//:binary
```

### Run keepassxc
```sh
LD_LIBRARY_PATH=$HOME/my_keepassxc/usr/lib64 QT_DEBUG_PLUGINS=1 QT_PLUGIN_PATH=$HOME/my_keepassxc/usr/lib64/qt5/plugins $HOME/keepassxc/build/src/keepassxc
```
or
```sh
LD_LIBRARY_PATH=$HOME/my_keepassxc/usr/lib64 QT_DEBUG_PLUGINS=1 QT_PLUGIN_PATH=$HOME/my_keepassxc/usr/lib64/qt5/plugins bazel-bin/external/keepassxc/binary/bin/keepassxc
```

## Kpcli

### Install development packages
```sh
sudo apt-get install -y \
  build-essential \
  libexpat-dev \
  libreadline-dev
```

### Install perl modules
```sh
curl -L https://cpanmin.us/ -o cpanm
chmod +x cpanm
```

```sh
./cpanm --local-lib=~/perl5 local::lib
eval $(perl -I$HOME/perl5/lib/perl5/ -Mlocal::lib)
```

```sh
./cpanm \
  Authen::OATH \
  Clone \
  Convert::Base32 \
  Crypt::Rijndael \
  File::KeePass \
  Sort::Naturally \
  Term::ReadKey \
  Term::ReadLine::Gnu \
  Term::ShellUI \
  XML::Parser
```

### Download kpcli
```sh
curl -OJL https://sourceforge.net/projects/kpcli/files/kpcli-3.6.pl/download
chmod a+x kpcli-3.6.pl
```

### Otp example
```sh
./kpcli-3.6.pl
> new Internet/test
Adding new entry to "/Internet"
Title: test
Username:
Password:                ("g" or "w" to auto-generate, "i" for interactive)
URL:
Notes/Comments (""):
(end multi-line input with a single "." on a line)
| 2FA-TOTP: [TOTP]
| .
> otp Internet/test
```

```sh
# password is a file contains the master password of test.kdbx
token=($(./kpcli-3.6.pl --kdb=test.kdbx --pwfile=password --command=otp\ Internet/test))
echo ${token[0]}
```
