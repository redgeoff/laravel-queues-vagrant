#!/usr/bin/env bash

# Update apt-get
apt-get update -y

# Update Ubuntu
apt-get -y upgrade
apt-get -y dist-upgrade

# Install PHP5
apt-get install -y php5

# Install MySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password secret'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password secret'
sudo apt-get -y install mysql-server

# Install php-mysql module
apt-get install -y php5-mysql

# Run as vagrant user
su - vagrant
/vagrant/config/vagrant.sh

# Switch back to root
exit

# Install and configure Supervisor
./supervisor.sh
apt-get install -y supervisor
cp /vagrant/supervisor/laravel-worker.conf /etc/supervisor/conf.d
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-worker:*
