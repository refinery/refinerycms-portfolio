require "refinery/generators"

class RefinerycmsPortfolio < ::Refinery::Generators::EngineInstaller

  source_root File.expand_path("../../../", __FILE__)
  engine_name "portfolio"

end
