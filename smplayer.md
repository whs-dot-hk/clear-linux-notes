```sh
mkdir -p $HOME/.config/smplayer
tee $HOME/.config/smplayer/smplayer.ini <<EOF > /dev/null
[advanced]
mplayer_additional_options=--hwdec=nvdec --vo=gpu
EOF
```

```sh
sh start_smplayer.sh
```
