# Refinery CMS Portfolio

[![Build Status](https://travis-ci.org/refinery/refinerycms-portfolio.svg?branch=master)](https://travis-ci.org/refinery/refinerycms-portfolio)

Simple portfolio engine for [Refinery CMS](http://refinerycms.com).

This version of `refinerycms-portfolio` supports Refinery 3.x and Rails 4.2.x. To use Rails 3.x / Refinery 2.0.x use the [refinerycms-portfolio "Refinery CMS 2-0 stable branch"](http://github.com/refinery/refinerycms-portfolio/tree/2-0-stable).

## Requirements

Refinery CMS version 3.0.0 or above.

## Install

Open up your ``Gemfile`` and add at the bottom this line:

```ruby
gem 'refinerycms-portfolio', github: 'refinery/refinerycms-portfolio', branch: 'master'
```

Now run `bundle install` and once bundler has installed the gem run:

Next, to install the portfolio plugin run:

    $ rails generate refinery:portfolio

Run database migrations:

    $ bundle exec rake  db:migrate

Finally seed your database and you're done.

    $ bundle exec rake  db:seed

## Developing & Contributing

The version of Refinery to develop this engine against is defined in the gemspec. To override the version of refinery to develop against, edit the project Gemfile to point to a local path containing a clone of refinerycms.

### Testing

Generate the dummy application to test against

    $ bundle exec rake refinery:testing:dummy_app

Run the test suite with [Guard](https://github.com/guard/guard)

    $ bundle exec guard start

Or just with rake spec

    $ bundle exec rake spec

## More Information
* Check out our [Website](http://refinerycms.com/)
* Documentation is available in the [guides](http://refinerycms.com/guides)
* Questions can be asked on our [Google Group](http://group.refinerycms.org)
* Questions can also be asked in our IRC room, [#refinerycms on freenode](irc://irc.freenode.net/refinerycms)
