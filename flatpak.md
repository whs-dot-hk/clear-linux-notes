https://docs.flatpak.org/en/latest/using-flatpak.html

# Steam
```sh
# Kill steam
ps aux | grep steam | grep -v grep | awk '{print "kill " $2}' | sh
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
