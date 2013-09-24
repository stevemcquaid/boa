#this may error if any configs are changed
bundle install
ls

#this task will drop old data, create new db, run migratiosn and seed it
rake db:populate 

# #Testing
# rake db:test:load



#Run All Tests
#rake test

#Jenkins CI Requirements
rake ci:setup:minitest test
#rake ci:setup:rspec spec
rake ci:setup:cucumber features

# # Run all unit tests
# rake test:units
# # Run all functional tests
# rake test:functionals
# # Run all integration tests
# rake test:integration

cap development deploy

echo 'Hello World It works! Successful build, test, and deploy!'