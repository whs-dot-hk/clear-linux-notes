PATH=$PATH:$sshpass_path ansible-playbook -i 192.168.122.$1, -c ssh install_awscli.yml -K
