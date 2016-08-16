#!/usr/bin/env bash

cd /vagrant

# Install composer
./composer.sh

# Install Laravel
./laravel.sh

# Generate new Laravel project called "blog"
./blog.sh
