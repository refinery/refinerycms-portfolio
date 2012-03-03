# TODO: Add gem version from lib file.

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-portfolio}
  s.version           = %q{2.0.0}
  s.description       = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with Refinery CMS}
  s.date              = %q{2012-02-05}
  s.summary           = %q{Ruby on Rails portfolio plugin for Refinery CMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ['Resolve Digital']
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files`.split("\n")

  s.add_dependency 'refinerycms-core', '~> 2.0.0'
  s.add_dependency 'awesome_nested_set', '~> 2.1.0'
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.0'
end
