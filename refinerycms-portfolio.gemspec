Gem::Specification.new do |s|
  s.name              = %q{refinerycms-portfolio}
  s.version           = %q{0.9.6}
  s.description       = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with RefineryCMS}
  s.date              = %q{2010-06-15}
  s.summary           = %q{Ruby on Rails portfolio plugin for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\ Digital Philip\ Arndt)
  s.require_paths     = %w(lib)
  s.executables       = %w(refinerycms-portfolio-install)

  s.files             = [
    'readme.md',
    'license.md',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/portfolio_entries_controller.rb',
    'app/controllers/portfolio_controller.rb',
    'app/helpers',
    'app/helpers/portfolio_helper.rb',
    'app/models',
    'app/models/portfolio_entry.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/portfolio_entries',
    'app/views/admin/portfolio_entries/_form.html.erb',
    'app/views/admin/portfolio_entries/_list.html.erb',
    'app/views/admin/portfolio_entries/_sortable_list.html.erb',
    'app/views/admin/portfolio_entries/edit.html.erb',
    'app/views/admin/portfolio_entries/index.html.erb',
    'app/views/admin/portfolio_entries/new.html.erb',
    'app/views/portfolio',
    'app/views/portfolio/_main_image.html.erb',
    'app/views/portfolio/empty.html.erb',
    'app/views/portfolio/show.html.erb',
    'bin/refinerycms-portfolio-install',
    'config/locale',
    'config/locale/en.yml',
    'config/routes.rb',
    'db/migrate',
    'db/migrate/20090917224823_create_portfolio_structure.rb',
    'db/migrate/20091121033434_add_position_to_images_portfolio_entries.rb',
    'lib/gemspec.rb',
    'lib/portfolio.rb',
    'lib/tasks',
    'lib/tasks/portfolio.rake',
    'public/javascripts',
    'public/javascripts/portfolio.js',
    'public/stylesheets',
    'public/stylesheets/portfolio.css',
    'rails/init.rb'
  ]
  
end
