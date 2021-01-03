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
curl -O https://download.nvidia.com/XFree86/Linux-x86_64/460.27.04/NVIDIA-Linux-x86_64-460.27.04.run
```

```sh
# Save the install cmd before reboot
tee ~/install_nvidia.sh <<EOF > /dev/null
sudo sh NVIDIA-Linux-x86_64-460.27.04.run \
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
reboot
```

```sh
sh install_nvidia.sh
```

# Cuda
https://docs.01.org/clearlinux/latest/tutorials/nvidia-cuda.html

```sh
sudo swupd bundle-add c-extras-gcc8
sudo mkdir -p /usr/local/cuda/bin
sudo ln -s /usr/bin/gcc-8 /usr/local/cuda/bin/gcc
sudo ln -s /usr/bin/g++-8 /usr/local/cuda/bin/g++
```

```sh
curl -O https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda_11.2.0_460.27.04_linux.run
```

```sh
sudo sh cuda_11.2.0_460.27.04_linux.run \
--toolkit \
--installpath=/opt/cuda \
--no-man-page \
--override \
--silent
```

# Link libraries
```sh
sudo ln -sfv /opt/nvidia/lib/libEGL.so /usr/lib64/libEGL.so
sudo ln -sfv /opt/nvidia/lib/libGL.so /usr/lib64/libGL.so
```

# Modprobe script
https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#runfile-verifications
