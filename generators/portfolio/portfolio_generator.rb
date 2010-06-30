class PortfolioGenerator < Rails::Generator::NamedBase

  def initialize(*runtime_args)
    # set first argument to the table's name so that the user doesn't have to pass it in.
    runtime_args[0] = ["portfolio_entries"]
    super(*runtime_args)
  end

  def banner
    "Usage: script/generate portfolio"
  end

  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate',
        :migration_file_name => "create_structure_for_portfolio",
        :assigns => {
          :migration_name => "CreateStructureForPortfolio"
        }
    end
  end

end if defined?(Rails::Generator::NamedBase)
