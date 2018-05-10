mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh

ssh-keygen -f /home/vagrant/.ssh/id_rsa -t rsa -N ''
echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

apt-get update -y
apt-get install sshpass -y

sshpass -pvagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.73.14
sshpass -pvagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.73.15
#sshpass -pvagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@192.168.73.16