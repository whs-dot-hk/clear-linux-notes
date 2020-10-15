## Weak password

```sh
cp /usr/share/pam.d/common-password .
sed -i 's|use_authtok$||' common-password
sudo cp common-password /etc/pam.d
rm common-password
```
