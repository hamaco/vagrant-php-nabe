action :run do
  converge_by("Set global php version #{new_resource.name}") do
    bash "php-nabe use #{new_resource.name}" do
      user new_resource.user
      environment "HOME" => "#{node["php-nabe"]["user_home_root"]}/#{new_resource.user}"

      code <<-EOH
        $HOME/app/php-nabe/php-nabe use #{new_resource.name}
      EOH
    end
  end
end
