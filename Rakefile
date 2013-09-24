#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

#Jenkins CI Integration stuff
require 'ci/reporter/rake/rspec'  # use this if you're using Test::Unit
require 'ci/reporter/rake/cucumber'  # use this if you're using Cucumber
require 'ci/reporter/rake/minitest' # use this if you're using Test::Unit

require File.expand_path('../config/application', __FILE__)

Boa::Application.load_tasks
