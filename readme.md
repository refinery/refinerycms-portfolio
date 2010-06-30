# Portfolio plugin for [RefineryCMS](http://www.refinerycms.com) ([Github](http://github.com/resolve/refinerycms))

By: [Resolve Digital](http://www.resolvedigital.com)

## Gem Installation

Open your ``Gemfile`` and add this line to the bottom:

    gem 'refinerycms-portfolio', '= 0.9.6', :require => 'portfolio'

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

The standard setup for portfolios is multi-level, with a parent portfolio having child portfolios.  If your needs are simpler, you can switch to a single level of portfolios by changing the Refinery Setting for 'Multi Level Portfolio' to false.