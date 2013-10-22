# -*- mode: ruby -*-
# vi: set ft=ruby :

dir = Dir.pwd
vagrant_dir = File.expand_path(File.dirname(__FILE__))

Vagrant::Config.run do |config|


  # Webdev Environment for PHP 5.4
  # git
  # nginx
  # php-fpm php 5.4, phpunit, composer
  # mysql, import sql, automysqlbackup
  #
  config.vm.define :webdev54 do |config_webdev54|
    config_webdev54.vm.box = "precise64"
    config_webdev54.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config_webdev54.vm.host_name = "dawen-webdev54"

    config_webdev54.vm.customize [
                        "modifyvm", :id,
                        "--name", "Test_Environment",
                        "--memory", "1024"
                      ]

    #change the comments of these line for you preferred network type
    config_webdev54.vm.network :hostonly, "192.168.50.54"
    #config_webdev55.vm.network :private_network, "192.168.50.54"
    #config_webdev54.vm.network :bridged, "192.168.50.54"

    config_webdev54.vm.forward_port 80, 8054

    config_webdev54.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path = "chef/roles"
      chef.add_role "webdev-php54"
    end
  end                  
  
  # Webdev Environment for PHP 5.5
  # git
  # nginx
  # php-fpm php 5.5, phpunit, composer
  # mysql, import sql, automysqlbackup
  #
  config.vm.define :webdev55 do |config_webdev55|
    config_webdev55.vm.box = "precise64"
    config_webdev55.vm.box_url = "http://files.vagrantup.com/precise64.box"

    config_webdev55.vm.host_name = "dawen-webdev55"

    config_webdev55.vm.customize [
                        "modifyvm", :id,
                        "--name", "Test_Environment",
                        "--memory", "1024"
                      ]

    #change the comments of these line for you preferred network type
    config_webdev55.vm.network :hostonly, "192.168.50.55"
    #config_webdev55.vm.network :private_network, "192.168.50.55"
    #config_webdev55.vm.network :bridged, "192.168.50.55"
    
    config_webdev55.vm.forward_port 80, 8055

    config_webdev55.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path = "chef/roles"
      chef.add_role "webdev-php55"
    end
  end


end
