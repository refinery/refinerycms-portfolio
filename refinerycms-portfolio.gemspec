Gem::Specification.new do |s|
  s.name              = %q{refinerycms-portfolio}
  s.version           = %q{0.9.8}
  s.description       = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with RefineryCMS}
  s.date              = %q{2010-08-23}
  s.summary           = %q{Ruby on Rails portfolio plugin for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ['Resolve Digital']
  s.require_paths     = %w(lib)

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
    'config/locales',
    'config/locales/en.yml',
    'config/locales/pt-BR.yml',
    'config/locales/sl.yml',
    'config/routes.rb',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/portfolio',
    'lib/generators/portfolio/portfolio_generator.rb',
    'lib/generators/portfolio/templates',
    'lib/generators/portfolio/templates/db',
    'lib/generators/portfolio/templates/db/migrate',
    'lib/generators/portfolio/templates/db/migrate/migration_number_create_structure_for_portfolio.rb',
    'lib/generators/portfolio/templates/db/seeds',
    'lib/generators/portfolio/templates/db/seeds/portfolio.rb',
    'lib/portfolio',
    'lib/portfolio/version.rb',
    'lib/portfolio.rb',
    'public/javascripts',
    'public/javascripts/portfolio.js',
    'public/stylesheets',
    'public/stylesheets/portfolio.css'
  ]
  
end
