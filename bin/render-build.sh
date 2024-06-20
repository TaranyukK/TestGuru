#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails webpacker:install
./bin/webpack-dev-server
bundle exec rails db:migrate
bundle exec rails db:seed