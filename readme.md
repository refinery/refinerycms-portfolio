# Portfolio plugin for [Refinery CMS](http://www.refinerycms.com) ([Github](http://github.com/resolve/refinerycms))

By: [Resolve Digital](http://www.resolvedigital.com)

## WARNING!

This latest version (master) is not stable. The schema is actively changing. Use at your own risk. If you are looking for a Refinery 2.0-compatible branch, use the '2-0-stable' branch.

## Requirements

This engine requires Refinery CMS version >= 2.0.0.

## Gem Installation

Ensure you have created your application's database before adding this engine (with ``rake db:setup``).

Open your ``Gemfile`` and add this line to the bottom:

    gem 'refinerycms-portfolio', :git => 'git://github.com/resolve/refinerycms-portfolio.git', :branch => '2-0-stable'

Now run ``bundle install`` and once bundler has installed the gem run:

    rails generate refinery:portfolio
    rake db:migrate
    rake db:seed

Now, restart your web server and enjoy.
