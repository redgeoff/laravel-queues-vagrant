#!/usr/bin/env bash

cd /vagrant/app

# Create MySQL DB
mysql -uroot -psecret -e "CREATE DATABASE mydb"

# Generate new Laravel project called "blog"
if [ ! -d "blog" ]; then

  # It appears we need to run laravel via composer when running under `su - vagrant`
  #laravel new blog
  composer create-project laravel/laravel blog

  cd blog

  # Set MySQL config
  sed -i "s'DB_DATABASE=homestead'DB_DATABASE=mydb'" .env
  sed -i "s'DB_USERNAME=homestead'DB_USERNAME=root'" .env
  sed -i "s'QUEUE_DRIVER=sync'QUEUE_DRIVER=database'" .env

  # Create DB migration script
  php artisan queue:table

  # Copy our job to the Laravel project
  cp ../../php/SendEmail.php app/Jobs

  # Copy our model to the Laravel project
  cp ../../php/Person.php app

fi

cd /vagrant/app/blog

# Migrate DB
php artisan migrate
