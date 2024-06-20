#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
./bin/webpack-dev-server
bundle exec rails db:migrate
bundle exec rails db:seed