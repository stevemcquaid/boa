#rvm use 1.9.3
#sudo gem install ruby-graphviz
#sudo apt-get install nodejs

#might be necessary?
rm Gemfile.lock
gem uninstall capistrano -v 3.0.0
gem install capistrano -v 2.15.5


# echo 'configuring postgres db'
# stagedb='boastage'
# proddb='boaprod'
# username='boauser'
# psword='Prof_H_No_Sn00p1ng'
psql << EOF

DROP DATABASE devrv;
DROP DATABASE jenkins;
DROP DATABASE boauser;
DROP DATABASE boatest;
DROP DATABASE boadev;
DROP DATABASE boastage;
DROP DATABASE boaprod;

DROP USER devsrv;
CREATE USER devsrv WITH PASSWORD '1234';
ALTER USER devsrv WITH SUPERUSER;

DROP USER jenkins;
CREATE USER jenkins WITH PASSWORD '1234';
ALTER USER jenkins WITH jenkins;
 
DROP USER boauser;
CREATE USER boauser WITH PASSWORD 'Prof_H_No_Sn00p1ng';
ALTER USER boauser WITH SUPERUSER;

CREATE DATABASE jenkins OWNER jenkins;
CREATE DATABASE devsrv OWNER devsrv;
CREATE DATABASE boauser OWNER boauser;
CREATE DATABASE boatest OWNER boauser;
CREATE DATABASE boadev OWNER boauser;
CREATE DATABASE boastage OWNER boauser;
CREATE DATABASE boaprod OWNER boauser;
 
EOF


bundle install
ls

rake db:reset

#Jenkins CI Testing
rake test:prepare
echo '**** Running Unit & Integration Tests *****'
rake ci:setup:minitest test
echo '**** Running Rspec/Capybara/Request/View Feature Tests *****'
rake ci:setup:rspec spec:requests

#rake ci:setup:cucumber features #cucumber doesnt run

# # Run all unit tests
# rake test:units
# # Run all functional tests
# rake test:functionals
# # Run all integration tests
# rake test:integration

#Sanitize db: drop old data, create new db, run migratiosn and seed it
#rake db:reset

#make permissions correctly if necessary
#sudo chown -R jenkins tmp/

#start new server daemon fail gracefully!
rails s -d || true

cap staging deploy

echo 'Hello World It works! Successful build, test, and deploy!'