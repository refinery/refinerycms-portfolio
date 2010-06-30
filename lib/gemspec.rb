#!/usr/bin/env ruby
require File.expand_path('../portfolio.rb', __FILE__)
version = Refinery::Portfolio::Version::STRING
raise "Could not get version so gemspec can not be built" if version.nil?
files = %w( readme.md license.md  )
%w(app config generators lib public rails test vendor).each do |dir|
  files += Dir.glob("#{dir}/**/*") if File.directory?(dir)
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-portfolio}
  s.version           = %q{#{version}}
  s.description       = %q{A really straightforward open source Ruby on Rails portfolio plugin designed for integration with RefineryCMS}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Ruby on Rails portfolio plugin for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\\ Digital Philip\\ Arndt)
  s.require_paths     = %w(lib)

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("test/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("test")}
end
EOF

if (save = ARGV.delete('-s'))
  if File.exist?(file = File.expand_path("../../refinerycms-portfolio.gemspec", __FILE__))
    File.delete(file)
  end
  File.open(file, 'w') { |f| f.puts gemspec }
else
  puts gemspec
end
