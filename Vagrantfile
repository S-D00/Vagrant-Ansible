
#system ("ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''")

Vagrant.configure("2") do |config|

  #config.ssh.insert_key = false

  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/trusty64"
    app.vm.network "private_network", ip: "192.168.73.15"
    app.vm.provider "virtualbox" do |vb|
    app.vm.synced_folder ".", "/vagrant"
      vb.customize ["modifyvm", :id, "--name", "app"]
    end
    app.vm.hostname = "app"

  end

  #config.vm.define "proxy" do |proxy|
    #proxy.vm.box = "ubuntu/trusty64"
    #proxy.vm.network "private_network", ip: "192.168.73.16"
    #proxy.vm.network "forwarded_port", guest: 80, host: 8080
    #proxy.vm.provider "virtualbox" do |vb|
    #proxy.vm.synced_folder ".", "/vagrant"
      #vb.customize ["modifyvm", :id, "--name", "proxy"]
    #end
    #proxy.vm.hostname = "proxy"

  #end

  config.vm.define "master", primary: true do |master|
    master.vm.box = "ubuntu/trusty64"
    master.vm.network "private_network", ip: "192.168.73.14"
    master.vm.provider "virtualbox" do |vb|
    master.vm.synced_folder ".", "/vagrant"
      vb.customize ["modifyvm", :id, "--name", "master"]
      vb.memory = 1024

    end
    master.vm.hostname = "master"
  
      # Install Ansible
      master.vm.provision :shell, path:"provision_ansible.sh"
   
      #Add Ansible hosts
      master.vm.provision :shell, path:"ansiblehostsconfig.sh"
  
      #Add hosts to hostsfile
      master.vm.provision :shell, path:"hostsfile.sh"
  
      #Generate & push ssh key
      master.vm.provision :shell, path: "passSshkey.sh"    

      #Run ansible playbook
      master.vm.provision :shell, inline: <<-SHELL

      sudo ansible-playbook /vagrant/play_all.yml

    SHELL

  end

end