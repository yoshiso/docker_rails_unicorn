#!/bin/bash

source /etc/profile.d/nvm.sh;
cd /var/www/app;
/usr/local/rbenv/shims/bundle exec unicorn_rails -c /var/www/app/config/unicorn.rb -E production

