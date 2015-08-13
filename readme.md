# Portfolio plugin for [Refinery CMS](http://www.refinerycms.com) ([GitHub](http://github.com/refinery/refinerycms))

## WARNING!

This latest version (master) is not stable and the schema may actively change. Use at your own risk.
If you are looking for a Refinery 2.0-compatible branch, use the '2-0-stable' branch.

## Requirements

This engine requires Refinery CMS version >= 3.0.0.dev.

## Gem Installation

Ensure you have created your application's database before adding this engine (with `rake db:setup`).

Open your `Gemfile` and add this line to the bottom:

```ruby
gem 'refinerycms-portfolio', github: 'refinery/refinerycms-portfolio', branch: 'master'
```

Now run `bundle install` and once bundler has installed the gem run:

    rails generate refinery:portfolio
    rake db:migrate db:seed

Now, restart your web server and enjoy.
