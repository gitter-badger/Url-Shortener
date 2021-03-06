# su as postgres and startup the postgres server
su - postgres -c '/usr/lib/postgresql/9.4/bin/postgres -D /var/lib/postgresql/9.4/main -c config_file=/etc/postgresql/9.4/main/postgresql.conf &' && 

# Sleep for 1 minute until all services are ready
sleep 60 && 

# cd into the django application
cd /application/Tornado-Application && 

# Run tests, and send results to coveralls.io
# COVERALLS_REPO_TOKEN=$COVERALLS_REPO_TOKEN TRAVIS_BRANCH=$TRAVIS_BRANCH BRANCH=$TRAVIS_BRANCH coveralls
coverage run --rcfile=../.coveragerc -m tornado.test.runtests unit_tests.run_all_tests &&
COVERALLS_REPO_TOKEN=$1 TRAVIS_BRANCH=$2 BRANCH=$3 coveralls
