# Ansible
## Install ansible
```sh
pip install --user --upgrade ansible
```

```sh
export PATH=$PATH:$HOME/.local/bin
```

```sh
sudo mkdir -p /usr/local/bin
```

## Install bazel
```sh
sh install_bazel.sh
```

## Install borgbackup
```sh
cat - <(curl -sS https://raw.githubusercontent.com/whs-dot-hk/ansible-fedora-32/master/roles/borgbackup/tasks/main.yml | sed 's|^|  |') <<EOF > install_borgbackup.yml
- name: Install borgbackup
  hosts: all
  tasks:
EOF
```

```sh
ansible-playbook -i localhost, -c local install_borgbackup.yml -K
```

## Install golang
```sh
cat - <(curl -sS https://raw.githubusercontent.com/whs-dot-hk/ansible-fedora-32/master/roles/golang/tasks/main.yml | sed 's|^|  |') <<EOF > install_golang.yml
- name: Install golang
  hosts: all
  tasks:
EOF
```

```sh
ansible-playbook -i localhost, -c local install_golang.yml -K
```

```sh
export PATH=$PATH:/usr/local/go/bin
```

### Install bazel buildifier
```sh
go get github.com/bazelbuild/buildtools/buildifier
```

## Install yarn
```sh
cat - <(curl -sS https://raw.githubusercontent.com/whs-dot-hk/ansible-fedora-32/master/roles/yarn/tasks/main.yml | sed 's|^|  |') <<EOF > install_yarn.yml
- name: Install yarn
  hosts: all
  tasks:
EOF
```

```sh
ansible-playbook -i localhost, -c local install_yarn.yml -K
```

```sh
export PATH=$PATH:$HOME/.yarn/bin
```
