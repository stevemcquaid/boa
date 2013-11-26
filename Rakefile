#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

#Jenkins CI Integration stuff
#require 'ci/reporter/rake/cucumber'  # use this if you're using Cucumber
require 'ci/reporter/rake/minitest'

require File.expand_path('../config/application', __FILE__)

Boa::Application.load_tasks
