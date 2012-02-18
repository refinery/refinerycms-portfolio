module Refinery
  module Portfolio
    class Item < ActiveRecord::Base
      attr_accessible :title, :caption, :image_id, :gallery_id
      validates :gallery_id, :numericality => {:allow_nil => true}
      validates :image_id, :presence => true, :numericality => true

      belongs_to :image, :class_name => 'Refinery::Image'
      belongs_to :gallery, :class_name => 'Refinery::Portfolio::Gallery'

      scope :root_items, lambda { where(:gallery_id => nil) }

    end
  end
end
