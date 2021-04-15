#!/bin/bash
rm -f /myapp/tmp/pids/server.pid

bundle install

yarn install

rails db:migrate

bundle exec rails s -p 3000 -b '0.0.0.0'
