#!/usr/bin/env bash

# load rvm ruby
source /usr/local/rvm/environments/ruby-1.9.3-p448

cd /vagrant/tbd4students

bundle install

# Run a simple set of code in Rails Context with output to /vagrant/run-tbd-script.log
rails runner 'puts Time.now; User.all.each { |u| puts u.blazerid }' >> ../run-tbd-script.log
