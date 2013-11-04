# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :hosts
  
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # setup master node
  config.vm.define :master, {:primary => true} do |master|
    # configure network
    master.vm.hostname = 'master.local'
    master.vm.network :private_network, ip: '33.33.33.10'
		
    config.vm.provider 'virtualbox' do |v|
      v.name = 'Chef Vagrant Jenkins - Master'
      v.customize ['modifyvm', :id, '--memory', 512]
  #   # Don't boot with headless mode
  #   vb.gui = true
    end

    config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = "my-recipes/cookbooks"
     chef.roles_path = "my-recipes/roles"
     chef.data_bags_path = "my-recipes/data_bags"
     
	 # logging
	 chef.log_level = :debug
     
	 
	 chef.add_role "master"
	
     # You may also specify custom JSON attributes:
     #chef.json = { :mysql_password => "foo" }
	end
  	
  end
  
   # setup selenium node
  config.vm.define :selenium do |selenium|
    # configure network
    selenium.vm.hostname = 'selenium.local'
    selenium.vm.network :private_network, ip: '33.33.33.13'
		 
    config.vm.provider 'virtualbox' do |v|
      v.name = 'Chef Vagrant Jenkins - Selenium'
      v.customize ['modifyvm', :id, '--memory', 512]
    end
	
	config.vm.provision :chef_solo do |chef|
		# logging
		chef.log_level = :debug
	 
		chef.cookbooks_path = "my-recipes/cookbooks"
		chef.roles_path = "my-recipes/roles"
		chef.data_bags_path = "my-recipes/data_bags"
				
		chef.add_role "selenium"
	end
	
  end
  
end
