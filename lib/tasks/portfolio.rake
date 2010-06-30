namespace :refinery do
  namespace :portfolio do
	  desc "Install extra files from the portfolio plugin"

  	task :install do
  		[%w(db migrate), %w(public stylesheets), %w(public javascripts)].each do |dir|
        Rails.root.join(dir.join(File::SEPARATOR)).mkpath
      end

      portfolio_root = Pathname.new(File.expand_path("../../../", __FILE__))
      copies = [
        {:from => %w(public stylesheets), :to => %w(public stylesheets), :filename => "portfolio.css"},
        {:from => %w(public javascripts), :to => %w(public javascripts), :filename => "portfolio.js"}
      ]
      puts "\nCopying files...\n\n"
    	copies.each do |copy|
        copy_from = portfolio_root.join(copy[:from].join(File::SEPARATOR), copy[:filename])
    	  copy_to = Rails.root.join(copy[:to].join(File::SEPARATOR), copy[:filename])
        unless copy_to.exist? and ENV["force"].presence.to_s != "true"
    	    FileUtils::cp copy_from.to_s, copy_to.to_s
    	    puts "Copied to #{copy_to}"
        else
          puts "'#{File.join copy[:to], copy[:filename]}' already existed in your application so your existing file was not overwritten - use force=true to overwrite."
          puts "Without this file being up to date, the portfolio may not function properly."
        end
      end

    	puts "\nCopied all files."
    	puts "\nGenerating migration..."
    	puts `ruby #{Rails.root.join('script', 'generate').cleanpath.to_s.gsub(/\/$/, '')} portfolio`
    	puts "\nNow, run these tasks:"
    	puts "  rake db:migrate"
    	puts "  rake images:regenerate"
    	puts "\nWe hope you enjoy using our portfolio plugin!\n\n"
  	end
	end
end