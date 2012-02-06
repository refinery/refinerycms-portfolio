# This migration comes from refinery (originally 20101217113424)
class AddLocaleToSlugs < ActiveRecord::Migration
  def self.up
    add_column ::Slug.table_name, :locale, :string

    add_index ::Slug.table_name, :locale
  end

  def self.down
    remove_column ::Slug.table_name, :locale
  end
end
