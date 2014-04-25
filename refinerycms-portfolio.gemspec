# TODO: Add gem version from lib file.

version = "2.1.0.dev"

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-portfolio}
  s.version           = version
  s.description       = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with Refinery CMS}
  s.date              = %q{2012-03-28}
  s.summary           = %q{Ruby on Rails portfolio plugin for Refinery CMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ['Philip Arndt', 'Ugis Ozols', 'Rob Yurkowski']
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files`.split("\n")

  s.add_dependency 'refinerycms-core', '> 2.1.0'
  s.add_dependency 'awesome_nested_set', '~> 2.1.0'
  s.add_development_dependency 'refinerycms-testing', version
end
