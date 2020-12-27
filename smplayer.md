```sh
mkdir -p $HOME/.config/smplayer
tee $HOME/.config/smplayer/smplayer.ini <<EOF > /dev/null
[advanced]
mplayer_additional_options=--hwdec=nvdec --vo=gpu
[default_gui]
actions\floating_control\1=play_or_pause, stop, separator, rewind1, current_timelabel_action, timeslider_action, remaining_timelabel_action, forward1, separator, fullscreen, mute, volumeslider_action
EOF
```

```sh
sh start_smplayer.sh
```
