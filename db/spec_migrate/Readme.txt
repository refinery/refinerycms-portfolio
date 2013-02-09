The non-portfolio migrations in this directory must be executed on the test database prior to running rspec request specs, because they appear to be dependencies for some other refinery utility functions. 
Note that it appears that they must also be executed on the development database if a manual point-and-click run-through of the site via the dummy_app is desired. 

In order to run rspec tests I found it necessary to: 

1. Ensure all gems and dependencies were installed
      I actually had to explicitly add a js runtime to the development and test groups of the gemfile before step 2 (below) worked.  I used therubyracer.

2. Generate the dummy test app via: 
      bundle exec rake refinery:testing:dummy_app

3. Copy these migrations into the appropriate folder: 
      cp db/spec_migrate/9* db/migrate/

4. Create and migrate the test database:
      bundle exec rake db:migrate RAILS_ENV=test

5. Now specs can finally be executed with: 
      bundle exec rake spec

Note that if a manual runthrough of the site is desired via "bundle exec rails server", than these migrations must also be run there via the usual: 
      bundle exec rake db:migrate
