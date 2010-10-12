Gem::Specification.new do |s|
  s.name              = %q{refinerycms-portfolio}
  s.version           = %q{0.9.8.rc5}
  s.description       = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with RefineryCMS}
  s.date              = %q{2010-10-12}
  s.summary           = %q{Ruby on Rails portfolio plugin for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ['Resolve Digital']
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms', '>= 0.9.8'

  s.files             = [
    'readme.md',
    'license.md',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/portfolio_controller.rb',
    'app/controllers/portfolio_controller.rb',
    'app/helpers',
    'app/helpers/portfolio_helper.rb',
    'app/models',
    'app/models/images_portfolio_entry.rb',
    'app/models/portfolio_entry.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/portfolio',
    'app/views/admin/portfolio/_form.html.erb',
    'app/views/admin/portfolio/_list.html.erb',
    'app/views/admin/portfolio/_sortable_list.html.erb',
    'app/views/admin/portfolio/edit.html.erb',
    'app/views/admin/portfolio/index.html.erb',
    'app/views/admin/portfolio/new.html.erb',
    'app/views/portfolio',
    'app/views/portfolio/_main_image.html.erb',
    'app/views/portfolio/empty.html.erb',
    'app/views/portfolio/index.html.erb',
    'app/views/portfolio/show.html.erb',
    'config/locales',
    'config/locales/en.yml',
    'config/locales/lv.yml',
    'config/locales/nl.yml',
    'config/locales/pt-BR.yml',
    'config/locales/sl.yml',
    'config/routes.rb',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_portfolio',
    'lib/generators/refinerycms_portfolio/refinerycms_portfolio_generator.rb',
    'lib/generators/refinerycms_portfolio/templates',
    'lib/generators/refinerycms_portfolio/templates/db',
    'lib/generators/refinerycms_portfolio/templates/db/migrate',
    'lib/generators/refinerycms_portfolio/templates/db/migrate/migration_number_create_structure_for_portfolio.rb',
    'lib/generators/refinerycms_portfolio/templates/db/seeds',
    'lib/generators/refinerycms_portfolio/templates/db/seeds/portfolio.rb',
    'lib/portfolio',
    'lib/portfolio/version.rb',
    'lib/portfolio.rb',
    'lib/refinerycms-portfolio.rb',
    'public/javascripts',
    'public/javascripts/portfolio.js',
    'public/stylesheets',
    'public/stylesheets/portfolio.css'
  ]
  
end
