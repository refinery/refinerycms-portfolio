Gem::Specification.new do |s|

  s.name = %q{portfolio}
  s.version = "0.9.1.8"

  s.authors = ["Resolve Digital", "Philip Arndt"]
  s.date = %q{2009-11-21}

  s.description = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with RefineryCMS.}
  s.summary = %q{Ruby on Rails portfolio plugin for RefineryCMS.}

  s.executables = ["portfolio-install"]
  s.default_executable = %q{portfolio-install}

  s.email = %q{info@refinerycms.com}
  s.extra_rdoc_files = ["README", "CONTRIBUTORS", "LICENSE"]
  s.files = ["CONTRIBUTORS","LICENSE","README","app","app/controllers","app/controllers/admin","app/controllers/admin/portfolio_entries_controller.rb","app/controllers/portfolio_controller.rb","app/models","app/models/portfolio_entry.rb","app/views","app/views/admin","app/views/admin/portfolio_entries","app/views/admin/portfolio_entries/_form.html.erb","app/views/admin/portfolio_entries/_list.html.erb","app/views/admin/portfolio_entries/_sortable_list.html.erb","app/views/admin/portfolio_entries/edit.html.erb","app/views/admin/portfolio_entries/index.html.erb","app/views/admin/portfolio_entries/new.html.erb","app/views/portfolio","app/views/portfolio/empty.html.erb","app/views/portfolio/show.html.erb","bin","bin/portfolio-install","config","config/routes.rb","db","db/migrate","db/migrate/20090917224823_create_portfolio_structure.rb","db/migrate/20091121033434_add_position_to_images_portfolio_entries.rb","lib","lib/portfolio.rb","lib/tasks","lib/tasks/portfolio.rake","public","public/javascripts","public/javascripts/portfolio.js","public/stylesheets","public/stylesheets/portfolio.css","rails","rails/init.rb"]
  s.homepage = %q{http://refinerycms.com}
  s.rubygems_version = %q{1.3.4}

end