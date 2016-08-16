#!/usr/bin/env bash

apt-get install -y supervisor

cp laravel-worker.conf /etc/supervisor/conf.d

# Schedule worker with supervisor
supervisorctl reread
supervisorctl update
supervisorctl start laravel-worker:*
