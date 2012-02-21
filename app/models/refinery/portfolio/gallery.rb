module Refinery
  module Portfolio
    class Gallery < Refinery::Core::BaseModel
      acts_as_indexed :fields => [:title, :body]
      acts_as_nested_set :dependent => :destroy
      has_friendly_id :title,
        :use_slug => true,
        :default_locale => (::Refinery::I18n.default_frontend_locale rescue :en),
        :approximate_ascii => ::Refinery::Portfolio.approximate_ascii,
        :strip_non_ascii => ::Refinery::Portfolio.strip_non_ascii,
        :scope => :parent

      has_many :items

      attr_accessible :title, :body, :parent_id, :lft, :rgt, :position, :gallery_type, :depth
      alias_attribute :description, :body

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
