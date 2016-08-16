#!/usr/bin/env bash

cd /vagrant

# Install Laravel
composer global require "laravel/installer"

# Add Laravel to PATH
echo 'PATH="$PATH:~/.composer/vendor/bin"' >> /home/vagrant/.profile
