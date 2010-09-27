require 'portfolio/version'

unless defined?(::Refinery::Portfolio::Engine)
  require File.expand_path('../refinerycms-portfolio.rb', __FILE__)
end
