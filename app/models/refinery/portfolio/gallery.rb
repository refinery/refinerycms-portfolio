module Refinery
  module Portfolio
    class Gallery < Refinery::Core::BaseModel
      acts_as_indexed :fields => [:title, :body]
      acts_as_nested_set :dependent => :destroy

      extend FriendlyId
      friendly_id :title, :use => [:slugged]
      translates :title, :body

      class Translation
        attr_accessible :locale
      end

      has_many    :items

      attr_accessible   :title, :body, :lft, :rgt,
                        :position, :gallery_type, :depth,
                        :parent_id, :locale

      alias_attribute :description, :body

      validates :title, :presence => true

      def cover_image
        items.sort_by(&:position).first if items.present?
      end
    end
  end
end
