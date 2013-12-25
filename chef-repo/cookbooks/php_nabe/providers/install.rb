action :install do
  converge_by("Install php version #{new_resource.name} using php-nabe") do
    # TODO: php-nabe 自体のインストールがインストールするバージョンの数だけ呼ばれてしまう
    directory "#{node["php-nabe"]["user_home_root"]}/#{new_resource.user}/app" do
      user new_resource.user
      mode 0755
    end

    git "php-nabe" do
      user        new_resource.user
      repository  "git://github.com/kawahara/php-nabe.git"
      reference   "master"
      destination "#{node["php-nabe"]["user_home_root"]}/#{new_resource.user}/app/php-nabe"
      action      :sync
    end

    bash "php-nabe setup" do
      user new_resource.user
      environment "HOME" => "#{node["php-nabe"]["user_home_root"]}/#{new_resource.user}"

      code <<-EOH
        $HOME/app/php-nabe/php-nabe setup
      EOH

      not_if "ls #{node["php-nabe"]["user_home_root"]}/#{new_resource.user}/app/php-nabe/bin"
    end

    bash "php-nabe install #{new_resource.name}" do
      user new_resource.user
      environment "HOME" => "#{node["php-nabe"]["user_home_root"]}/#{new_resource.user}"

      code <<-EOH
        $HOME/app/php-nabe/bin/php-nabe install #{new_resource.name} #{node["php-nabe"]["configure_options"]}
      EOH

      not_if "ls #{node["php-nabe"]["user_home_root"]}/#{new_resource.user}/app/php-nabe/build/php-#{new_resource.name}"
    end
  end
end
