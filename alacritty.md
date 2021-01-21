https://github.com/alacritty/alacritty/blob/master/INSTALL.md

```sh
curl -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
sed -i 's,alacritty,tabbed alacritty --embed,' extra/linux/Alacritty.desktop
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```
