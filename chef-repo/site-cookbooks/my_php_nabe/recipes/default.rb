package "nginx" do
  action :install
end
service "nginx" do
  action [:enable, :start]
end

package "supervisor" do
  action :install
end
service "supervisor" do
  action [:enable, :start]
end

node["php"].each do |php|
  php_nabe_install "#{php['version']}" do
    user "vagrant"
    action :install
  end

  template "/home/vagrant/app/php-nabe/build/php-#{php['version']}/etc/php-fpm.conf" do
    source "php_php-fpm.conf.erb"
    user   "vagrant"
    group  "vagrant"
    mode   "0644"
    variables(
      :php => php
    )
  end

  template "/etc/nginx/sites-enabled/php-fpm#{php['version']}.conf" do
    source "nginx_php-fpm.conf.erb"
    user   "root"
    group  "root"
    mode   "0644"
    variables(
      :php => php
    )
    notifies :restart, "service[nginx]"
  end

  template "/etc/supervisor/conf.d/php-fpm#{php['version']}.conf" do
    source "supervisor_php-fpm.conf.erb"
    user   "root"
    group  "root"
    mode   "0644"
    variables(
      :version => php['version']
    )
    notifies :restart, "service[supervisor]"
  end
end

php_nabe_use "#{node['php_global_version']}" do
  user "vagrant"
  action :run
end
