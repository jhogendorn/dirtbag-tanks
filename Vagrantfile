# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  required_plugins = %w( vagrant-hostmanager vagrant-pristine vagrant-triggers )
  required_plugins.each do |plugin|
    system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
  end

  if Vagrant.has_plugin?("vagrant-hostmanager") then
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
  end

  config.ssh.forward_agent = true

  config.vm.define "tanks.dev" do |web|
    web.vm.box = "chef/centos-6.5"
    web.vm.network :private_network, ip: "192.168.30.2"
    web.vm.hostname = "tanks.dev"
    #web.hostmanager.aliases = %w(example-box.localdomain example-box-alias)

    web.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--memory", "1024"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
      v.name = "api_zippy"
    end

    web.vm.provider :vmware_fusion do |v|
      v.vmx["memsize"] = "1024"
      v.vmx["numvcpus"] = "1"
    end

    if Vagrant.has_plugin?("vagrant-triggers") and
      not Vagrant::Util::Platform.windows?

      web.trigger.after :up do
        run "bin/vagrant-exportsshconfig"
      end
      web.trigger.after :reload do
        run "bin/vagrant-exportsshconfig"
      end
      web.trigger.after :pristine do
        run "bin/vagrant-exportsshconfig"
      end

    end

  end

  if not Vagrant::Util::Platform.windows?
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "deploy/vagrant.yml"
      ansible.inventory_path = "deploy/hosts"
      #ansible.start_at_task = ""
      ansible.verbose = 'vvvv'
    end
  end

end
