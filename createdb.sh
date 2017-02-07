#!/bin/bash
set -e

bin/rake db:migrate
bin/rake users:create_admin
bundle exec puma -C config/puma.rb