# -*- mode: ruby -*-
# vi: set ft=ruby :

class K8sProvisioner
  def self.setup(virtual_machine, vm_name, hostname, group, cpus, memory, host_only_ip, provisioning_script, playbook)
    virtual_machine.vm.hostname = hostname
    virtual_machine.vm.box = "ubuntu/focal64"
    virtual_machine.vm.network "private_network", ip: host_only_ip, adapter: 2

    virtual_machine.vm.synced_folder ".", "/vagrant"

    virtual_machine.vm.provider "virtualbox" do |vb|
      vb.check_guest_additions = false
      vb.name = vm_name
      vb.gui = false
      vb.memory = memory
      vb.cpus = cpus
      vb.customize ["modifyvm", :id, "--groups", group]
    end

    # virtual_machine.vm.provision "shell", inline: provisioning_script
    virtual_machine.vm.provision "ansible_local" do |ansible|
      ansible.playbook = playbook
    end
  end
end

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

  config.vm.provider "virtualbox" do |vb|
    # create a master VM before creating the linked clones
    vb.linked_clone = true
  end
  
  config.vm.define "controller01" do |controller01|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup controller01, "controller01", "controller01", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.201", $provisioning_script, "ansible/controller1.yaml"
  end

  config.vm.define "controller02" do |controller02|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup controller02, "controller02", "controller02", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.202", $provisioning_script, "ansible/controller2.yaml"
  end

  config.vm.define "controller03" do |controller03|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup controller03, "controller03", "controller03", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.203", $provisioning_script, "ansible/controller3.yaml"
  end

  config.vm.define "worker01" do |worker01|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup worker01, "worker01", "worker01", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.211", $provisioning_script, "ansible/worker1.yaml"
  end

  config.vm.define "worker02" do |worker02|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup worker02, "worker02", "worker02", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.212", $provisioning_script, "ansible/worker2.yaml"
  end

  config.vm.define "worker03" do |worker03|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup worker03, "worker03", "worker03", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.213", $provisioning_script, "ansible/worker3.yaml"
  end

  config.vm.define "lb01" do |lb01|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup lb01, "lb01", "lb01", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.225", $provisioning_script, "ansible/lb1.yaml"
  end

  config.vm.define "lb02" do |lb02|
    $provisioning_script = <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y upgrade
    sleep 2
    SCRIPT
    
    K8sProvisioner.setup lb02, "lb02", "lb02", "/K8S The Hard Way LAB", 1, 2048, "192.168.78.226", $provisioning_script, "ansible/lb2.yaml"
  end
end
