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
# Create install_bazel.yml
cat - <(curl -sS https://raw.githubusercontent.com/whs-dot-hk/ansible-fedora-32/master/roles/bazel/tasks/main.yml | sed 's|^|  |') <<EOF > install_bazel.yml
- name: Install bazel
  hosts: all
  tasks:
EOF
```

[Appendix A. Example `install_bazel.yml`](#user-content-appendix-a-example-install_bazelyml)

```sh
ansible-playbook -i localhost, -c local install_bazel.yml -K
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

# Appendix A. Example `install_bazel.yml`
```yaml
- name: install bazel
  hosts: all
  tasks:
  - become: "yes"
    get_url:
      dest: /usr/local/bin/bazel
      mode: "0755"
      url: >-
        https://github.com/bazelbuild/bazel/releases/download/3.7.0/bazel-3.7.0-linux-x86_64
    name: install bazel
```