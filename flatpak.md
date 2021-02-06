https://docs.flatpak.org/en/latest/using-flatpak.html

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

# Steam
```sh
flatpak install --or-update flathub com.valvesoftware.Steam
```

## Civ6
https://www.protondb.com/app/289070

Works out of the box!

## Gta5
https://www.protondb.com/app/271590

| Property | Value |
| --- | --- |
| Proton version | `5.0-10` |
| Launch options | `-fullscreen` |

```sh
# Remove settings.xml
find $HOME/.var/app/com.valvesoftware.Steam -path **/My\ Documents/Rockstar\ Games/GTA\ V/settings.xml -exec rm {} \+
```
