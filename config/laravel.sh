#!/usr/bin/env bash

cd /vagrant

# Install Laravel
composer global require "laravel/installer"

# Add Laravel to PATH
echo 'PATH="$PATH:~/.config/composer/vendor/bin"' >> /home/vagrant/.profile

# Load new PATH now
source /home/vagrant/.profile
