```sh
sudo swupd bundle-add kernel-native-dkms
```

# Nvidia
https://docs.01.org/clearlinux/latest/tutorials/nvidia.html

```sh
# Disable nouveau
sudo mkdir -p /etc/modprobe.d
printf "blacklist nouveau \noptions nouveau modeset=0 \n" | sudo tee /etc/modprobe.d/disable-nouveau.conf

# Configure dynamic linker
echo "include /etc/ld.so.conf.d/*.conf" | sudo tee /etc/ld.so.conf
sudo mkdir -p /etc/ld.so.conf.d
printf "/opt/nvidia/lib \n/opt/nvidia/lib32 \n" | sudo tee /etc/ld.so.conf.d/nvidia.conf
sudo ldconfig

# Configure xorg
sudo mkdir -p /etc/X11/xorg.conf.d
sudo tee /etc/X11/xorg.conf.d/nvidia-files-opt.conf <<EOF > /dev/null
Section "Files"
        ModulePath      "/usr/lib64/xorg/modules"
        ModulePath      "/opt/nvidia/lib64/xorg/modules"
EndSection
EOF
```

```sh
# https://download.nvidia.com/XFree86/Linux-x86_64
cd ~/Downloads
curl -O https://download.nvidia.com/XFree86/Linux-x86_64/470.42.01/NVIDIA-Linux-x86_64-470.42.01.run
```

```sh
# Save the install cmd before reboot
tee ~/install_nvidia.sh <<EOF > /dev/null
sudo sh ~/Downloads/NVIDIA-Linux-x86_64-470.42.01.run \
--utility-prefix=/opt/nvidia \
--opengl-prefix=/opt/nvidia \
--compat32-prefix=/opt/nvidia \
--compat32-libdir=lib32 \
--x-prefix=/opt/nvidia \
--x-module-path=/opt/nvidia/lib64/xorg/modules \
--x-library-path=/opt/nvidia/lib64 \
--x-sysconfig-path=/etc/X11/xorg.conf.d \
--documentation-prefix=/opt/nvidia \
--application-profile-path=/etc/nvidia/nvidia-application-profiles-rc.d \
--no-precompiled-interface \
--no-nvidia-modprobe \
--no-distro-scripts \
--force-libglx-indirect \
--glvnd-egl-config-path=/etc/glvnd/egl_vendor.d \
--egl-external-platform-config-path=/etc/egl/egl_external_platform.d  \
--dkms \
--silent
EOF
```

```sh
reboot
```

```sh
sh install_nvidia.sh
```

# Cuda
https://docs.01.org/clearlinux/latest/tutorials/nvidia-cuda.html

```sh
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=20.04&target_type=runfile_local
cd ~/Downloads
curl -O https://developer.download.nvidia.com/compute/cuda/11.4.0/local_installers/cuda_11.4.0_470.42.01_linux.run
```

```sh
sudo sh cuda_11.4.0_470.42.01_linux.run \
--toolkit \
--installpath=/opt/cuda \
--no-man-page \
--override \
--silent
```

# Install GCC 8
```sh
sudo swupd bundle-add c-extras-gcc8
sudo mkdir -p /usr/local/cuda/bin
sudo ln -s /usr/bin/gcc-8 /usr/local/cuda/bin/gcc
sudo ln -s /usr/bin/g++-8 /usr/local/cuda/bin/g++
```


# Link libraries
```sh
sudo ln -sfv /opt/nvidia/lib/libEGL.so /usr/lib64/libEGL.so
sudo ln -sfv /opt/nvidia/lib/libGL.so /usr/lib64/libGL.so
sudo ln -sfv /opt/nvidia/lib/libGLESv2.so /usr/lib64/libGLESv2.so
```

# Modprobe script
https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile-verifications

# Update
```sh
sudo systemctl set-default multi-user.target
# Download nvidia driver
reboot
# Install nvidia driver
sudo systemctl set-default graphical.target
reboot
# Link libraries
```

```sh
flatpak update -y
```

```sh
modinfo nvidia | grep ^version
```
