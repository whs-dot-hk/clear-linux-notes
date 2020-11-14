## Weak password

```sh
cp /usr/share/pam.d/common-password .
sed -i 's|use_authtok$||' common-password
sudo cp common-password /etc/pam.d
rm common-password
```

## Ansible
```sh
pip install --user --upgrade ansible
```

### Install bazel
```sh
# Create install_bazel.yml
cat - <(curl -sS https://raw.githubusercontent.com/whs-dot-hk/ansible-fedora-32/master/roles/bazel/tasks/main.yml | sed 's|^|  |') <<EOF > install_bazel.yml
- name: Install bazel
  hosts: all
  tasks:
EOF
```

```yaml
install_bazel.yml
---
- name: Install bazel
  hosts: all
  tasks:
  - become: "yes"
    get_url:
      dest: /usr/local/bin/bazel
      mode: "0755"
      url: >-
        https://github.com/bazelbuild/bazel/releases/download/3.7.0/bazel-3.7.0-linux-x86_64
    name: Install bazel
```

```sh
ansible-playbook -i localhost, -c local install_bazel.yml -K
```

## Golang
```sh
export PATH=$PATH:/usr/local/go/bin
```

### Install bazel buildifier
```sh
go get github.com/bazelbuild/buildtools/buildifier
```

## Yarn
```sh
export PATH=$PATH:$HOME/.yarn/bin
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
mkdir $HOME/my_patchelf
git clone https://github.com/NixOS/patchelf.git
cd patchelf
./bootstrap.sh
sh configure --prefix=$HOME/my_patchelf
make -j8
make check
make install
```

```sh
export PATH=$PATH:$HOME/my_patchelf/bin
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

## Virtual machine
https://docs.01.org/clearlinux/latest/get-started/virtual-machine-install/virt-manager.html

### Default network
```sh
# http://mirrors.fedoraproject.org
curl -LO https://download.fedoraproject.org/pub/fedora/linux/releases/33/Everything/x86_64/os/Packages/l/libvirt-daemon-config-network-6.6.0-2.fc33.x86_64.rpm
rpm2cpio libvirt-daemon-config-network-6.6.0-2.fc33.x86_64.rpm | cpio -iduv ./usr/share/libvirt/networks/default.xml
sudo virsh net-define usr/share/libvirt/networks/default.xml
sudo virsh net-autostart default
sudo virsh net-start default
# Debug
sudo brctl show
```

### Allow virbr0
```sh
sudo mkdir -p /etc/qemu
echo "allow virbr0" | sudo tee /etc/qemu/bridge.conf
```

### Debian 9
```sh
curl https://www.debian.org/releases/stretch/example-preseed.txt -o preseed.cfg
```

[Appendix A. Example `preseed.cfg`](#appendix-a-example-preseedcfg)

```sh
virt-install \
  --name debian9 \
  --memory 2048 \
  --vcpus 2 \
  --disk size=8 \
  --network=bridge:virbr0 \
  --location http://ftp.debian.org/debian/dists/stretch/main/installer-amd64 \
  --os-variant debian9 \
  --initrd-inject ./preseed.cfg \
  --extra-args="ks=file:/preseed.cfg"
```

```sh
virsh destroy debian9
virsh undefine --domain debian9 --remove-all-storage --delete-snapshots
```

```sh
sudo virsh net-dhcp-leases default
```

### Fedora 33
```txt
anaconda-ks.cfg
---
autopart
clearpart --initlabel
keyboard --xlayouts=us
lang en_US.UTF-8
rootpw --lock
timezone --utc Asia/Hong_Kong
user --name whs --password harrypotter --groups wheel
```

```sh
virt-install \
  --name fedora33 \
  --memory 2048 \
  --vcpus 2 \
  --disk size=8 \
  --network=bridge:virbr0 \
  --location https://download.fedoraproject.org/pub/fedora/linux/releases/33/Server/x86_64/os \
  --os-variant fedora33 \
  --initrd-inject ./anaconda-ks.cfg \
  --extra-args="inst.ks=file:/anaconda-ks.cfg"
```

```sh
virsh destroy fedora33
virsh undefine --domain fedora33 --remove-all-storage --delete-snapshots
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

## Appendix A. Example `preseed.cfg`
```txt
preseed.cfg
---
#### Contents of the preconfiguration file (for stretch)
### Localization
# Preseeding only locale sets language, country and locale.
d-i debian-installer/locale string en_US

# The values can also be preseeded individually for greater flexibility.
#d-i debian-installer/language string en
#d-i debian-installer/country string NL
#d-i debian-installer/locale string en_GB.UTF-8
# Optionally specify additional locales to be generated.
#d-i localechooser/supported-locales multiselect en_US.UTF-8, nl_NL.UTF-8

# Keyboard selection.
d-i keyboard-configuration/xkb-keymap select us
# d-i keyboard-configuration/toggle select No toggling

### Network configuration
# Disable network configuration entirely. This is useful for cdrom
# installations on non-networked devices where the network questions,
# warning and long timeouts are a nuisance.
#d-i netcfg/enable boolean false

# netcfg will choose an interface that has link if possible. This makes it
# skip displaying a list if there is more than one interface.
d-i netcfg/choose_interface select auto

# To pick a particular interface instead:
#d-i netcfg/choose_interface select eth1

# To set a different link detection timeout (default is 3 seconds).
# Values are interpreted as seconds.
#d-i netcfg/link_wait_timeout string 10

# If you have a slow dhcp server and the installer times out waiting for
# it, this might be useful.
#d-i netcfg/dhcp_timeout string 60
#d-i netcfg/dhcpv6_timeout string 60

# If you prefer to configure the network manually, uncomment this line and
# the static network configuration below.
#d-i netcfg/disable_autoconfig boolean true

# If you want the preconfiguration file to work on systems both with and
# without a dhcp server, uncomment these lines and the static network
# configuration below.
#d-i netcfg/dhcp_failed note
#d-i netcfg/dhcp_options select Configure network manually

# Static network configuration.
#
# IPv4 example
#d-i netcfg/get_ipaddress string 192.168.1.42
#d-i netcfg/get_netmask string 255.255.255.0
#d-i netcfg/get_gateway string 192.168.1.1
#d-i netcfg/get_nameservers string 192.168.1.1
#d-i netcfg/confirm_static boolean true
#
# IPv6 example
#d-i netcfg/get_ipaddress string fc00::2
#d-i netcfg/get_netmask string ffff:ffff:ffff:ffff::
#d-i netcfg/get_gateway string fc00::1
#d-i netcfg/get_nameservers string fc00::1
#d-i netcfg/confirm_static boolean true

# Any hostname and domain names assigned from dhcp take precedence over
# values set here. However, setting the values still prevents the questions
# from being shown, even if values come from dhcp.
d-i netcfg/get_hostname string unassigned-hostname
d-i netcfg/get_domain string unassigned-domain

# If you want to force a hostname, regardless of what either the DHCP
# server returns or what the reverse DNS entry for the IP is, uncomment
# and adjust the following line.
#d-i netcfg/hostname string somehost

# Disable that annoying WEP key dialog.
d-i netcfg/wireless_wep string
# The wacky dhcp hostname that some ISPs use as a password of sorts.
#d-i netcfg/dhcp_hostname string radish

# If non-free firmware is needed for the network or other hardware, you can
# configure the installer to always try to load it, without prompting. Or
# change to false to disable asking.
#d-i hw-detect/load_firmware boolean true

### Network console
# Use the following settings if you wish to make use of the network-console
# component for remote installation over SSH. This only makes sense if you
# intend to perform the remainder of the installation manually.
#d-i anna/choose_modules string network-console
#d-i network-console/authorized_keys_url string http://10.0.0.1/openssh-key
#d-i network-console/password password r00tme
#d-i network-console/password-again password r00tme

### Mirror settings
# If you select ftp, the mirror/country string does not need to be set.
#d-i mirror/protocol string ftp
d-i mirror/country string manual
d-i mirror/http/hostname string http.us.debian.org
d-i mirror/http/directory string /debian
d-i mirror/http/proxy string

# Suite to install.
#d-i mirror/suite string testing
# Suite to use for loading installer components (optional).
#d-i mirror/udeb/suite string testing

### Account setup
# Skip creation of a root account (normal user account will be able to
# use sudo).
d-i passwd/root-login boolean false
# Alternatively, to skip creation of a normal user account.
#d-i passwd/make-user boolean false

# Root password, either in clear text
#d-i passwd/root-password password r00tme
#d-i passwd/root-password-again password r00tme
# or encrypted using a crypt(3)  hash.
#d-i passwd/root-password-crypted password [crypt(3) hash]

# To create a normal user account.
d-i passwd/user-fullname string whs
d-i passwd/username string whs
# Normal user's password, either in clear text
d-i passwd/user-password password harrypotter
d-i passwd/user-password-again password harrypotter
# or encrypted using a crypt(3) hash.
#d-i passwd/user-password-crypted password [crypt(3) hash]
# Create the first user with the specified UID instead of the default.
#d-i passwd/user-uid string 1010

# The user account will be added to some standard initial groups. To
# override that, use this.
#d-i passwd/user-default-groups string audio cdrom video

### Clock and time zone setup
# Controls whether or not the hardware clock is set to UTC.
d-i clock-setup/utc boolean true

# You may set this to any valid setting for $TZ; see the contents of
# /usr/share/zoneinfo/ for valid values.
d-i time/zone string US/Eastern

# Controls whether to use NTP to set the clock during the install
d-i clock-setup/ntp boolean true
# NTP server to use. The default is almost always fine here.
#d-i clock-setup/ntp-server string ntp.example.com

### Partitioning
## Partitioning example
# If the system has free space you can choose to only partition that space.
# This is only honoured if partman-auto/method (below) is not set.
#d-i partman-auto/init_automatically_partition select biggest_free

# Alternatively, you may specify a disk to partition. If the system has only
# one disk the installer will default to using that, but otherwise the device
# name must be given in traditional, non-devfs format (so e.g. /dev/sda
# and not e.g. /dev/discs/disc0/disc).
# For example, to use the first SCSI/SATA hard disk:
#d-i partman-auto/disk string /dev/sda
# In addition, you'll need to specify the method to use.
# The presently available methods are:
# - regular: use the usual partition types for your architecture
# - lvm:     use LVM to partition the disk
# - crypto:  use LVM within an encrypted partition
d-i partman-auto/method string lvm

# If one of the disks that are going to be automatically partitioned
# contains an old LVM configuration, the user will normally receive a
# warning. This can be preseeded away...
d-i partman-lvm/device_remove_lvm boolean true
# The same applies to pre-existing software RAID array:
d-i partman-md/device_remove_md boolean true
# And the same goes for the confirmation to write the lvm partitions.
d-i partman-lvm/confirm boolean true
d-i partman-lvm/confirm_nooverwrite boolean true

# You can choose one of the three predefined partitioning recipes:
# - atomic: all files in one partition
# - home:   separate /home partition
# - multi:  separate /home, /var, and /tmp partitions
d-i partman-auto/choose_recipe select atomic

# Or provide a recipe of your own...
# If you have a way to get a recipe file into the d-i environment, you can
# just point at it.
#d-i partman-auto/expert_recipe_file string /hd-media/recipe

# If not, you can put an entire recipe into the preconfiguration file in one
# (logical) line. This example creates a small /boot partition, suitable
# swap, and uses the rest of the space for the root partition:
#d-i partman-auto/expert_recipe string                         \
#      boot-root ::                                            \
#              40 50 100 ext3                                  \
#                      $primary{ } $bootable{ }                \
#                      method{ format } format{ }              \
#                      use_filesystem{ } filesystem{ ext3 }    \
#                      mountpoint{ /boot }                     \
#              .                                               \
#              500 10000 1000000000 ext3                       \
#                      method{ format } format{ }              \
#                      use_filesystem{ } filesystem{ ext3 }    \
#                      mountpoint{ / }                         \
#              .                                               \
#              64 512 300% linux-swap                          \
#                      method{ swap } format{ }                \
#              .

# The full recipe format is documented in the file partman-auto-recipe.txt
# included in the 'debian-installer' package or available from D-I source
# repository. This also documents how to specify settings such as file
# system labels, volume group names and which physical devices to include
# in a volume group.

# This makes partman automatically partition without confirmation, provided
# that you told it what to do using one of the methods above.
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true

# When disk encryption is enabled, skip wiping the partitions beforehand.
#d-i partman-auto-crypto/erase_disks boolean false

## Partitioning using RAID
# The method should be set to "raid".
#d-i partman-auto/method string raid
# Specify the disks to be partitioned. They will all get the same layout,
# so this will only work if the disks are the same size.
#d-i partman-auto/disk string /dev/sda /dev/sdb

# Next you need to specify the physical partitions that will be used. 
#d-i partman-auto/expert_recipe string \
#      multiraid ::                                         \
#              1000 5000 4000 raid                          \
#                      $primary{ } method{ raid }           \
#              .                                            \
#              64 512 300% raid                             \
#                      method{ raid }                       \
#              .                                            \
#              500 10000 1000000000 raid                    \
#                      method{ raid }                       \
#              .

# Last you need to specify how the previously defined partitions will be
# used in the RAID setup. Remember to use the correct partition numbers
# for logical partitions. RAID levels 0, 1, 5, 6 and 10 are supported;
# devices are separated using "#".
# Parameters are:
# <raidtype> <devcount> <sparecount> <fstype> <mountpoint> \
#          <devices> <sparedevices>

#d-i partman-auto-raid/recipe string \
#    1 2 0 ext3 /                    \
#          /dev/sda1#/dev/sdb1       \
#    .                               \
#    1 2 0 swap -                    \
#          /dev/sda5#/dev/sdb5       \
#    .                               \
#    0 2 0 ext3 /home                \
#          /dev/sda6#/dev/sdb6       \
#    .

# For additional information see the file partman-auto-raid-recipe.txt
# included in the 'debian-installer' package or available from D-I source
# repository.

# This makes partman automatically partition without confirmation.
d-i partman-md/confirm boolean true
d-i partman-partitioning/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true

## Controlling how partitions are mounted
# The default is to mount by UUID, but you can also choose "traditional" to
# use traditional device names, or "label" to try filesystem labels before
# falling back to UUIDs.
#d-i partman/mount_style select uuid

### Base system installation
# Configure APT to not install recommended packages by default. Use of this
# option can result in an incomplete system and should only be used by very
# experienced users.
#d-i base-installer/install-recommends boolean false

# The kernel image (meta) package to be installed; "none" can be used if no
# kernel is to be installed.
#d-i base-installer/kernel/image string linux-image-686

### Apt setup
# You can choose to install non-free and contrib software.
#d-i apt-setup/non-free boolean true
#d-i apt-setup/contrib boolean true
# Uncomment this if you don't want to use a network mirror.
#d-i apt-setup/use_mirror boolean false
# Select which update services to use; define the mirrors to be used.
# Values shown below are the normal defaults.
#d-i apt-setup/services-select multiselect security, updates
#d-i apt-setup/security_host string security.debian.org

# Additional repositories, local[0-9] available
#d-i apt-setup/local0/repository string \
#       http://local.server/debian stable main
#d-i apt-setup/local0/comment string local server
# Enable deb-src lines
#d-i apt-setup/local0/source boolean true
# URL to the public key of the local repository; you must provide a key or
# apt will complain about the unauthenticated repository and so the
# sources.list line will be left commented out
#d-i apt-setup/local0/key string http://local.server/key

# By default the installer requires that repositories be authenticated
# using a known gpg key. This setting can be used to disable that
# authentication. Warning: Insecure, not recommended.
#d-i debian-installer/allow_unauthenticated boolean true

# Uncomment this to add multiarch configuration for i386
#d-i apt-setup/multiarch string i386


### Package selection
tasksel tasksel/first multiselect standard

# Individual additional packages to install
#d-i pkgsel/include string openssh-server build-essential
# Whether to upgrade packages after debootstrap.
# Allowed values: none, safe-upgrade, full-upgrade
#d-i pkgsel/upgrade select none

# Some versions of the installer can report back on what software you have
# installed, and what software you use. The default is not to report back,
# but sending reports helps the project determine what software is most
# popular and include it on CDs.
popularity-contest popularity-contest/participate boolean false

### Boot loader installation
# Grub is the default boot loader (for x86). If you want lilo installed
# instead, uncomment this:
#d-i grub-installer/skip boolean true
# To also skip installing lilo, and install no bootloader, uncomment this
# too:
#d-i lilo-installer/skip boolean true


# This is fairly safe to set, it makes grub install automatically to the MBR
# if no other operating system is detected on the machine.
d-i grub-installer/only_debian boolean true

# This one makes grub-installer install to the MBR if it also finds some other
# OS, which is less safe as it might not be able to boot that other OS.
d-i grub-installer/with_other_os boolean true

# Due notably to potential USB sticks, the location of the MBR can not be
# determined safely in general, so this needs to be specified:
#d-i grub-installer/bootdev  string /dev/sda
# To install to the first device (assuming it is not a USB stick):
d-i grub-installer/bootdev  string default

# Alternatively, if you want to install to a location other than the mbr,
# uncomment and edit these lines:
#d-i grub-installer/only_debian boolean false
#d-i grub-installer/with_other_os boolean false
#d-i grub-installer/bootdev  string (hd0,1)
# To install grub to multiple disks:
#d-i grub-installer/bootdev  string (hd0,1) (hd1,1) (hd2,1)

# Optional password for grub, either in clear text
#d-i grub-installer/password password r00tme
#d-i grub-installer/password-again password r00tme
# or encrypted using an MD5 hash, see grub-md5-crypt(8).
#d-i grub-installer/password-crypted password [MD5 hash]

# Use the following option to add additional boot parameters for the
# installed system (if supported by the bootloader installer).
# Note: options passed to the installer will be added automatically.
#d-i debian-installer/add-kernel-opts string nousb

### Finishing up the installation
# During installations from serial console, the regular virtual consoles
# (VT1-VT6) are normally disabled in /etc/inittab. Uncomment the next
# line to prevent this.
#d-i finish-install/keep-consoles boolean true

# Avoid that last message about the install being complete.
d-i finish-install/reboot_in_progress note

# This will prevent the installer from ejecting the CD during the reboot,
# which is useful in some situations.
#d-i cdrom-detect/eject boolean false

# This is how to make the installer shutdown when finished, but not
# reboot into the installed system.
#d-i debian-installer/exit/halt boolean true
# This will power off the machine instead of just halting it.
#d-i debian-installer/exit/poweroff boolean true

### Preseeding other packages
# Depending on what software you choose to install, or if things go wrong
# during the installation process, it's possible that other questions may
# be asked. You can preseed those too, of course. To get a list of every
# possible question that could be asked during an install, do an
# installation, and then run these commands:
#   debconf-get-selections --installer > file
#   debconf-get-selections >> file


#### Advanced options
### Running custom commands during the installation
# d-i preseeding is inherently not secure. Nothing in the installer checks
# for attempts at buffer overflows or other exploits of the values of a
# preconfiguration file like this one. Only use preconfiguration files from
# trusted locations! To drive that home, and because it's generally useful,
# here's a way to run any shell command you'd like inside the installer,
# automatically.

# This first command is run as early as possible, just after
# preseeding is read.
#d-i preseed/early_command string anna-install some-udeb
# This command is run immediately before the partitioner starts. It may be
# useful to apply dynamic partitioner preseeding that depends on the state
# of the disks (which may not be visible when preseed/early_command runs).
#d-i partman/early_command \
#       string debconf-set partman-auto/disk "$(list-devices disk | head -n1)"
# This command is run just before the install finishes, but when there is
# still a usable /target directory. You can chroot to /target and use it
# directly, or use the apt-install and in-target commands to easily install
# packages and run commands in the target system.
#d-i preseed/late_command string apt-install zsh; in-target chsh -s /bin/zsh
d-i preseed/late_command string apt-install openssh-server curl unzip git
```
