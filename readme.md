# Portfolio plugin for [RefineryCMS](http://www.refinerycms.com) ([Github](http://github.com/resolve/refinerycms))

By: [Resolve Digital](http://www.resolvedigital.com)

## Gem Installation

Open your ``Gemfile`` and add this line to the bottom:

    gem 'refinerycms-portfolio', '= 0.9.7', :require => 'portfolio'

Now run ``bundle install`` and once bundler has installed the gem run:

    rake refinery:portfolio:install

..and follow the instructions!

## Plugin Installation

From within your Refinery directory at command line, install this as a plugin using:

    script/plugin install git://github.com/resolve/refinerycms-portfolio.git

Then run:

    rake refinery:portfolio:install

..and follow the instructions!

## Single or Multiple Level Portfolios

The standard setup for portfolios is single-level. If you need a multi-level portfolio where you have "categories" of portfolio items you can switch to a multi level setup by changing the Refinery Setting for 'Multi Level Portfolio' to true.