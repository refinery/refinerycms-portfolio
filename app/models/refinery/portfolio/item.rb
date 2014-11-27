module Refinery
  module Portfolio
    class Item < Refinery::Core::BaseModel

      translates :title, :caption

      validates :gallery_id, :numericality => {:allow_nil => true}
      validates :image_id, :presence => true, :numericality => true

      belongs_to :image, :class_name => 'Refinery::Image'
      belongs_to :gallery, :class_name => 'Refinery::Portfolio::Gallery'

      class << self

        def per_page
          ::Refinery::Portfolio.items_per_page
        end

        def root_items
          where(:gallery_id => nil)
        end

        alias_method :orphaned, :root_items
      end

    end
  end
end
