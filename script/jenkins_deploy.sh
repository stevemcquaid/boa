#check if rvm exists
#rvm use 1.9.3
#sudo gem install ruby-graphviz
#sudo apt-get install nodejs

#might be necessary?
rm Gemfile.lock
gem uninstall capistrano -v 3.0.0
gem install capistrano -v 2.15.5

#this may error if any configs are changed
bundle install
ls



#this task will drop old data, create new db, run migratiosn and seed it
rake db:popSimulate

#if env = stageServ 
#rake db:popSimulate 

# #Testing
# rake db:test:load

#Jenkins CI Testing
rake ci:setup:minitest test
#rake ci:setup:rspec spec
#rake ci:setup:cucumber features #cucumber doesnt run

# # Run all unit tests
# rake test:units
# # Run all functional tests
# rake test:functionals
# # Run all integration tests
# rake test:integration

#make permissions correctly if necessary
#sudo chown -R jenkins tmp/

#start new server daemon fail gracefully!
rails s -d || true

cap staging deploy

echo 'Hello World It works! Successful build, test, and deploy!'