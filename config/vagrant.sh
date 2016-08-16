#!/usr/bin/env bash

cd /vagrant/config

# Config default directory when vagrant ssh
echo 'cd /vagrant' >> /home/vagrant/.profile

# Install composer
./composer.sh

# Install Laravel
./laravel.sh

# Generate new Laravel project called "blog"
./blog.sh
