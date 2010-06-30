Refinery::Plugin.register do |plugin|
  plugin.directory = directory
  plugin.title = "Portfolio"
  plugin.description = "Manage a portfolio within RefineryCMS"
  plugin.version = '0.9.6'
  plugin.menu_match = /(admin|refinery)\/portfolio(_entries)?/
  plugin.url = '/refinery/portfolio'
  plugin.activity = {
    :class => PortfolioEntry,
    :title => 'title',
    :url_prefix => 'edit',
    :created_image => "layout_add.png",
    :updated_image => "layout_edit.png"
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
