https://docs.01.org/clearlinux/latest/guides/kernel/kernel-development.html

```sh
sudo swupd bundle-add \
  kernel-native-dkms \
  os-clr-on-clr
```

```sh
sudo clr-boot-manager update
reboot
```

```sh
curl -O https://raw.githubusercontent.com/clearlinux/common/master/user-setup.sh
sh user-setup.sh
cd clearlinux
make clone_linux
cd packages/linux
make sources
tar -xvf linux-5.9.10.tar.xz
cd linux-5.9.10
git init
git add -A
git commit -m "First commit"
git am ../*.patch
vim kernel/module.c
```

```c
kernel/module.c
---
        // if (license == GPL_ONLY)
        //      mod->using_gplonly_symbols = true;

        // if (!inherit_taint(mod, owner)) {
        //      sym = NULL;
        //      goto getname;
        // }
```

```sh
git add kernel/module.c
git commit -m "My patch"
git format-patch -1
cp 0001-My-patch.patch ../2001-My-patch.patch
cd ..
vim linux.spec
```

```specfile
linux.spec
---
Patch2001: 2001-My-patch.patch

...

%patch2001 -p1
```

```sh
make build
```

```sh
cd rpms
find . -name \*.rpm | xargs -I'{}' sh -c "rpm2cpio '{}' | (cd /; sudo cpio -i -d -u -v)"
```

```sh
sudo clr-boot-manager update
reboot
```
