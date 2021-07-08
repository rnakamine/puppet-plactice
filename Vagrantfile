# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box      = "centos/7"
  config.vm.hostname = "puppet-book.local"

  config.vm.synced_folder "./", "/vagrant", type: "virtualbox"
end
