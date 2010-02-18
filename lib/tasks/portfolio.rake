namespace :refinery do
  namespace :portfolio do
	  desc "Install extra files from the portfolio plugin"

  	task :install do
  		puts `ruby #{File.expand_path(File.dirname(__FILE__) << '/../..')}/bin/refinery-portfolio-install #{Rails.root.to_s}`
  	end
	end
end