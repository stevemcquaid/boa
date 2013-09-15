source 'https://rubygems.org'
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
#gem "twitter-bootstrap-rails"
gem 'cancan' #user auth
gem 'devise' #user auth
gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem 'carrierwave' #attachments
gem 'simplecov' #code coverage
gem 'simplecov-rcov' #code coverage
gem 'rest-client'
gem 'net-ldap'
gem 'activeldap', :require => 'active_ldap/railtie'


group :development do
  gem 'passenger'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'ci_reporter', '1.6.3'
  gem 'test-unit', '~> 2.0.0'
  # Pretty printed test output
  gem 'turn', :require => false
end

group :production, :test do
  gem 'passenger'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'ci_reporter', '1.6.3'
  gem 'test-unit', '~> 2.0.0'
  # Pretty printed test output
  gem 'turn', :require => false
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
end
