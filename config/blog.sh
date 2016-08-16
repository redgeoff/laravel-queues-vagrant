#!/usr/bin/env bash

cd /vagrant/app

# Generate new Laravel project called "blog"
laravel new blog

cd blog

# Create MySQL DB
mysql -uroot -psecret -e "CREATE DATABASE mydb"

# Set MySQL config
sed -i "s'DB_DATABASE=homestead'DB_DATABASE=mydb'" .env
sed -i "s'DB_USERNAME=homestead'DB_USERNAME=root'" .env
sed -i "s'QUEUE_DRIVER=sync'QUEUE_DRIVER=database'" .env

# Create DB migration script
php artisan queue:table

# Migrate DB
php artisan migrate

# Copy our job to the Laravel project
cp ../../php/SendEmail.php app/Jobs
