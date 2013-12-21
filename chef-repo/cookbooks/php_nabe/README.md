chef-php_nabe
=============

Chef cookbooks for php-nabe

Requirements
------------

### Platforms

- Debian, Ubuntu, CentOS


Usage
-----

```
php_nabe_install "5.4.14" do
  user "hamaco"
  action :install
end

php_nabe_extension "mbstring" do
  user "hamaco"
  version "5.4.14"
  action :install
end

php_nabe_use "5.4.14" do
  user "hamaco"
  action :run
end
```
