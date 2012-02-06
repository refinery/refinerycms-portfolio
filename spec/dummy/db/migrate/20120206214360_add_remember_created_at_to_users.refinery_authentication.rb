# This migration comes from refinery_authentication (originally 20110106184757)
class AddRememberCreatedAtToUsers < ActiveRecord::Migration
  def change
    add_column ::Refinery::User.table_name, :remember_created_at, :datetime
  end
end
