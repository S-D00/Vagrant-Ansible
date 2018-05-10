printf '[all]\n192.168.73.14 ansible_port=22 ansible_user=vagrant\napp ansible_host=192.168.73.15 ansible_port=22\nproxy ansible_host=192.168.73.16 ansible_port=22\n\n' >> /etc/ansible/hosts

sudo mv /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.old

sudo touch /etc/ansible/ansible.cfg

printf '[defaults]\nremote_user = vagrant\nprivate_key_file = /home/vagrant/.ssh/id_rsa'>> /etc/ansible/ansible.cfg