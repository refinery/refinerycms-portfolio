source "http://rubygems.org"

gemspec

gem 'refinerycms', git: 'https://github.com/refinery/refinerycms', branch: 'master'
gem 'refinerycms-acts-as-indexed', git: 'https://github.com/refinery/refinerycms-acts-as-indexed', branch: 'master'
gem 'refinerycms-i18n', git: 'https://github.com/refinery/refinerycms-i18n', branch: 'master'

group :development, :test do
  gem 'refinerycms-testing', git: 'https://github.com/refinery/refinerycms', branch: 'master'
end


# Refinery/Rails should pull in the proper versions of these
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

group :development, :test do
  gem 'pry'
  gem 'launchy'
  gem 'generator_spec', '~> 0.9.0'

  require 'rbconfig'

  platforms :jruby do
    gem 'activerecord-jdbcsqlite3-adapter'
    gem 'activerecord-jdbcmysql-adapter'
    gem 'activerecord-jdbcpostgresql-adapter'
    gem 'jruby-openssl'
  end

  unless defined?(JRUBY_VERSION)
    gem 'sqlite3'
    gem 'mysql2'
    gem 'pg'
  end
end

group :test do
  gem 'rspec-activemodel-mocks'
end
