Gem::Specification.new do |s|
  s.name              = %q{refinerycms-portfolio}
  s.version           = %q{3.0.0.dev}
  s.description       = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with Refinery CMS}
  s.date              = %q{2012-03-28}
  s.summary           = %q{Ruby on Rails portfolio plugin for Refinery CMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ['Philip Arndt', 'Ugis Ozols', 'Rob Yurkowski']
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files`.split("\n")

  s.add_dependency 'refinerycms-core', '~> 3.0.0.dev'
  s.add_dependency 'refinerycms-acts-as-indexed', '~> 2.0.0'
end
