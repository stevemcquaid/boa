set :bundle_without, [:test, :production]
set :rails_env, 'development'
set :branch, :stage
server 'trailer-d02.springcarnival.org', :app, :web, :db, :primary => true
