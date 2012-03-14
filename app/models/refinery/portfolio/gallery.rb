module Refinery
  module Portfolio
    class Gallery < Refinery::Core::BaseModel
      acts_as_indexed :fields => [:title, :body]
      acts_as_nested_set :dependent => :destroy

      extend FriendlyId
      friendly_id :title, :use => [:slugged]
      translates :title, :body

      has_many    :items

      belongs_to  :cover_image, 
                  :class_name => "Refinery::Portfolio::Item",
                  :foreign_key => "cover_image_id"

      attr_accessible   :title, :body, :lft, :rgt,
                        :position, :gallery_type, :depth,
                        :parent_id, :cover_image_id

      alias_attribute :description, :body

      validates :title, :presence => true
    end
  end
end
