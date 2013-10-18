set :bundle_without, [:development, :test, :stage]
set :rails_env, 'production'
set :branch, :master
server 'trailer-02.springcarnival.org', :app, :web, :db, :primary => true

set :bundle_dir, ''
set :bundle_flags, '--system --quiet'
set :rvm_type, :system