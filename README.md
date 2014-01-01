# vagrant-php-nabe

Vagrant + Chef を使用して Ubuntu12.04 上に php-nabe の環境を構築します。  
PHP 5.3.28 / PHP 5.4.23 / PHP 5.5.7 が nginx + php-fpm で動きます。

## Requirements

- Git
- Vagrant
- VirtualBox

## Installation

Github からクローンして``vagrant up``で起動して下さい。

```bash
$ git clone https://github.com/hamaco/vagrant-php-nabe.git
$ cd vagrant-php-nabe
$ vagrant up
```

以下のURLでそれぞれのバージョンのPHPが動いてます。

| Version | URL                        |
| ------- | -------------------------- |
| 5.3.28  | http://192.168.50.11:8053/ |
| 5.4.23  | http://192.168.50.11:8054/ |
| 5.5.7   | http://192.168.50.11:8055/ |
