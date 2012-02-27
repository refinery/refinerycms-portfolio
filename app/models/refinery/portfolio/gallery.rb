module Refinery
  module Portfolio
    class Gallery < Refinery::Core::BaseModel
      acts_as_indexed :fields => [:title, :body]
      acts_as_nested_set :dependent => :destroy

      extend FriendlyId
      friendly_id :title, :use => [:slugged]

      has_many :items

      attr_accessible :title, :body, :parent_id, :lft, :rgt, :position, :gallery_type, :depth
      alias_attribute :description, :body

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
