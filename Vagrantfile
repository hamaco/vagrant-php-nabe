# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip: "192.168.50.11"

  config.vm.synced_folder "./webroot", "/webroot", :create => true, :owner=> 'vagrant', :group=>'vagrant', :mount_options => ['dmode=775,fmode=775']

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef-repo/cookbooks", "chef-repo/site-cookbooks"]

    chef.run_list = [
      "apt",
      "php_nabe",
      "my_php_nabe",
    ]

    chef.json = {
      "php_global_version" => "5.5.7",
      "php" => [
        {
          "version"   => "5.3.28",
          "http_port" => "8053",
          "fpm_port"  => "9053",
        },
        {
          "version"   => "5.4.23",
          "http_port" => "8054",
          "fpm_port"  => "9054",
        },
        {
          "version"   => "5.5.7",
          "http_port" => "8055",
          "fpm_port"  => "9055",
        },
      ]
    }
  end
end
