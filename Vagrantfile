# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.define "ubuntutemplate" do |template|
    template.vm.hostname = "ubuntutemplate"
    template.vm.box = "ubuntu/focal64"

    template.vm.network "private_network", ip: "192.168.78.2", adapter: 2

    template.vm.provider "virtualbox" do |vb|  
      vb.name = "ubuntutemplate01"
      vb.gui = false
      vb.memory = "2048"
      vb.cpus = 1
    end

    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT

    template.vm.provision "shell", inline: $provisioning_script
  end

  #config.vm.define "controller-01" do |controler1|
  #  controler1.customize ["modifyvm", :id, "--groups", "/K8S The Hard Way LAB"]
  #end
end
