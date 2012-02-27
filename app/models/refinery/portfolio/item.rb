module Refinery
  module Portfolio
    class Item < ActiveRecord::Base
      attr_accessible :title, :caption, :image_id, :gallery_id, :position
      validates :gallery_id, :numericality => {:allow_nil => true}
      validates :image_id, :presence => true, :numericality => true

      belongs_to :image, :class_name => 'Refinery::Image'
      belongs_to :gallery, :class_name => 'Refinery::Portfolio::Gallery'

      class << self
        def root_items
          where(:gallery_id => nil)
        end

        alias_method :orphaned, :root_items

        def child_of(gallery_id)
          where(:gallery_id => gallery_id)
        end
      end

    end
  end
end
