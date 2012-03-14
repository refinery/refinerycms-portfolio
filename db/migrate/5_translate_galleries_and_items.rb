class TranslateGalleriesAndItems < ActiveRecord::Migration

  def up
    ::Refinery::Portfolio::Gallery.reset_column_information
    unless defined?(::Refinery::Portfolio::Gallery::Translation) && ::Refinery::Portfolio::Gallery::Translation.table_exists?
      ::Refinery::Portfolio::Gallery.create_translation_table!({
        :title => :string,
        :body => :text
      }, {:migrate_data => true})
    end
    
    ::Refinery::Portfolio::Item.reset_column_information
    unless defined?(::Refinery::Portfolio::Item::Translation) && ::Refinery::Portfolio::Item::Translation.table_exists?
      ::Refinery::Portfolio::Item.create_translation_table!({
        :title => :string,
        :caption => :text
      }, {:migrate_data => true})
    end

  end

  def down
    ::Refinery::Portfolio::Gallery.reset_column_information
    ::Refinery::Portfolio::Gallery.drop_translation_table!

    ::Refinery::Portfolio::Item.reset_column_information
    ::Refinery::Portfolio::Item.drop_translation_table!
  end

end
