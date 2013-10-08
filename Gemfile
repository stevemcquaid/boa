source 'http://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'sqlite3'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

gem 'bootstrap-sass'
gem 'capistrano' #auto deployment
gem 'factory_girl_rails' #fixture testing
gem 'jquery-rails'
# gem "twitter-bootstrap-rails"
gem 'cancan' #user auth
gem 'devise' #user auth
gem 'figaro'
gem 'mocha', :require => 'mocha/api'
gem 'rolify'
gem 'simple_form'
gem 'carrierwave' #attachments
gem 'rest-client'

gem 'net-ldap'
gem "ruby-activeldap-debug", "~> 0.7.4"
gem 'activeldap', :require => 'active_ldap/railtie'

# gem 'ruby-ldap'
gem 'minitest', "~> 4.0"

gem 'rails-erd'

group :test do
  gem 'capybara'
  gem 'ci_reporter'
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
  gem 'hirb' # pretty formatting for rails console
  gem 'passenger'
  gem 'populator3'

  gem 'rspec-rails'

  # gem 'better_errors'

  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'ci_reporter'
  gem 'quiet_assets'

  # Steve said this gem is DIRTY.
  # gem 'test-unit', '~> 2.0.0'

  # Pretty printed test output
  gem 'turn', :require => false

  #code coverage & Jenkins CI stuff
  gem 'simplecov', :require => false #code coverage
  gem 'simplecov-rcov', :require => false #code coverage
end

group :production do
  gem 'ci_reporter'
  gem 'passenger'
  gem 'rspec-rails'

  # Steve said this gem is DIRTY.
  # gem 'test-unit', '~> 2.0.0'

  # Pretty printed test output
  gem 'turn', :require => false
end
