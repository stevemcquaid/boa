source 'http://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'sqlite3'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
end
gem 'jquery-rails'

# ldap
#Flip the two gems below this when trying to generate...
#gem "twitter-bootstrap-rails"
gem "activeldap", :require => 'active_ldap/railtie'
gem 'net-ldap'

# erd
gem "rails-erd"

# document attachments
gem "carrierwave"

# Shibboleth
gem "omniauth"
gem "omniauth-shibboleth"

# Rest - For Card Lookup
gem 'rest-client'

gem 'cancan'
gem 'devise'

gem 'figaro'
gem 'rolify'
gem 'simple_form'
gem 'therubyracer', :platform=>:ruby
gem 'will_paginate'

gem 'webrick', "~> 1.3.1"

group :development do
  gem 'hirb' # pretty formatting for rails console
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'spring'
  gem "capistrano", "2.15.5"
  # gem "ruby-activeldap-debug", "~> 0.7.4"
end

group :development, :test do
  gem 'factory_girl_rails'
end

group :staging do
  gem 'pg'# , :require => true
  gem 'sqlite3' #should not need this
  
  gem 'hirb' # pretty formatting for rails console
  gem 'populator3'
  
  gem 'passenger'
  
  gem 'quiet_assets'

  gem 'ci_reporter'
end  

group :test do
  # Temporary while there aren't any tests (speeds bundle substantially)
  #gem 'capybara'
  #gem 'cucumber-rails', :require=>false
  # gem 'minitest', "~> 4.0"
  gem 'minitest-spec-rails'
  gem 'minitest-wscolor'

  gem 'shoulda'
  gem 'shoulda-matchers'

  # For mocking the call to cardlookup
  gem 'webmock'

  # Pretty test Output
  gem 'turn', :require => false

  # for Travis and CI
  gem 'simplecov', :require => false #code coverage
  gem 'simplecov-rcov', :require => false #code coverage
  gem 'coveralls', require: false
  gem 'rake'

  gem 'ci_reporter'

end

group :production do
  gem 'pg'
  gem 'sqlite3' #should not need this
  gem 'passenger'
end
