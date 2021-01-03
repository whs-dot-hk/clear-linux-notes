# Install `desktop-dev` and `devpkg-libass`
```sh
sudo swupd bundle-add desktop-dev
sudo swupd bundle-add devpkg-libass
```

# Install Nvidia
https://github.com/whs-dot-hk/clear-linux-notes/blob/master/nvidia.md#user-content-nvidia

# Install CUDA
https://github.com/whs-dot-hk/clear-linux-notes/blob/master/nvidia.md#user-content-cuda

# Link `libEGL` and `libGL`
https://github.com/whs-dot-hk/clear-linux-notes/blob/master/nvidia.md#user-content-link-libraries

# Run modprobe script
https://github.com/whs-dot-hk/clear-linux-notes/blob/master/nvidia.md#user-content-modprobe-script

Save the script as `modprobe.sh` and run it

# Config SMPlayer
```sh
mkdir -p $HOME/.config/smplayer
tee $HOME/.config/smplayer/smplayer.ini <<EOF > /dev/null
[advanced]
mplayer_additional_options=--hwdec=nvdec --vo=gpu
[default_gui]
; Display remaining time instead of total time
actions\floating_control\1=play_or_pause, stop, separator, rewind1, current_timelabel_action, timeslider_action, remaining_timelabel_action, forward1, separator, fullscreen, mute, volumeslider_action
EOF
```

# Start SMPlayer
```sh
sh start_smplayer.sh
```
