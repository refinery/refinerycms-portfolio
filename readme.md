# Portfolio
For [RefineryCMS](http://www.refinerycms.com) ([Github](http://github.com/resolve/refinerycms)) By: [Resolve Digital](http://www.resolvedigital.com)

![Refinery Portfolio](https://s3.amazonaws.com/krisf-permanent/portfolio2-demo.png)

## Installation on Refinery 2.0.0 or above.

Open your ``Gemfile`` and add this line to the bottom:

    gem 'refinerycms-portfolio', '~> 2.0.0'

Now run ``bundle install``.

To install the migrations, run:

    rails generate refinery:portfolio
    rake db:migrate
    
Add the Portfolio page to the database:

    rake db:seed
    
Restart your web server and enjoy.