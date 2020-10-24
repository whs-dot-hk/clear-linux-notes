## Weak password

```sh
cp /usr/share/pam.d/common-password .
sed -i 's|use_authtok$||' common-password
sudo cp common-password /etc/pam.d
rm common-password
```

## Virtual machine
https://docs.01.org/clearlinux/latest/get-started/virtual-machine-install/virt-manager.html

### Debian
```sh
echo "allow virbr0" | sudo tee /etc/qemu/bridge.conf
```

```sh
curl https://www.debian.org/releases/stretch/example-preseed.txt -o preseed.cfg
virt-install \
  --name guest1 \
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
virsh destroy guest1
virsh undefine --domain guest1 --remove-all-storage --delete-snapshots
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
sudo apt-get install -y libexpat-dev libreadline-dev
```

### Install perl modules
```sh
cpan App::cpanminus
cpanm Authen::OATH Clone Convert::Base32 Crypt::Rijndael File::KeePass Sort::Naturally Term::ReadKey Term::ReadLine::Gnu Term::ShellUI XML::Parser
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
