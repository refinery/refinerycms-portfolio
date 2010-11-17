# Portfolio plugin for [RefineryCMS](http://www.refinerycms.com) ([Github](http://github.com/resolve/refinerycms))

By: [Resolve Digital](http://www.resolvedigital.com)

## Requirements

This engine requires RefineryCMS version >= 0.9.8 - if you want support for versions before this,
look at [the rails2-stable branch](https://github.com/resolve/refinerycms-portfolio/tree/rails2-stable).

## Gem Installation

Ensure you have created your application's database before adding this engine (with ``rake db:setup``).

Open your ``Gemfile`` and add this line to the bottom:

    gem 'refinerycms-portfolio', '~> 0.9.9'

Now run ``bundle install`` and once bundler has installed the gem run:

    rails generate refinerycms_portfolio
    rake db:migrate

Now, restart your web server and enjoy.

## Single or Multiple Level Portfolios

The standard setup for portfolios is single-level.
If you need a multi-level portfolio where you have "categories" of portfolio
items you can switch to a multi level setup by changing the Refinery Setting for
``Multi Level Portfolio`` to true.