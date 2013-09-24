#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

#Jenkins CI Integration stuff
require_relative 'ci/reporter/rake/rspec'     # use this if you're using RSpec
require_relative 'ci/reporter/rake/cucumber'  # use this if you're using Cucumber
require_relative 'ci/reporter/rake/minitest'  # use this if you're using Cucumber

require File.expand_path('../config/application', __FILE__)

Boa::Application.load_tasks