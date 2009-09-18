namespace :portfolio do
	desc "Install extra files from the portfolio plugin"
	
	task :install do
		plugin_root = File.join(File.dirname(__FILE__), '../../')
		FileUtils::copy_file File.join(plugin_root, 'db', 'migrate', '20090917224823_create_portfolio_structure.rb'), File.join(RAILS_ROOT, 'db', 'migrate', '20090917224823_create_portfolio_structure.rb')
		FileUtils::copy_file File.join(plugin_root, 'public', 'portfolio.css'), File.join(RAILS_ROOT, 'public', 'stylesheets', 'portfolio.css')
		puts "Copied database migration and stylesheet."
		puts "Now, run rake db:migrate and then rake images:regenerate"
	end
end