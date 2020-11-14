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

## Firefox
### Run firefox
```sh
git clone https://github.com/whs-dot-hk/clear-linux-notes.git
cd clear-linux-notes
bazel build @ffmpeg//:library
LD_LIBRARY_PATH=$(find -L bazel-out -type d -path **/copy_*/*/lib | sed -e ':a;N;$!ba;s|\n|:|g') firefox
```

```sh
source <(echo alias firefox='"'"LD_LIBRARY_PATH=\$(find -L `pwd`/bazel-out -type d -path **/copy_*/*/lib | sed -e ':a;N;\$!ba;s|\n|:|g') /usr/bin/firefox"'"')
firefox
```

### Plugins
* https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers
* https://addons.mozilla.org/en-US/firefox/addon/noscript
* https://addons.mozilla.org/en-US/firefox/addon/ublock-origin
* https://addons.mozilla.org/en-US/firefox/addon/umatrix

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

## Minijail

### Install libcap
```sh
# Debian
sudo apt-get install -y libcap-dev
# or clear linux
sudo swupd bundle-add devpkg-libcap
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
