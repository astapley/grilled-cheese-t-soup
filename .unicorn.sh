#!/bin/bash
# This file is meant to be executed via systemd.
source /usr/local/rvm/scripts/rvm
source /etc/profile.d/rvm.sh
export ruby_ver=$(rvm list default string)

export CONFIGURED=yes
export TIMEOUT=50
export APP_ROOT=/home/rails/rails_project
export RAILS_ENV="production"
export GEM_HOME="/home/rails/rails_project/vendor/bundle"
export GEM_PATH="/home/rails/rails_project/vendor/bundle:/usr/local/rvm/gems/${ruby_ver}:/usr/local/rvm/gems/${ruby_ver}@global"
export PATH="/home/rails/rails_project/vendor/bundle/bin:/usr/local/rvm/gems/${ruby_ver}/bin:${PATH}"

# Passwords
export SECRET_KEY_BASE=19c6d709e88f584b537ef59187c3c79e7ae64b0453e7dbe1639724eb55eda1f3980df2f8c83996ca373fa9e3c2115972fe93f4c42a31143cb0e69942c05fb1a1
export APP_DATABASE_PASSWORD=4d039c8f74fea29bf6a8a6c740ebf75d

# Execute the unicorn process
/home/rails/rails_project/vendor/bundle/bin/unicorn \
        -c /etc/unicorn.conf -E production --debug
