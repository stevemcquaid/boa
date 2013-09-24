source 'http://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'sqlite3'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'factory_girl_rails' #fixture testing
gem 'capistrano' #auto deployment
gem 'jquery-rails'
gem 'bootstrap-sass'
# gem "twitter-bootstrap-rails"
gem 'cancan' #user auth
gem 'devise' #user auth
gem 'figaro'
gem 'mocha'
gem 'rolify'
gem 'simple_form'
gem 'carrierwave' #attachments
gem 'rest-client'
gem 'net-ldap'
gem "ruby-activeldap-debug", "~> 0.7.4"
gem 'activeldap', :require => 'active_ldap/railtie'
# gem 'ruby-ldap'
gem 'minitest', "~> 4.0"

group :test do
  gem 'capybara'
  gem 'ci_reporter', :git => 'git://github.com/nicksieger/ci_reporter.git'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'launchy'
  
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false #code coverage
  gem 'simplecov-rcov', :require => false #code coverage
  # gem 'test-unit', '~> 2.0.0'
  gem 'turn', :require => false # Pretty printed test output
end

group :development do
  gem 'passenger'
  gem 'populator3'
  gem 'hirb'

  gem 'rspec-rails'

  # gem 'better_errors'

  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'ci_reporter', :git => 'git://github.com/nicksieger/ci_reporter.git'

  # Steve said this gem is DIRTY.
  # gem 'test-unit', '~> 2.0.0'

  # Pretty printed test output
  gem 'turn', :require => false
  #code coverage & Jenkins CI stuff
  
  gem 'simplecov', :require => false #code coverage
  gem 'simplecov-rcov', :require => false #code coverage
end

group :production do
  gem 'passenger'
  gem 'rspec-rails'
  gem 'ci_reporter', :git => 'git://github.com/nicksieger/ci_reporter.git'

  # Steve said this gem is DIRTY.
  # gem 'test-unit', '~> 2.0.0'

  # Pretty printed test output
  gem 'turn', :require => false
end
